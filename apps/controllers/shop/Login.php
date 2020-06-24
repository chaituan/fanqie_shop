<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 后台登录页面
 * @author chaituan@126.com
 */
class Login extends CI_Controller {
	
	public function index() {
		$this->load->view('shop/login');
	}
	
	public function add() {
		if (is_ajax_request ()) {
			$this->load->model ('shop/Shops');
			$check_data = Posts ();
			// 获取登录口令
			$adminuser = $this->Shops->getItem (array('account' => $check_data ['username']),'account,encrypt,status');
			if(!$adminuser)AjaxResult_error('帐号不存在');
			if($adminuser['status']==0||$adminuser['status']==3)AjaxResult_error('帐号审核或异常，无法登录');
			// 密码错误剩余重试次数
			$ip = $this->input->ip_address();
			$this->load->model('admin/Times');
			$rtime = $this->Times->getItem(array(
					'username' => $check_data ['username'],
					'is_admin' => 0 
			));
			$maxloginfailedtimes = 6;
			if ($rtime) {
				if ($rtime ['failure_times'] >= $maxloginfailedtimes) {
					$minute = 60 - floor ( (time () - $rtime ['login_time']) / 60 );
					if ($minute > 1) {
						AjaxResult ( '2', '密码尝试次数过多，被锁定一个小时' );
					} else { // 到时间后删除
						$this->Times->del(array('username' => $adminuser ['account'] ));
					}
				}
			}
			// 验证口令
			$item = $this->Shops->getItem ( array (
					'account' => $adminuser['account'],
					'password' => get_password( $check_data ['password'], $adminuser ['encrypt'] ) 
			));
			if ($item) {
				unset($item['password'],$item['encrypt']);//销毁重要数据
				$this->Times->del(array('username' => $adminuser ['account'])); // 登录成功删除记录
				$this->Shops->set_LoginUser($item);
				AjaxResult_ok ();
			} else {
				// 更新登录次数
				if ($rtime && $rtime ['failure_times'] < $maxloginfailedtimes) {
					$times = $maxloginfailedtimes - intval ( $rtime ['failure_times'] );
					$this->Times->edit ( array (
							'login_ip' => $ip,
							'is_admin' => 0,
							'failure_times' => '+=1' 
					), array (
							'username' => $adminuser ['account']
					) );
				} else {
					$this->Times->add ( array (
							'username' => $adminuser ['account'],
							'login_ip' => $ip,
							'is_admin' => 0,
							'login_time' => time (),
							'failure_times' => 1 
					), false );
					$times = $maxloginfailedtimes;
				}
				AjaxResult ( '2', '密码错误,您还有' . $times . '机会' );
			}
		}
	}

	public function logout() {
		$this->load->model ('shop/Shops');
		$this->Shops->logout ();
	}
}
