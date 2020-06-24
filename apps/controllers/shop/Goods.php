<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 产品管理
 * @author chaituan@126.com
 */
class Goods extends ShopCommon {

    function __construct(){
        parent::__construct();
        if($this->loginUser['send_type']==-1){
            redirect(site_url('shop/manager/send'));
        }
        $this->load->model(array('goods/goodss'=>'do','goods/groups'=>'dos'));
    }
    function index()  {
        $data['gid'] = $gid = Gets('gid')?:1;
        $data['group'] = $this->dos->getCatTree();
        $this->load->view('shop/goods/index',$data);
    }

    function lists(){
        $get = Gets();
        $where = [];
        if($get['gid']==1){
            $where['status'] = 1;
        }elseif ($get['gid']==2){
            $where['status'] = 0;
        }
        $name = Gets('srk');//搜索
        $cate_id = Gets('cate_id');
        if($cate_id)$where['group_id'] = $cate_id;
        if($name)$where['title like'] = "%$name%";
        $page = Gets('page','num');$limit = Gets('limit','num');$total = Gets('total','num');
        $where['shop_id'] = $this->loginUser['id'];
        $data = $this->do->getItems($where,'','id desc',$page,$limit,$total);
        $find = Gets('find');;
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('status'=>Gets('open')),$where);
        is_AjaxResult($result);
    }

    function dels(){
        $where['id'] = Gets('id');
        $where['shop_id'] = $this->loginUser['id'];
        $result = $this->do->del($where);
        is_AjaxResult($result);
    }

    function del(){
        $where['id'] = Gets('id');
        $where['shop_id'] = $this->loginUser['id'];
        $result = $this->do->edit(array('is_del'=>1),$where);
        is_AjaxResult($result);
    }


    function burst(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('burst'=>Gets('open')),$where);
        is_AjaxResult($result);
    }

    function add(){
        if(is_ajax_request()){
            $data = Posts('data');
            $sku = json_decode($data['sku_paths'],true);

            if($sku){
                foreach ($sku as $k=>$v){
                    $sku_titles = $v['titles'];
                    $sku_options = $v['s_options'];
                    $sku_price[$k] = $v['price'];
                    $sku_stock[$k] = $v['stock'];
                }
                $data['sku_titles'] = json_encode($sku_titles,JSON_UNESCAPED_UNICODE );
                $data['sku_options'] = json_encode($sku_options,JSON_UNESCAPED_UNICODE );
                $data['sku_price'] = json_encode($sku_price,JSON_UNESCAPED_UNICODE );
                $data['sku_stock'] = json_encode($sku_stock,JSON_UNESCAPED_UNICODE );
                $data['sku_paths'] = json_encode($sku,JSON_UNESCAPED_UNICODE);
                $data['stock'] = array_sum($sku_stock);
            }else{
                unset($data['sku_paths']);
            }
            $data['content'] = $_POST['data']['content'];
            $t = time();
            $data['add_time'] = $t;
            $data['top_time'] = $t;
            $data['shop_id'] = $this->loginUser['id'];
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $data['group'] = $this->dos->getCatTree();
            $this->load->view('shop/goods/add',$data);
        }
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            $sku = json_decode($data['sku_paths'],true);
            if($sku){
                foreach ($sku as $k=>$v){
                    $sku_titles = $v['titles'];
                    $sku_options = $v['s_options'];
                    $sku_price[$k] = $v['price'];
                    $sku_stock[$k] = $v['stock'];
                }
                $data['sku_titles'] = json_encode($sku_titles,JSON_UNESCAPED_UNICODE );
                $data['sku_options'] = json_encode($sku_options,JSON_UNESCAPED_UNICODE );
                $data['sku_price'] = json_encode($sku_price,JSON_UNESCAPED_UNICODE );
                $data['sku_stock'] = json_encode($sku_stock,JSON_UNESCAPED_UNICODE );
                $data['sku_paths'] = json_encode($sku,JSON_UNESCAPED_UNICODE);
                $data['stock'] = array_sum($sku_stock);
            }else{
                unset($data['sku_paths']);
                $data['sku_titles'] = '';
                $data['sku_options'] = '';
                $data['sku_price'] = '';
                $data['sku_stock'] = '';
                $data['sku_paths'] = '';
            }
            $data['content'] = $_POST['data']['content'];
            $where['id'] = Posts('id');
            $where['shop_id'] = $this->loginUser['id'];
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $where['id'] = Gets('id');
            $where['shop_id'] = $this->loginUser['id'];
            $data['item'] = $item = $this->do->getItem($where);
            $data['group'] = $this->dos->getCatTree();
            $this->load->model('shop/Shops');
            $this->load->view('shop/goods/edit',$data);
        }
    }

    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
            is_AjaxResult($this->do->edit($data,"id=".Posts('id','checkid')));
        }
    }



}
