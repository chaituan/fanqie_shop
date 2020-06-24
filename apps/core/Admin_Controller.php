<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 后台公共类
 *
 * @author chaituan@126.com
 */
class AdminCommon extends CI_Controller {
    protected $adminInfo;
    protected $adminId;
    protected $skipLogController = ['manager'];
    protected $qqmap_key;
    public function __construct() {
        parent::__construct ();
        // 处理url的参数问题
        parseURL($this->uri->segment(5));
        // 实例化菜单数据模型
        $this->load->model(array('admin/AdminRole','admin/AdminUser','admin/AdminMenus','admin/AdminConfig')); // 加载数据模型
        $this->adminInfo = $this->AdminUser->get_LoginUser();
        if (! $this->adminInfo) {
            redirect (HTTP_HOST);
        }
        $this->load->vars('_admin',$this->adminInfo);
        $this->adminId = $this->adminInfo['id'];

        $this->auth = $this->AdminUser->activeAdminAuthOrFail();
        $this->adminInfo['level'] == 0 || $this->checkAuth();
        $this->load->vars('menuList',$this->AdminMenus->menuList());
        $url = $this->router->directory.$this->router->class.'/';
        $this->qqmap_key = $this->AdminConfig->getValue('qqmap_key');
        $this->load->vars('qqmap_key', $this->qqmap_key);
        $footer = $this->AdminConfig->getValue('footer');
        $this->load->vars('footer', $footer);
        //菜单选中
        $params = $this->uri->segment(5);
        $currentOpt = $this->router->directory.$this->router->class.'/'.$this->router->method.($params?'/'.$params:'');
        $select = $this->AdminMenus->getMenuSelect($currentOpt);
        if($select['id_three']||$select['id_two']||$select['id_one']){
            $this->session->set_userdata('selectC',$select);//防止菜单选不中
        }else{
            $select = $this->session->selectC;
        }
        $this->load->vars('menuselect', $select);
        //快捷链接
        $this->load->vars('add_url', site_url($url.'add'));
        $this->load->vars('edit_url', site_url($url.'edit'));
        $this->load->vars('index_url', site_url($url.'index'));
        $this->load->vars ('dr_url', site_url($this->router->directory.$this->router->class));//首页常用链接
    }

    protected function checkAuth($action = null,$controller = null,$module = null,array $route = []){
        $allAuth = $this->AdminRole->getAllAuth();
        $module = $this->router->directory;
        $controller = $this->router->class;
        $action = $this->router->method;
        $route = array();
        if(in_array($controller,$this->skipLogController,true)) return true;
        $nowAuthName = $this->AdminMenus->getAuthName('',$controller,rtrim($module, "/"));
        $a = false;
        foreach ($allAuth as $v){
            if(strstr($v,$nowAuthName)){
               $a = true;
            }
        }
        if(!$a)showmessage('权限出错','error','#','',false);
        $b = false;
        foreach ($this->auth as $v){
            if(strstr($v,$nowAuthName)){
                $b = true;
            }
        }
        if(!$b)showmessage('权限出错','error','#','',false);
//        if(!in_array($nowAuthName,$allAuth))showmessage('权限出错','error','#','',false);
//        if(!in_array($nowAuthName,$this->auth))showmessage('您没有权限访问','error','#','',false);
        return true;
    }

    /**
     * 获得当前用户最新信息 (占时不用)
     * @return SystemAdmin
     */
    protected function getActiveAdminInfo()	{
        $adminId = $this->adminId;
        $adminInfo = $this->AdminUser->getValidAdminInfoOrFail($adminId);
        if(!$adminInfo) $this->failed(SystemAdmin::getErrorInfo('请登陆!'));
        $this->adminInfo = $adminInfo;
        $this->AdminUser->setLoginInfo($adminInfo);
        return $adminInfo;
    }
}
