<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
use EasyWeChat\Payment\Order;
class Mybag extends XcxCheckLoginCommon {
	function index_get(){
	    if(is_ajax_request()){
            $uid = $this->User['id'];
            $this->load->model(array('user/UserBills'=>'do'));
            list($money,$c_money,$x_money) = $this->do->income($uid);
            $data = ['money'=>$money,'c_money'=>$c_money,'x_money'=>$x_money];
            AjaxResult_page($data,'',true);
        }
	}

    function detail_get(){
        if(is_ajax_request()){
            $id = Gets('id');
            $uid = $this->User['id'];
            $this->load->model(array('user/UserBills'=>'do'));
            $where = ['uid'=>$uid];
            if($id==2){
                $this->do->db->where_in('type',[3,4]);
            }elseif($id==3){
                $this->do->db->where_in('type',[4,5]);
            }elseif ($id==1){
                $this->do->db->where_in('type',[1,2,6,7]);
            }
            $result = $this->do->getItems($where,"",'id desc');
            if($result){
                $results = result_format_time($result);
                foreach ($results as &$v){
                    if($v['status']==0){
                        $status = ['color'=>'bg-orange','say'=>'入账失败'];
                    }elseif ($v['status']==1){
                        if($v['type']==1||$v['type']==2||$v['type']==3||$v['type']==6||$v['type']==7){
                            $status = ['color'=>'bg-green','say'=>'入账成功'];
                        }else{
                            $status = ['color'=>'bg-green','say'=>'支出成功'];
                        }

                    }
                    $v['status'] = $status;
                }
            }else{
                $results = '';
            }
            AjaxResult_page($results,'',true);
        }
    }

    //获取余额
    function pay_get(){
	    if(is_ajax_request()){
            $uid = $this->User['id'];
            $this->load->model(array('user/UserBills'=>'do'));
            $total = $this->do->surplus($uid);
            AjaxResult_page($total,'',true);
        }
    }
    //开始充值
    function pay_post(){
	    if(is_ajax_request()){
	        $money = Posts('money');
            $this->load->model(['user/UserBills','user/Users']);
            if($money < 1)AjaxResult_error("最低充值1元");
            $order_id = order_trade_no();
            $openid = $this->Users->get_openid('openid');
            $data = [
                'uid'=>$this->User['id'],
                'order_no'=>$order_id,
                'money'=>$money,
                'src'=>'在线充值',
                'status'=>0,
                'ands'=>'+',
                'type'=>1,
                'add_time'=>time()
            ];
            $id = $this->UserBills->add($data);
            if($id){
                $config = get_Cache('wechatConfig');
                $configs = [
                    'app_id'=>$config['appid'],
                    'secret'=>$config['appsecret'],
                    'payment' => [
                        'merchant_id'=> $config['mchid'],
                        'key'=> $config['key'],
                        'notify_url'=> NOTIFY_URL_CZ
                    ]
                ];
                $app = new Application($configs);
                $payment = $app->payment;
                //订单参数
                $attributes = [
                    'trade_type'=>'JSAPI',
                    'body'=> '账户充值',
                    'detail'=> '账户充值',
                    'out_trade_no'=>$order_id,
                    'total_fee'=> $money * 100,
                    'openid'=> $openid
                ];
                $order = new Order($attributes);
                $result = $payment->prepare($order)->toArray();
                if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
                    $prepayId = $result['prepay_id'];
                    $arr = $payment->configForPayment($prepayId,false);
                    AjaxResult_page(['config'=>$arr,'order_id'=>$id]);
                }else{
                    $this->Bills->del(['id'=>$id]);
                    AjaxResult_error($result['return_code'].':'.$result['return_msg'].$result['result_code'].$result['err_code'].$result['err_code_des']);
                }
            }
            AjaxResult_error('异常错误');
        }
    }
    //充值失败删除
    function pay_delete(){
	    if(is_ajax_request()){
	        $id = Del_Put('id');
            $this->load->model(['user/UserBills']);
            $this->UserBills->del(['id'=>$id]);
            AjaxResult(1,'ok');
        }
    }

    //开始转账给朋友
    function payment_post(){
	    if(is_ajax_request()){
	        $post = Posts();
	        if($post['money'] < 1)AjaxResult_error('转入金额错误');
            $this->load->model(['user/UserBills','user/Users']);
            $user = $this->Users->getItem(['id'=>$post['id']],'id,nickname');
            if(!$user['id'])AjaxResult_error('转入ID错误');
            //自己出账
            $data = [
                'uid'=>$this->User['id'],
                'cid'=>$post['id'],
                'money'=>$post['money'],
                'src'=>'转账给好友【'.$user['nickname'].'】',
                'status'=>1,
                'ands'=>'-',
                'type'=>4,
                'add_time'=>time()
            ];
            $result = $this->UserBills->add($data);
            if($result){
                //好友入账
                $data = [
                    'uid'=>$post['id'],
                    'cid'=>$this->User['id'],
                    'money'=>$post['money'],
                    'src'=>'好友【'.$this->User['nickname'].'】给您转账',
                    'status'=>1,
                    'ands'=>'+',
                    'type'=>3,
                    'add_time'=>time()
                ];
            }
	        $result = $this->UserBills->add($data);
	        AjaxResult_page($result);
        }
    }

}
