<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );
/**
 * 小工具公共类
 * 
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
class Tools_Common extends CI_Controller {
	protected $User;
	function __construct() {
		parent::__construct ();
		// 增加判断是否是微信
		if (strpos ( $_SERVER ['HTTP_USER_AGENT'], 'MicroMessenger' ) === false) {
			// $fwd = http_build_query(array('forward' =>str_replace('.html','',$_SERVER ['REQUEST_URI'])));
			// redirect(base_url("wechat/fq/nowechat?".$fwd));
		}
		parseURL ( $this->uri->segment ( 4 ) );
		// 本地测试使用
		$this->load->model ( 'admin/UserTools_model' );
		$a = $this->UserTools_model->set_LoginUser ( $this->UserTools_model->getItem ( "id=2" ) );
		// 本地测试结束 上线屏蔽
		$this->User = $this->session->tools_user_session; // 获取session
		$this->load->vars ( 'U', $this->User );
	}
	function check() {
		if ($this->User) {
			// $app = new Application(array());
			// $this->load->vars('wxconfig',$app->js->config(array('onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareQZone','onMenuShareWeibo'), false));//,'hideOptionMenu','showMenuItems'
		} else {
			$url = $_SERVER ['REQUEST_URI']; // 为了从哪里进的跳转到哪里去
			$fwd = http_build_query ( array (
					'fwd' => str_replace ( '.html', '', $url ) 
			) );
			$forward = base_url ( '/wechat/login/tools_sign/?' . $fwd );
			$config = array (
					'oauth' => [ 
							'scopes' => [ 
									'snsapi_userinfo' 
							],
							'callback' => $forward 
					] 
			);
			$app = new Application ( $config );
			$response = $app->oauth->scopes ( [ 
					'snsapi_userinfo' 
			] )->redirect ();
			$response->send ();
			die ();
		}
	}
}

// 必须登录先
class Tools_LoginAction extends Tools_Common {
	function __construct() {
		parent::__construct ();
		// 检测登录
		$this->check ();
	}
}
