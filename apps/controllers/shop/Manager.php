<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 后台首页
 * @author chaituan@126.com
 */
class Manager extends ShopCommon {
	
	public function index() {
        $this->load->model(array('admin/AdminUser')); // 加载数据模型
        $data['items'] = $this->AdminUser->tongji_shop($this->loginUser['id']);
		$this->load->view ('shop/index',$data);
	}
	
	public function password() {
		if(is_ajax_request()){
			$oldpass = Posts('oldpass');
			$item = $this->Shops->getItem(array('id'=>$this->loginUser['id']),'password,encrypt');
			$pwd = get_password($oldpass, $item['encrypt']);
			if($pwd != $item['password'])AjaxResult_error('原始密码不正确');
			$new = set_password(Posts('password'));
			$result = $this->Shops->edit(array('password'=>$new['password'],'encrypt'=>$new['encrypt']),"id=".$this->loginUser['id']);
			is_AjaxResult($result);
		}
	}
	
	function set(){
	    if(is_ajax_request()){
            $data = Posts('data');
            $point = explode(',',$data['point']);
            $data['longitude'] = $point[1];
            $data['latitude'] = $point[0];
            unset($data['point']);
            $result = $this->Shops->updates_se($data,$this->loginUser['id']);
            if($result)$this->Shops->edit($data,['id'=>$this->loginUser['id']]);
            is_AjaxResult($result);
        }else{
            $data['item'] = $item =  $this->loginUser;
            $this->load->model(["shop/Locations","user/Users"]);
            $data['location'] = $this->Locations->getItems('','','id desc');
            $data['user'] = $this->Users->getItem(['id'=>$item['uid']],'nickname');
            $this->load->view ('shop/manager/set',$data);
        }
    }

    function get_partner(){
        $this->load->model(['partner/Partners']);
        $items = $this->Partners->getItems(['location_id'=>$this->loginUser['location_id']],'username,mobile,id,send_time');
        $money = $this->AdminConfig->getValue('pmoney');
        foreach ($items as &$v){
            $v['send_money'] = $money;
        }
        AjaxResult_page($items);
    }

    function send(){
	    if(is_ajax_request()){
            $data = Posts();
            $res = $this->Shops->edit($data,['id'=>$this->loginUser['id']]);
            if($res)$this->Shops->updates_se($data,$this->loginUser['id']);
            is_AjaxResult($res);
        }else{
            $data['item'] = $item =  $this->loginUser;
            $type = ['任意包配送（自送）','限额满配送（自送）','任意包配送（平台送）','限额满配送（平台送）','客户自提'];
            $data['type'] = $type;
            $money = $this->AdminConfig->getValue('pmoney');
            $data['field'] = [
                'buy_money'=>$item['buy_money'],
                'send_id'=>$item['send_id']?($item['send_id']):'',
                'send_name'=>$item['send_name'],
                'send_mobile'=>$item['send_mobile'],
                'send_time'=>$item['send_time'],
                'send_money'=>$money,
                'send_type'=>$item['send_type']==-1?'':intval($item['send_type'])
            ];
            $data['partner'] = [];
            if($item['send_id']){
                $this->load->model(['partner/Partners']);
                $items = $this->Partners->getItems(['location_id'=>$this->loginUser['location_id']],'username,mobile,id,send_time');
                foreach ($items as &$v){
                    $v['send_money'] = $money;
                }
                $data['partner'] = $items;
            }
            $this->load->view ('shop/manager/send',$data);
        }

    }
}
