<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 后台登录页面
 * 
 * @author chaituan@126.com
 */
class Login extends CI_Controller {
	public function index() {
		$this->load->view ( 'admin/login' );
	}

	public function add() {
		$this->load->model (array('admin/Times'=>'t_do','admin/AdminUser'=>'a_do'));
		if (is_ajax_request()) {
			$username = Posts('username');
			$password = Posts('password');
			// 获取登录口令
			$adminuser = $this->a_do->getItem(array('account'=>$username),'account,encrypt,status');
			if (! $adminuser)AjaxResult_error ( '帐号不存在' );
			if (! $adminuser['status'])AjaxResult_error('帐号已经锁定');
			// 密码错误剩余重试次数
			$ip = $this->input->ip_address();
			$rtime = $this->t_do->getItem (array('username' => $username,'is_admin' => 1));
			$maxloginfailedtimes = 6;
			if ($rtime) {
				if ($rtime ['failure_times'] >= $maxloginfailedtimes) {
					$minute = 60 - floor ( (time () - $rtime ['login_time']) / 60 );
					if ($minute > 1) {
						AjaxResult_error('密码尝试次数过多，被锁定一个小时');
					} else { // 到时间后删除
						$this->t_do->del(array('username' =>$username));
					}
				}
			}
			// 验证口令
			$item = $this->a_do->getItem(array('account' => $username,'pwd' => get_password($password, $adminuser ['encrypt'])));
			if ($item) {
				unset ( $item ['pwd'], $item ['encrypt'] ); // 销毁重要数据
				$this->t_do->del ( array ('username' => $username) ); // 登录成功删除记录
				$this->a_do->set_LoginUser($item);
				$this->a_do->edit(array('last_time'=>time(),'last_ip'=>$this->input->ip_address()),array('id'=>$item ['id']));
				//更新缓存菜单
				$this->load->driver('cache');
				$this->cache->file->delete('adminmenu/AdminMenu_cache'.$item['id']);
				AjaxResult_ok ();
			} else {
				// 更新登录次数
				if ($rtime && $rtime ['failure_times'] < $maxloginfailedtimes) {
					$times = $maxloginfailedtimes - intval ( $rtime ['failure_times'] );
					$this->t_do->edit (array('login_ip' => $ip,'is_admin' =>1,'failure_times'=>'+=1'), array ('username' => $username));
				} else {
					$this->t_do->add (array('username' => $username,'login_ip' => $ip,'is_admin' => 1,'login_time' => time (),'failure_times' => 1 ));
					$times = $maxloginfailedtimes;
				}
				AjaxResult_error('密码错误,您还有' . $times . '机会');
			}
		}
		$this->load->view('admin/login');
	}
	public function logout() {
		$this->load->model('admin/AdminUser');
		$this->AdminUser->logout();
	}
}
