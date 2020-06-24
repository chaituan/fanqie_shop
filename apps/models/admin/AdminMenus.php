<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 *菜单
 * @author  chaituan@126.com
 */
class AdminMenus extends MY_Model {

    public $isShowStatus = [1=>'显示',0=>'不显示'];

    public $accessStatus = [1=>'管理员可用',0=>'管理员不可用'];

    public function __construct() {
        parent::__construct ();
        $this->table_name = 'system_menus';
    }

    function legalWhere($where = []) {
        $where['is_show'] = 1;
    }

    //选中菜单
    function getMenuSelect($url){
        $items = get_Cache('AdminMenuUrl_cache','adminmenu');
        $m = '';
        $result = array('id_three'=>'','id_two'=>'','id_one'=>'');
        foreach ($items as $v){

            if($v['url']==$url){
                $m = $v;
                $result['id_three'] = $v['id'];
            }
        }

        if($m){
            foreach ($items as $vs){
                if($vs['id']==$m['pid']){
                    $news = array('id'=>$vs['id'],'pid'=>$vs['pid']);
                    $result['id_two'] = $vs['id'];
                }
            }
            foreach ($items as $vss){
                if($vss['id']==$news['pid']){
                    $result['id_one'] = $vss['id'];
                }
            }
        }
        if(!$result['id_one']){
            $result = array('id_three'=>'','id_two'=>$result['id_three'],'id_one'=>$result['id_two']);
        }
        return $result;
    }

    function menuList(){
        $id = $this->AdminUser->get_LoginUser()['id'];
        $cache = get_Cache('AdminMenu_cache'.$id,'adminmenu');
        if(!$cache){
            $cache = $this->setMenuCache();
        }
        return $cache;
    }
    //侧边菜单专用
    function setMenuCache(){
        $id = $this->AdminUser->get_LoginUser()['id'];
        $menusList = $this->getItems(array('is_show'=>1,'access'=>1),'','sort DESC');
        foreach ($menusList as $v){
            $url = $this->getAuthName($v['action'],$v['controller'],$v['module'],$v['params']);
            $m[] = array('id'=>$v['id'],'pid'=>$v['pid'],'url'=>$url);
        }
        $result = $this->tidyMenuTier(true,$menusList);
        set_Cache('AdminMenu_cache'.$id, $result,0,'adminmenu');//
        set_Cache('AdminMenuUrl_cache',$m,0,'adminmenu');//侧边栏菜单选中使用
        return $result;
    }

    function ruleList(){
        $ruleList = $this->getItems('','menu_name as name,id,pid','sort DESC');
        return $ruleList;
    }

    function rolesByRuleList($rules){
        $this->AdminRole->db->where_in('id',explode(',', $rules));
        $res = $this->AdminRole->getItem('','GROUP_CONCAT(rules) as ids');
        $this->db->where('pid',0);
        $this->db->or_where_in('id',explode(',', $res['ids']));
        $ruleList = $this->getItems('','menu_name as name,id,pid','sort DESC');
        return $ruleList;
    }

    function getAuthName($action,$controller,$module,$route = null) {
        return strtolower($module.'/'.$controller.'/'.$action.($route?'/'.$route:''));
    }

    function tidyMenuTier($adminFilter = false,$menusList,$pid = 0,$navList = []){
        static $allAuth = null;
        static $adminAuth = null;
        if($allAuth === null) $allAuth = $adminFilter == true ? $this->AdminRole->getAllAuth() : [];//所有的菜单
        if($adminAuth === null) $adminAuth = $adminFilter == true ? $this->AdminUser->activeAdminAuthOrFail() : [];//当前登录用户的菜单
        foreach ($menusList as $k=>$menu){
            if($menu['pid'] == $pid){
                unset($menusList[$k]);
                $authName = $this->getAuthName($menu['action'],$menu['controller'],$menu['module'],$menu['params']);// 按钮链接
                if($pid != 0 && $adminFilter && in_array($authName,$allAuth) && !in_array($authName,$adminAuth)) continue;
                $menu['child'] = $this->tidyMenuTier($adminFilter,$menusList,$menu['id']);
                if($pid != 0 && !count($menu['child']) && !$menu['controller'] && !$menu['action']) continue;
                $menu['url'] = !count($menu['child']) ? site_url($authName) : 'javascript:void(0);';
                if($pid == 0 && !count($menu['child'])) continue;
                $navList[] = $menu;
            }
        }
        return $navList;
    }

    function getAdminMenu() {
        $items = $this->getItems('','','sort DESC,id DESC');
        $this->load->library('Tree');
        $result = Tree::makeTree($items,array('parent_key' => 'pid'));
        return $result;
    }

    function getMenuTree(){
        $items = $this->getItems('','','sort DESC,id DESC');
        $this->load->library('Tree');
        $result = Tree::makeTreeForHtml($items,array('parent_key' => 'pid'));
        return $result;
    }

    function paramStr($params)
    {
        if(!is_array($params)) $params = json_decode($params,true)?:[];
        $p = [];
        foreach ($params as $key => $param){
            $p[] = $key;
            $p[] = $param;
        }
        return implode('/',$p);
    }




}