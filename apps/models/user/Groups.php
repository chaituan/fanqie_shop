<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 用户分组
 * @author chaituan@126.com
 */

class Groups extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'user_level';
	}

	function getLevel($uid){
        $this->load->model(['user/GroupsDetail'=>'gd','user/Tasks'=>'gdtask']);
        $gdinfo = $this->gd->getItem(['uid'=>$uid],'level_id','id desc');
        $user = ['id'=>0,'name'=>'普通用户','discount'=>'无折扣','image'=>'','icon'=>'','explain'=>''];
        $lvinfo = $this->getLvInfo();
        $level_id = isset($gdinfo['level_id'])?$gdinfo['level_id']:0;
        foreach ($lvinfo as $v){
            if($v['id'] == $level_id){
                $user = $v;
            }
        }
        return $user;
    }

	function getLeveAndNext($uid){
        $this->load->model(['user/GroupsDetail'=>'gd','user/Tasks'=>'gdtask']);
        $gdinfo = $this->gd->getItem(['uid'=>$uid],'','id desc');
        $user = ['id'=>0,'name'=>'普通用户','discount'=>'无折扣','image'=>'','icon'=>'','explain'=>''];
        $next = [];
        $lvinfo = $this->getLvInfo();
        $level_id = isset($gdinfo['level_id'])?$gdinfo['level_id']:0;
        foreach ($lvinfo as $v){
            if($v['id'] == $level_id){
                $v['vipid'] = $gdinfo['id'];
                $v['discount'] = floatval($v['discount']);
                $user = $v;
            }
            if($v['id'] > $level_id){
                $next[] = $v;
            }
        }
        $next = $next?$next[0]:'';
        if($next){
            $task = $this->gdtask->getTashList($next['id'],$uid);
        }else{
            $task = '';
        }
        return ['user'=>$user?$user:'','next'=>$next,'task'=>$task];
    }

    function getLvInfo(){
	    $arr = get_Cache('UserGroup');
	    if(!$arr){
	        $arr = $this->getItems('','id,name,discount,image,icon,explain','id asc');
	        set_Cache('UserGroup',$arr);
        }
	    return $arr;
    }

    function cache(){
        $arr = $this->getItems('','id,name,discount,image,icon,explain','id asc');
        set_Cache('UserGroup',$arr);
    }

}