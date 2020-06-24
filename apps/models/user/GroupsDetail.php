<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 用户分组记录
 * @author chaituan@126.com
 */

class GroupsDetail extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'user_level_detail';
	}

    function setLevelComplete($uid,$leveNowId=false){
        //查找当前需要升级的会员任务
        $this->load->model(['user/Groups','user/Tasks']);
        $taskAll = $this->Tasks->getItems(['level_id'=>$leveNowId],'id');
        if(!$taskAll)AjaxResult_error('未设置等级任务');
        $res2 = false;
        $add_time = time();
        foreach ($taskAll as $v){//根据任务ID来设置任务完成情况，完成则记录到任务完成表
            $this->Tasks->setTaskFinish($v['id'],$uid,$add_time);
        }
        //获取需要成为会员的任务完成度
        $arr = $this->Tasks->getTaskComplete($leveNowId,$uid);
        if($arr){
            //升级
            $res2 = $this->setUserLevel($uid,$leveNowId);
        }
        return $res2;
    }

    function setUserLevel($uid,$level_id){
        $vipinfo = $this->Groups->getItem(['id'=>$level_id]);
        if(!$vipinfo) return false;
        $this->load->model(['user/Users']);
        $userinfo = $this->Users->getItem(['id'=>$uid]);
        if(!$userinfo) return false;
        $data=[
            'is_forever'=>1,
            'status'=>1,
            'is_del'=>0,
            'grade'=>$vipinfo['grade'],
            'uid'=>$uid,
            'add_time'=>time(),
            'level_id'=>$level_id,
            'discount'=>$vipinfo['discount']
        ];
        $data['valid_time'] = 0;
        $data['mark']='尊敬的用户'.$userinfo['nickname'].'在'.date('Y-m-d H:i:s',time()).'成为了'.$vipinfo['name'];
        $id = $this->add($data);
        //更新缓存
        $user = [];
        if($id){
            $user = $this->Users->updates_se(['level'=>$level_id,'role'=>1],['id'=>$uid]);
        }
        return $id?"恭喜您升级为：{$vipinfo['name']}":false;
    }

}