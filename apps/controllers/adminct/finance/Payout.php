<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 提现管理
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
class Payout extends AdminCommon{

    protected $view = '';
    function __construct(){
        parent::__construct();
        $type = Gets('type');
        if($type==1){
            $this->load->model(array('fx/FxBills'=>'do'));
        }elseif($type==2){
            $this->load->model(array('shop/ShopBills'=>'do'));
        }elseif($type==3){
            $this->load->model(array('partner/Bills'=>'do'));
        }
        $this->load->vars('type', $type);
    }

    function index()  {
        $this->load->view('admin/finance/payout/index');
    }

    function lists(){
        $name = Gets('name');//搜索
        $page = Gets('page','checkid');
        $limit = Gets('limit','checkid');
        $total = Gets('total','num');
        $where['type'] = 2;
        if($name)$where['b.nickname'] = $name;
        $data = $this->do->getItems($where,'*','id desc',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function lock(){
        $where['id'] = Gets('id');
        $result = $this->do->edit(array('is_show'=>Gets('open')),$where);
        is_AjaxResult($result);
    }


    function del(){
        $where['id'] = Gets('id');
        $result = $this->do->del($where);
        is_AjaxResult($result);
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');

            $id = Posts('id');
            $item = $this->do->getItem(['id'=>$id,'status<>'=>1]);
            $type = $item['type'];
            if(!$item)AjaxResult_error('已提现');
            $this->load->model('user/Users');
            if($type==1){
                $user = $this->Users->getItem(array('id'=>$item['uid']),'openid,system');
                if($user['system']==1){
                    $config = get_Cache('wechatConfig');
                }else{
                    AjaxResult_error('退款接口错误');
                }
                $configs = [
                    'app_id'=>$config['appid'],
                    'secret'=>$config['appsecret'],
                    'payment' => [
                        'merchant_id'=> $config['mchid'],
                        'key'=> $config['key'],
                        'cert_path'=> $config['certpem'],
                        'key_path'=> $config['keypem']
                    ]
                ];
                $app = new Application($configs);
                $merchantPay = $app->merchant_pay;
                $merchantPayData = [
                    'partner_trade_no' => order_trade_no(),
                    'openid' => $item['wechat']==1?$user['openid']:$user['xcx_openid'],
                    'check_name' => 'NO_CHECK',
                    'amount' => $data['extract_price'] * 100,
                    'desc' => '提现',
                    'spbill_create_ip' => $this->input->ip_address()
                ];
                $result = $merchantPay->send($merchantPayData);
                if($result->return_code == 'SUCCESS' && $result->result_code == 'SUCCESS'){
                    $r = $this->do->edit($data,"id=$id");
                    is_AjaxResult($r);
                }else{
                    AjaxResult_error($result->return_msg);
                }
            }elseif($type==2){
                $where['id'] = $id;
                $result = $this->do->edit($data,$where);
                is_AjaxResult($result);
            }elseif($type==3){
                $where['id'] = $id;
                $result = $this->do->edit($data,$where);
                is_AjaxResult($result);
            }elseif($type==4){
                $where['id'] = $id;
                $result = $this->do->edit($data,$where);
                is_AjaxResult($result);
            }else{
                AjaxResult_error('提现类型错误');
            }
        }else{
            $data['item'] = $item = $this->do->getItem(array('id'=>Gets('id')),'');
            $payout_type_arr = $this->AdminConfig->get_payout_type();
            $payout_type_arr = array_column($payout_type_arr,null,'id');
            $data['item']['type_say'] = $payout_type_arr[$item['payout_type']]['name'];
            $p = json_decode($item['payout_data'],true);
            $say = '';
            if($item['payout_type']==1){
                $say = '姓名：'.$p['username'];
            }elseif($item['payout_type']==2){
                $say = '姓名：'.$p['username']."\r支付宝帐号：".$p['alipay'];
            }elseif($item['payout_type']==3){
                $say = '姓名：'.$p['username']."\r银行：".$p['bank_name']."\r帐号：".$p['bank_no'];
            }elseif($item['payout_type']==4){
                $say = '姓名：'.$p['username']."\r微信帐号：".$p['weixin'];
            }
            $data['item']['type_data'] = $say;
            $this->load->view('admin/finance/payout/edit',$data);
        }
    }

    function edits(){
        if(is_ajax_request()){
            $data = Posts('data');
            is_AjaxResult($this->do->edit($data,"id=".Posts('id','checkid')));
        }
    }


}
