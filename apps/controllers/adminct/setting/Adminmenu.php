<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 菜单管理
 * @author chaituan@126.com
 */
class Adminmenu extends AdminCommon {

    public function index() {
        $data['items'] = $this->AdminMenus->getAdminMenu();
        $this->load->view('admin/setting/menu/index', $data);
    }
    
    function lock(){
    	$id = Gets('id','num');
    	$open = Gets('open','num');
    	if(!$id)AjaxResult_error('失败！获取不到ID');
    	$result = $this->AdminMenus->edit(array('is_show'=>$open),array('id'=>$id));
        $this->cache();
    	is_AjaxResult($result);
    }
    
    function add(){
    	if(is_ajax_request()){
    		$data = Posts('data');
    		$result = $this->AdminMenus->add($data);
    		$this->cache();
    		is_AjaxResult($result);
    	}else{
    		$data['pid'] = Gets('pid','num');
    		$data['menuData'] = $this->AdminMenus->getMenuTree();
    		$this->load->view('admin/setting/menu/add',$data);
    	}
    }
    
    function edit() {
    	if(is_ajax_request()){
    		$data = Posts('data');
    		$result = $this->AdminMenus->edit($data,array('id'=>Posts('id','num')));
    		$this->cache();
    		is_AjaxResult($result);
    	}else{
    		$id = Gets('id','num');
    		$item = $this->AdminMenus->getItem(array('id'=>$id));
    		if(!$item)showmessage('数据不存在','error','#',false);
    		$data['menuData'] = $this->AdminMenus->getMenuTree();
    		$data['item'] = $item;
    		$this->load->view('admin/setting/menu/edit',$data);
    	}
    }
    
    function del(){
    	$id = Gets('id');
    	$item = $this->AdminMenus->getItem(array('pid'=>$id),'id');
    	if($item)AjaxResult_error('请先删除子类');
    	$result = $this->AdminMenus->del(array('id'=>$id));
    	$this->cache();
    	is_AjaxResult($result);
    }
    
	function cache(){
		$this->AdminMenus->setMenuCache();
	}

    function dels(){
        if(is_ajax_request()){
            $data = Posts('del');
            if(!$data)AjaxResult_error('请选择');
            $this->AdminMenus->db->where_in('id',$data);
            $result = $this->AdminMenus->del();
            is_AjaxResult($result);
        }
    }
}
