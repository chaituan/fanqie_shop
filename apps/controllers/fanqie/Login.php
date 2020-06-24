<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 微信登录
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
class Login extends CI_Controller {

    function index(){
        $back = Gets('back');
        $fxid = Gets('uid');
        $fxid = $fxid?"fxid-$fxid":'';
        $forward = site_url("fanqie/login/signin/$fxid?back=".$back);
        $config = get_Cache('wechatConfig');
        $configs = [
            'app_id' => $config['appid'],
            'secret' => $config['appsecret'],
            'oauth' => ['scopes'=> ['snsapi_userinfo'],'callback' => $forward]
        ];
        $app = new Application($configs);
        $response = $app->oauth->scopes(['snsapi_userinfo'])->redirect();
        $response->send();
    }
	
	// 注册
    function signin() {
        parseURL($this->uri->segment(4));
        $this->load->model(['user/Users','admin/AdminConfig']);
        $fwd = $_GET['back'];
        $pid = Gets('fxid');
        // 获取授权登录的微信用户信息
        $config = get_Cache('wechatConfig');
        $configs = [
            'app_id' => $config['appid'],
            'secret' => $config['appsecret']
        ];
        $app = new Application($configs);
        $user = $app->oauth->user()->toArray();
        if ($user['id']) {
            // 数据库是否存在
            $this->Users->wechat_login($user['original'],$pid?$pid:0);
        } else {
            showmessage ( "获取信息失败", 'error' );
        }
        if ($fwd) {
            if (urldecode ( $fwd ) == '/' || urldecode ( $fwd ) == '/?winzoom=1'){
                redirect ( base_url('web'));
            }else{
                redirect (base_url('web/#'.urldecode($fwd)));
            }
        } else {
            redirect ('http://www.chaituans.com');
        }
    }

}
