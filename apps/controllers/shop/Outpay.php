<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 流水
 * @author chaituan@126.com
 */
class Outpay extends ShopCommon {

    function __construct(){
        parent::__construct();
        $this->load->model(array('shop/ShopBills'=>'do'));
    }

    function index()  {
        $data['type'] = $this->AdminConfig->get_payout_type();
        $data['field'] = [
            'payout_type'=>'',
            'uid'=>$this->loginUser['uid'],
            'weixin'=>'',
            'alipay'=>'',
            'bank_name'=>'',
            'bank_no'=>'',
            'username'=>'',
            'money'=>''
        ];
        $money = $this->do->surplus($this->loginUser['id']);
        $data['total'] = $money;
        $shop_config = $this->AdminConfig->getAllConfig(5);
        $data['config'] = ['lowest'=>$shop_config['lowest'],'sxf'=>$shop_config['sxf']];
        $this->load->view('shop/manager/outpay',$data);
    }

    function sub(){
        if(is_ajax_request()){
            $post = Posts();
            $data['payout_type'] = $post['payout_type'];
            $money = $post['money'];
            unset($post['payout_type'],$post['money'],$post['uid']);
            $data['payout_data'] = json_encode($post);
            $shop_config = $this->AdminConfig->getAllConfig(5);
            $result = $this->do->sub($this->loginUser['id'],$money,$shop_config,$data);
            is_AjaxResult($result);
        }
    }




}
