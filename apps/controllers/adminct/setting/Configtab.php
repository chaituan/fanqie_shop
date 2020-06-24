<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 分类控制器
 * @author chaituan@126.com
 */
class Configtab extends AdminCommon {

	function __construct(){
		parent::__construct();
		$this->load->model(array('admin/AdminConfigTab'=>'do','admin/AdminConfig'=>'dos'));
	}
    
	function index(){
       	$data['items'] = $this->do->getItems();
       	$this->load->view('admin/setting/configtab/index',$data);
	}
   	
	function add(){
		if(is_ajax_request()){
			$data = Posts('data');
			is_AjaxResult($this->do->add($data));
		}else{
			$data['types'] = array('系统','公众号','小程序','其他');
			$this->load->view('admin/setting/configtab/add',$data);
		}
	}
   
	function edit(){
	   	if(is_ajax_request()){
	   		$data = Posts('data');
	   		$where['id'] = Posts('id','num');
	   		is_AjaxResult($this->do->edit($data,$where));
	   	}else{
	   		$id = Gets('id');
	   		$data['item'] = $this->do->getItem(array('id'=>$id));
	   		$data['types'] = array('系统','公众号','小程序','其他');
	   		$this->load->view('admin/setting/configtab/edit',$data);
	   	}
	}
   
	function del(){
   		$id = Gets('id');
   		$item = $this->dos->getItem(array('config_tab_id'=>$id),'id');
   		if($item)AjaxResult_error('删除失败，有配置项');
        is_AjaxResult($this->do->del(array('id'=>$id)));
	}
}
