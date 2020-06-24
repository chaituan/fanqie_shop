<?php if (! defined ( 'BASEPATH' )) exit ( 'No direct script access allowed' );
/**
 * 公共类
 * @author chaituan@126.com
 */

use chriskacerguis\RestServer\RestController;
class XcxCommon extends RestController {
    protected $User;
    function __construct() {
        parent::__construct ();
        parseURL($this->uri->segment(4));
    }

    function check(){
//        $this->load->model('user/Users');
//        $this->Users->set_LoginUser($this->Users->getItem(['id'=>3]));
        $this->User = $this->session->wechat_user_x; // 获取session
        if (!$this->User)AjaxResult(5,'需要登录，才能继续操作');
    }

}

class XcxCheckLoginCommon extends XcxCommon{
    protected $Fx_config;
    function __construct() {
        parent::__construct ();
        $this->load->model(['admin/AdminConfig']);
        $this->Fx_config = $this->AdminConfig->getAllConfig(9);
        $this->check();
    }
}



class CheckLoginCommon extends WechatCommon{
    function __construct(){
        parent::__construct ();
        $this->check();
    }
}
use EasyWeChat\Foundation\Application;
class WechatCommon extends CI_Controller {
    protected $User;
    protected $wx = 1;
    protected $start = 0;
    protected $end = 0;
    protected $act_times = 0;
    function __construct() {
        parent::__construct ();
        $wx = 0;
        //增加判断是否是微信
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') && strpos($_SERVER['HTTP_USER_AGENT'], 'Mobile') ) {//微信手机端
            $this->wx = 1;
        }elseif (strpos($_SERVER['HTTP_USER_AGENT'], 'Mobile')){//移动端
            exit('微信端打开');
        }elseif (strpos($_SERVER['HTTP_USER_AGENT'], 'Windows')){//PC端
            exit('微信端打开');
        }
        parseURL($this->uri->segment(4));
        $this->User = $this->session->wechat_user_x; // 获取session
        if($this->User){
            $this->load->vars('U',json_encode(['id'=>$this->User['id'],'avatar'=>$this->User['avatar'],'nickname'=>$this->User['nickname'],'mobile'=>$this->User['mobile']]));
        }
        $this->load->model(['admin/AdminConfig']);
        $config = $this->AdminConfig->getAllConfig(1);
        $this->load->vars('config',$config);
    }

    function check() {
        if ($this->User) {

        } else {

        }
    }
}

class WechatCheckLoginCommon extends WechatCommon {
    function __construct() {
        parent::__construct ();
        $this->check();
    }
}


class HomeComment extends  CI_Controller{
    function __construct() {
        parent::__construct();
        parseURL($this->uri->segment(4));
        $system = admin_config_cache('web');
        $this->load->vars('system',$system);
    }
}