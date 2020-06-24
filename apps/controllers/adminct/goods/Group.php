<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 产品分类
 * @author chaituan@126.com
 */
class Group extends AdminCommon {
	
	function __construct(){
		parent::__construct();
		$this->load->model('goods/Groups','do');
	}

    function index(){
    	$data['items'] = $this->do->getCatTree();
        $this->load->view('admin/goods/group/index',$data);
    }
    
    function add(){
    	if(is_ajax_request()){
    		$data = Posts('data');
    		$result = $this->do->add($data);
    		is_AjaxResult($result);
    	}else{
    		$pid = Gets('pid','num');
    		$data['pid'] = $pid?$pid:0;
    		$data['cat'] = $this->do->getCatTree();
    		$this->load->view('admin/goods/group/add',$data);
    	}
    }
    
    function edit(){
    	if(is_ajax_request()){
    		$data = Posts('data');
    		$result = $this->do->edit($data,array('id'=>Posts('id','num')));
    		is_AjaxResult($result);
    	}else{
    		$data['cat'] = $this->do->getCatTree();
    		$data['item'] = $this->do->getItem(array('id'=>Gets('id','id')));
    		$this->load->view('admin/goods/group/edit',$data);
    	}
    }

    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('status'=>Gets('open')),$where);
        is_AjaxResult($result);
    }
    
    function del(){
    	$id = Gets('id','num');
    	$item = $this->do->getItem(array('pid'=>$id));
    	if($item)AjaxResult_error('删除失败，还有子类');
    	$result = $this->do->del(array('id'=>$id));
    	is_AjaxResult($result);
    }
    

}
