<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 管理员角色数据模型
 * @author  chaituan@126.com
 */
class AdminRole extends MY_Model {
	
	public function __construct() {
		parent::__construct ();
		$this->table_name = 'system_role';
	}
	
	public static function setRulesAttr($value){
		return is_array($value) ? implode(',',$value) : $value;
	}
	
	public function rolesByAuth($rules){
		if(empty($rules)) return [];
		$rules = $this->getItems("id in ($rules) and status=1",'rules');
		$rules = $rules[0]['rules'];
		$rules = implode(',', array_unique(explode(',',$rules)));
		$_auth = $this->AdminMenus->getItems("id in ($rules) and (controller<>'' or action<>'') ",'module,controller,action,params');
		return $this->tidyAuth($_auth?:[]);
	}
	
	public function getAllAuth() {
		$auth = $this->AdminMenus->getItems("controller<>'' or action<>'' ",'module,controller,action,params');
		return $this->tidyAuth($auth?:[]);
	}
	
	protected function tidyAuth($_auth)	{
		$auth = [];
		foreach ($_auth as $k=>$val){
			$auth[] =   $this->AdminMenus->getAuthName($val['action'],$val['controller'],$val['module'],$val['params']);
		}
		return $auth;
	}
	
} 