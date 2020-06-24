<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 管理员
 * @author chaituan@126.com
 */
class Tpl extends AdminCommon {
    function __construct(){
        parent::__construct();
        $this->load->model(array('admin/Tpls'=>'do'));
    }
	
	function index() {
        if(is_ajax_request()){
            $post = Posts('data');
            $data['page_data'] = json_encode($post);
            $result = $this->do->edit($data);
            is_AjaxResult($result);
        }else{
            $item = $this->do->getItem();
            $data['page_data'] = $item['page_data'];
            $this->load->view('admin/setting/tpl/index',$data);
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
