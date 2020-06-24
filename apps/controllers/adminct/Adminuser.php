<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 管理员
 * 
 * @author chaituan@126.com
 */
class Adminuser extends AdminCommon {
	function index() {
		$this->load->view ( 'admin/adminuser/index' );
	}
	function lists() {
		$name = Gets ( 'name' ); // 搜索
		$page = Gets ( 'page', 'checkid' );
		$limit = Gets ( 'limit', 'checkid' );
		$total = Gets ( 'total', 'num' );
		$where = $name ? "id not in(1,2) and name like '%$name%' or username like '%$name%'" : 'id not in(1,2)';
		$data = $this->AdminUser_model->getItems ( $where, '*', '', $page, $limit, $total );
		$find = Gets ( 'find' );
		if (($name && $find) || ! $total) {
			$total = $this->AdminUser_model->count;
		}
		f_ajax_lists ( $total, $data );
	}
	
	// 编辑
	function edit() {
		if (is_ajax_request ()) {
			$data = Posts ( 'data' );
			$id = Posts ( 'id', 'checkid' );
			if (in_array ( $id, array (
					1,
					2 
			) ))
				AjaxResult_error ( '对不起,您的操作不合法' );
			is_AjaxResult ( $this->AdminUser_model->updates ( $data, array (
					'id' => $id 
			) ) );
		} else {
			$this->load->model ( 'admin/AdminRole_model', 'do' );
			$data ['role'] = $this->do->getItems ( '', 'id,name' );
			$id = Gets ( 'id', 'checkid' );
			if (in_array ( $id, array (
					1,
					2 
			) ))
				showmessage ( '对不起,您的操作不合法', 'error' );
			$item = $this->AdminUser_model->getItem ( "id=$id", 'name,summary,id,role_id' );
			$data ['item'] = $item;
			$this->load->view ( 'admin/adminuser/edit', $data );
		}
	}
	
	// 添加
	function add() {
		if (is_ajax_request ()) {
			$data = Posts ( 'data' );
			// 自动添加密码 12345678
			$data ['password'] = set_password ( '12345678' );
			$data ['add_time'] = time ();
			is_AjaxResult ( $this->AdminUser_model->add ( $data ) );
		} else {
			$this->load->model ( 'admin/AdminRole_model', 'do' );
			$data ['role'] = $this->do->getItems ( '', 'id,name', 'id desc' );
			$this->load->view ( 'admin/adminuser/add', $data );
		}
	}
	function del() {
		$id = Gets ( 'id', 'checkid' );
		if (in_array ( $id, array (
				1,
				2 
		) ))
			showmessage ( '对不起,您的操作不合法', 'error' );
		$result = $this->AdminUser_model->deletes ( array (
				'id' => $id 
		) );
		is_AjaxResult ( $result );
	}
	function dels() {
		$data = Posts ();
		if (! $data)
			AjaxResult_error ( '没有选中要删除的' );
		$ids = implode ( ',', $data ['checked'] );
		if (strstr ( $ids, '1' ) || strstr ( $ids, '2' ))
			AjaxResult_error ( '删除异常' );
		$result = $this->AdminUser_model->deletes ( "id in ($ids)" );
		if ($result) {
			AjaxResult ( 1, "删除成功", $data ['checked'] );
		} else {
			AjaxResult ( 2, "删除失败" );
		}
	}
	function lock() {
		$id = Gets ( 'id', 'checkid' );
		if (in_array ( $id, array (
				1,
				2 
		) ))
			showmessage ( '对不起,您的操作不合法', 'error' );
		$open = Gets ( 'open', 'checkid' );
		$result = $this->AdminUser_model->updates ( array (
				'state' => $open 
		), array (
				'id' => $id 
		) );
		is_AjaxResult ( $result );
	}
	
	// 小心使用
	function edit_pwd() {
		if (is_ajax_request ()) {
			$data = Posts ();
			if (in_array ( $data ['id'], array (
					1,
					2 
			) ))
				AjaxResult_error ( '修改异常' );
			$new = set_password ( $data ['pwd'] );
			$result = $this->AdminUser_model->updates ( array (
					'password' => $new ['password'],
					'encrypt' => $new ['encrypt'] 
			), "id=" . $data ['id'] );
			is_AjaxResult ( $result );
		}
	}
	
	// 导出
	function export() {
		showmessage ( '此功能占时不开通', 'waiting' );
	}
}
