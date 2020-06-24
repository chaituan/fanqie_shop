<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 文章分类
 * @author chaituan@126.com
 */
class Category extends AdminCommon {
	
	function __construct(){
		parent::__construct();
		$this->load->model('news/Articles_group','do');
	}

    function index(){
        $items = $this->do->get_cat(false);
        $data ['items'] = $items;
        $this->load->view('admin/news/category/index',$data);
    }
    
    function add(){
    	if(is_ajax_request()){
    		$data = Posts('data');
    		$result = $this->do->add($data);
    		is_AjaxResult($result);
    	}else{
            $items = $this->do->get_cat();
            $data['parent'] = $items;
    		$this->load->view('admin/news/category/add',$data);
    	}
    }
    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('status'=>Gets('open')),$where);
        is_AjaxResult($result);
    }
    function edit(){
    	if(is_ajax_request()){
    		$data = Posts('data');
    		$result = $this->do->edit($data,array('id'=>Posts('id','num')));
    		is_AjaxResult($result);
    	}else{
            $items = $this->do->get_cat();
            $data['parent'] = $items;
    		$data['item'] = $this->do->getItem(array('id'=>Gets('id','id')));
    		$this->load->view('admin/news/category/edit',$data);
    	}
    }
    
    function del(){
    	$id = Gets('id','num');
    	$result = $this->do->del(array('id'=>$id));
    	is_AjaxResult($result);
    }
    

}
