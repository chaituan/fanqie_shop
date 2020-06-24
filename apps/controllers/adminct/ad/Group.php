<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 广告分组
 * @author chaituan@126.com
 */
class Group extends AdminCommon {


	function __construct(){
		parent::__construct();
		$this->load->model('ad/AdGroup','do');
	}

    function index() {
        $this->load->view('admin/ad/group/index');
    }

    function lists(){
        $name = Gets('name');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where = '';
        $data = $this->do->getItems($where,'','',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function add(){
        if(is_ajax_request()){
            $data = Posts('data');
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $this->load->view('admin/ad/group/add');
        }
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            $where['id'] = Posts('id');
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $data['item'] = $this->do->getItem(array('id'=>Gets('id')),'');
            $this->load->view('admin/ad/group/edit',$data);
        }
    }

    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
            is_AjaxResult($this->do->edit($data,"id=".Posts('id','checkid')));
        }
    }

    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('status'=>Gets('open')),$where);
        is_AjaxResult($result);
    }

    function del(){
        $where['id'] = Gets('id');
        $this->load->model('ad/Ads','dos');
        $item = $this->dos->getItem(array('gid'=>$where['id']));
        if($item)AjaxResult_error('该分类下有数据，删除失败');
        $result = $this->do->del($where);
        is_AjaxResult($result);
    }
    

}
