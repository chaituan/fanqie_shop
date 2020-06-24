<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 角色管理
 * @author chaituan@126.com
 */
class Adminroles extends AdminCommon {


    function index() {
        $this->load->view('admin/setting/roles/index');
    }
    
    function lists(){
    	$name = Gets('name');//搜索
    	$page = Gets('page','checkid');
    	$limit = Gets('limit','checkid');
    	$total = Gets('total','num');
    	$where['level'] = bcadd($this->adminInfo['level'],1,0);
    	$data = $this->AdminRole->getItems($where,'','',$page,$limit,$total);
    	$find = Gets('find');
    	if(($name&&$find)||!$total){
    		$total = $this->AdminRole->count;
    	}
    	f_ajax_lists($total, $data);
    }
    
    function add(){
    	if(is_ajax_request()){
    		$data = Posts('data');
    		$rules = Posts('rules');
    		$data['rules'] = implode(',', $rules);
    		$data['level'] = $this->adminInfo['level']+1;
    		$result = $this->AdminRole->add($data);
    		is_AjaxResult($result);
    	}else{
    		$this->load->view('admin/setting/roles/add');
    	}
    }
    
    function edit() {
    	 if(is_ajax_request()){
    	 	$data = Posts('data');
    		$rules = Posts('rules');
    		$data['rules'] = implode(',', $rules);
    		$where['id'] = Posts('id');
    		$result = $this->AdminRole->edit($data,$where);
    		is_AjaxResult($result);
    	 }else{
    	 	$d['id'] = Gets('id');
    	 	$data['item'] = $this->AdminRole->getItem($d);
    	 	$this->load->view('admin/setting/roles/edit',$data);
    	 }
    }
    
    function del(){
    	$where['id'] = Gets('id');
    	$result = $this->AdminRole->del($where);
    	is_AjaxResult($result);
    }
    
    function edits(){
    	if(is_ajax_request()){
    		$data = Posts('data');
    		is_AjaxResult($this->AdminRole->edit($data,"id=".Posts('id','checkid')));
    	}
    }
    
    function lock(){
    	$where['id'] = Gets('id');
    	$result = $this->AdminRole->edit(array('status'=>Gets('open')),$where);
    	is_AjaxResult($result);
    }
    
    function getroles(){
    	if(is_ajax_request()){
    		$r = Posts('rules');
    		$menus = $this->adminInfo['level'] == 0 ? $this->AdminMenus->ruleList() : $this->AdminMenus->rolesByRuleList($this->adminInfo['roles']);
    		AjaxResult(1,$r?explode(',', $r):'',$menus);
    	}
    }

}
