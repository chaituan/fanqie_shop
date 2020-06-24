<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 角色
 * @author chaituan@126.com
 */
class Adminrole extends AdminCommon {
	function __construct() {
		parent::__construct ();
		$this->load->model ( 'admin/AdminRole_model', 'do' );
	}
	function index() {
		$data ['val'] = Gets ( 'val' );
		$where = 'id<>1';
		if ($data ['val']) {
			$where = "and name like %{$data['val']}%";
		}
		$data ['items'] = $this->do->getItems ( $where, 'id,name,summary,add_time' );
		$this->load->view ( 'admin/adminrole/index', $data );
	}
	function permission() {
		$uid = $this->loginUser ['id'];
		if (is_ajax_request ()) {
			$data = Posts ();
			$id = $data ['id'];
			unset ( $data [0], $data ['id'] );
			if ($this->loginUser ['id'] != 1) {
				if (in_array ( $id, array (
						1 
				) ))
					AjaxResult_error ( '对不起,您的操作不合法' );
			}
			$permissions = urlencode ( json_encode ( $data ) );
			$result = $this->do->updates ( array (
					'permissions' => $permissions 
			), array (
					'id' => $id 
			) );
			is_AjaxResult ( $result );
		} else {
			$id = Gets ( 'id', 'num' );
			if ($this->loginUser ['id'] != 1) {
				if (in_array ( $id, array (
						1 
				) ))
					showmessage ( '对不起,您的操作不合法', 'error' );
			}
			$item = $this->do->getItem ( "id=$id", 'name,summary,id,permissions' );
			$data ['item'] = $item;
			$this->config->load ( 'adminpermission', false, true );
			$items = $this->config->item ( 'adminpermission' );
			foreach ( $items as $k => $v ) {
				if ($uid == 1 && ! in_array ( $k, array (
						'config',
						'menu',
						'menugroup' 
				) )) {
					$new [$k] = $v;
				} elseif ($uid != 1 && ! in_array ( $k, array (
						'adminuser',
						'adminrole',
						'config',
						'menu',
						'menugroup' 
				) )) {
					$new [$k] = $v;
				}
			}
			$data ['items'] = $new;
			$data ['permissions'] = json_decode ( urldecode ( $item ['permissions'] ), true );
			$this->load->view ( 'admin/adminrole/permission', $data );
		}
	}
	
	// 编辑
	function edit() {
		if (is_ajax_request ()) {
			$data = Posts ( 'data' );
			$id = Posts ( 'id', 'checkid' );
			if (in_array ( $id, array (
					1 
			) ))
				AjaxResult_error ( '对不起,您的操作不合法' );
			is_AjaxResult ( $this->do->updates ( $data, array (
					'id' => $id 
			) ) );
		} else {
			$id = Gets ( 'id', 'checkid' );
			if (in_array ( $id, array (
					1 
			) ))
				showmessage ( '对不起,您的操作不合法', 'error' );
			$item = $this->do->getItem ( "id=$id", 'name,summary,id' );
			$data ['item'] = $item;
			$this->load->view ( 'admin/adminrole/edit', $data );
		}
	}
	// 添加
	function add() {
		if (is_ajax_request ()) {
			$data = Posts ( 'data' );
			$data ['add_time'] = time ();
			is_AjaxResult ( $this->do->add ( $data ) );
		} else {
			$this->load->view ( 'admin/adminrole/add' );
		}
	}
	function del() {
		$id = Gets ( 'id', 'checkid' );
		if ($this->loginUser ['id'] != 1) {
			if ($id == 1)
				showmessage ( '对不起,您的操作不合法', 'error' );
		}
		
		$result = $this->do->deletes ( array (
				'id' => $id 
		) );
		is_AjaxResult ( $result );
	}
}
