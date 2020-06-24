<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 文件管理
 * @author chaituan@126.com
 */
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;
use Qiniu\Storage\BucketManager;
class Images extends CI_Controller {

    function __construct() {
        parent::__construct();
        parseURL($this->uri->segment(5));
        $url = $this->router->directory.$this->router->class.'/';
        $this->load->vars('add_url', site_url($url.'add'));
        $this->load->vars('edit_url', site_url($url.'edit'));
        $this->load->vars('index_url', site_url($url.'index'));
        $this->load->vars ('dr_url', site_url($this->router->directory.$this->router->class));//首页常用链接
        $this->load->model(array('admin/Attachment'=>'do','admin/AttachmentCategory'=>'do_cat'));
    }

    function index() {
        $data['s'] = $s = Gets('s')?Gets('s'):0;
        $pid = Gets('pid','num');
        $data['classs'] = Gets('classs');//主要用于多个上传组件区别
        if(!$data['classs'])showmessage('参数错误','error','#','',false);
        $data['typearray'] = $this->do_cat->getAll(['shop_id'=>$s]);
        $data['pid'] = $pid?$pid:0;
        $page = Gets('per_page')?Gets('per_page'):1;
        $limit = 10;
        if($data['pid']){
            $where['pid'] = $data['pid'];
        }
        $where['shop_id'] = $s;
        $data['items'] = $this->do->getItems($where,'','att_id desc',$page,$limit);
        $data['pagemenu'] = $this->do->pagemenu;
        foreach ($data['items'] as &$item){
            if($item['att_size']){
                $item['att_dir'] = $item['att_dir'];
            }
        }
        $this->load->view('admin/widget/images',$data);
    }

    function upload(){
        $pid = Gets('pid');
        $s = Gets('s');//商家shop_id
        if(isset($_FILES['upfile'])){
            $cat = $this->do_cat->getItem(['pid'=>0],'id','id');
            $pid = $cat['id'];
            $file_name = 'upfile';
        }else{
            if($pid==='')AjaxResult_error('上传分类出错');
            $file_name = 'file';
        }
        $this->load->model(['admin/AdminConfig']);
        $qiniu = $this->AdminConfig->getAllConfig(22);
        $fileInfo = [];
        if($qiniu['is_qiniu']){
            $accessKey = $qiniu['accesskey'];
            $secretKey = $qiniu['secretkey'];
            $auth = new Auth($accessKey, $secretKey);
            $token = $auth->uploadToken($qiniu['bucket']);
            $uploadMgr = new UploadManager();
            $realPath = $_FILES[$file_name]['tmp_name'];
            $name = uniqid(time()).'.'.explode('.',$_FILES[$file_name]["name"])[1];
            list($result, $error) = $uploadMgr->putFile($token, $name, $realPath);
            if($error){
                AjaxResult_error($error->message());
            }else{
                $fileInfo['name'] = $name;
                $fileInfo['time'] = time();
                $fileInfo['att_dir'] = $qiniu['domain'].'/'.$name;
            }
        }else{
            $this->load->library('UploadService');
            $fileInfo = UploadService::image($file_name,'images'.DS.date('Y').DS.date('m').DS.date('d'));
        }
        $fileInfo['pid'] = $pid;
        $fileInfo['shop_id'] = $s?$s:0;
        $this->do->add($fileInfo);
        if($qiniu['is_qiniu']){

        }else{
            $fileInfo['att_dir'] = base_url($fileInfo['att_dir']);
        }
        if($file_name=='upfile'){
            echo json_encode ( ['state'=>'SUCCESS','url'=>$fileInfo['att_dir']] );
            exit;
        }
        AjaxResult(1,'添加成功',$fileInfo['att_dir']);
    }

    /**
     * 删除图片
     */
    function delete(){
        if(is_ajax_request()){
            $data = Posts('imageid');
            if(empty($data))AjaxResult_error('还没选择要删除的图片');
            foreach ($data as $v){
                self::deleteimganddata($v);
            }
            AjaxResult_ok('删除成功');
        }
    }

    /**删除图片和数据记录
     * @param $att_id
     */
    function deleteimganddata($id){
        $attinfo = $this->do->getItem(array('att_id'=>$id));
        if($attinfo){
            if($attinfo['att_size']){
                if($attinfo['att_dir'])@unlink(FCPATH.$attinfo['att_dir']);
                if($attinfo['satt_dir'])@unlink(ROOT_PATH.$attinfo['satt_dir']);
            }else{
                $this->load->model(['admin/AdminConfig']);
                $qiniu = $this->AdminConfig->getAllConfig(21);
                if($qiniu['is_qiniu']){
                    $accessKey = $qiniu['accesskey'];
                    $secretKey = $qiniu['secretkey'];
                    $auth = new Auth($accessKey, $secretKey);
                    $config = new \Qiniu\Config();
                    $bucketManager = new BucketManager($auth, $config);
                    $err = $bucketManager->delete($qiniu['bucket'], $attinfo['name']);
                    if ($err) {
                        AjaxResult_error($err->message());
                    }
                }
            }
            $this->do->del(['att_id'=>$id]);
        }
    }

    function get_qiniu(){
        $this->load->model(['admin/AdminConfig']);
        $qiniu = $this->AdminConfig->getAllConfig(21);
        if($qiniu['is_qiniu']){
            $accessKey = $qiniu['accesskey'];
            $secretKey = $qiniu['secretkey'];
            $auth = new Auth($accessKey, $secretKey);
            $bucketManager = new BucketManager($auth);
            // 要列取文件的公共前缀
            $prefix = '';
            $marker = '';
            $limit = 1000;
            $delimiter = '/';
            list($ret, $err) = $bucketManager->listFiles($qiniu['bucket'], $prefix, $marker, $limit, $delimiter);
            if ($err) {
                AjaxResult_error($err->message());
            }

            if($ret['items']){
                $cat = $this->do_cat->getItem(['pid'=>0],'id','id asc');
                if(!$cat)AjaxResult_error('无分类，无法同步');
                foreach ($ret['items'] as $item){
                    $fileInfo['name'] = $item['key'];
                    $fileInfo['time'] = time();
                    $fileInfo['att_dir'] = $qiniu['domain'].'/'.$item['key'];
                    $fileInfo['pid'] = $cat['id'];
                    $this->do->add($fileInfo);
                }
            }
            AjaxResult_ok('成功获取 '.count($ret['items']).' 个文件');
        }
    }
    /**
     * 移动图片分类显示
     */
    function moveimg(){
        if(is_ajax_request()){
            $id = Posts('images');
            $data = Posts('data');
            $result = $this->do->edit($data,"att_id in ($id)");
            is_AjaxResult($result);
        }else{
            $s = Gets('s');
            $data['s'] = $s;
            $data['images'] = Gets('images');
            $data['items'] = $this->do_cat->getCatTree(['shop_id'=>$s]);
            $this->load->view('admin/widget/move',$data);
        }

    }
    /**
     * 添加分类
     */
    function add(){
        if(is_ajax_request()){
            $data = Posts('data');
            $result = $this->do_cat->add($data);
            is_AjaxResult($result);
        }else{
            $s = Gets('s');
            $data['s'] = $s;
            $data['items'] = $this->do_cat->getCatTop(['shop_id'=>$s]);
            $this->load->view('admin/widget/add',$data);
        }
    }

    /**
     * 编辑分类
     */
    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            $result = $this->do_cat->edit($data,array('id'=>Posts('id','num')));
            is_AjaxResult($result);
        }else{
            $id = Gets('id','num');
            $s = Gets('s');
            $data['s'] = $s;
            $items = $this->do_cat->getCatTop(['shop_id'=>$s]);
            $data['item'] = $this->do_cat->getItem(array('id'=>$id));
            $data['items'] = $items;
            $this->load->view('admin/widget/edit',$data);
        }
    }

    /**
     * 删除分类
     */
    function del(){
        if(is_ajax_request()){
            $id = Posts('id','num');
            $item = $this->do->getItem(array('pid'=>$id));
            if($item)AjaxResult_error('删除失败，分类下有图片');
            $cat = $this->do_cat->getItem(array('pid'=>$id));
            if($cat)AjaxResult_error('删除失败，分类下有子分类');
            $result = $this->do_cat->del(array('id'=>$id));
            is_AjaxResult($result);
        }
    }

}
