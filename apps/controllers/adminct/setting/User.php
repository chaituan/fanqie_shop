<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 管理员
 * @author chaituan@126.com
 */
class User extends AdminCommon {

	
	function index() {
		$this->load->view('admin/setting/user/index');
	}
	
	function lists(){
		$name = Gets('name');//搜索
		$page = Gets('page','checkid');
		$limit = Gets('limit','checkid');
		$total = Gets('total','num');
		$join = array('table'=>'system_role as b','cond'=>'a.level=b.id','type'=>'','ytable'=>'system_admin as a');
		$where['a.level'] = bcadd($this->adminInfo['level'],1,0);
		$data = $this->AdminUser->getItems_join($join,$where,'a.account,a.real_name,a.last_time,a.last_ip,a.status,a.id,b.role_name','',$page,$limit,$total);
		$find = Gets('find');
		if(($name&&$find)||!$total){
			$total = $this->AdminUser->count;
		}
		f_ajax_lists($total, $data);
	}

	function add(){
		if(is_ajax_request()){
			$data = Posts('data');
			$data['level'] = $this->adminInfo['level']+1;
			$data['add_time'] = time();
			$data['last_time'] = time();
			$mdpwd = set_password($data['pwd']);
			$data['pwd'] = $mdpwd['password'];
			$data['encrypt'] = $mdpwd['encrypt'];
			$result = $this->AdminUser->add($data);
			is_AjaxResult($result);
		}else{
			$data['role'] = $this->AdminRole->getItems(array('level'=>bcadd($this->adminInfo['level'],1,0)),'id,role_name');
			if(!$data['role'])showmessage('请先添加角色','waiting','#','',false);
			$this->load->view('admin/setting/user/add',$data);
		}
	}
	
	function edit(){
		if(is_ajax_request()){
			$data = Posts('data');
			$where['id'] = Posts('id');
			$result = $this->AdminUser->edit($data,$where);
			is_AjaxResult($result);
		}else{
			$data['item'] = $this->AdminUser->getItem(array('id'=>Gets('id')),'real_name,id,status,roles');
			$data['role'] = $this->AdminRole->getItems(array('level'=>bcadd($this->adminInfo['level'],1,0)),'id,role_name');
			$this->load->view('admin/setting/user/edit',$data);
		}
	}
	
	function edits(){
		if(is_ajax_request()){
			$data = Posts('data');
			if(array_keys($data)[0]=='pwd'){
				$pwd = set_password($data['pwd']);
				unset($data['pwd']);
				$data['pwd'] = $pwd['password'];
				$data['encrypt'] = $pwd['encrypt'];
			}
			is_AjaxResult($this->AdminUser->edit($data,"id=".Posts('id','checkid')));
		}
	}
	
	function lock(){
		$where['id'] = Gets('id');
		$result = $this->AdminUser->edit(array('status'=>Gets('open')),$where);
		is_AjaxResult($result);
	}
	
	function del(){
		$where['id'] = Gets('id');
		$result = $this->AdminUser->del($where);
		is_AjaxResult($result);
	}
	
}
