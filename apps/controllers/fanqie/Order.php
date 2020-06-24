<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 小程序API
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
use EasyWeChat\Payment\Order as Orders;
class Order extends XcxCheckLoginCommon {

    function index_get(){
        if(is_ajax_request()){
            $data['uid'] = $this->User['id'];
            $data['id'] = Gets('id');//状态ID
            $this->load->model(array('goods/Orders'=>'do'));
            $result = $this->do->lists($data);
            AjaxResult_page($result,'',true);
        }
    }

    function detail_get(){
        if(is_ajax_request()){
            $id = Gets('id');
            $this->load->model(array('goods/Orders'=>'do','goods/Orders_lists'=>'dos'));
            $where['id'] = $id;
            $item = $this->do->getItem($where);
            $item['pay_type_say'] = $item['pay_type']==1?'微信支付':'余额支付';
            $items = $this->dos->getItems(['order_id'=>$item['id']]);
            if(!$item)AjaxResult_error('数据错误');

            if($item['status']==1){
                $item['btn'] = ['click'=>'onPay','class'=>'bg-gradual-green','name'=>'点击支付'];
                $say = '请支付该订单';
            }elseif($item['status']==2){
                $item['btn'] = ['click'=>'onOutpay','class'=>'bg-gradual-red','name'=>'申请退款'];
                $say = '支付成功，商家拣货中...';
            }elseif($item['status']==3){
                $item['btn'] = ['click'=>'onQrcode','class'=>'bg-gradual-orange','name'=>'收货二维码'];
                $say = '商家配送中...';
            }elseif($item['status']==33){
                $item['btn'] = ['click'=>'onQrcode','class'=>'bg-gradual-orange','name'=>'取货二维码'];
                $say = '请及时去商家取您的货物';
            }elseif($item['status']==4){
                $item['btn'] = ['click'=>'onAssess','class'=>'bg-gradual-purple','name'=>'评价订单'];
                $say = '期待您的评价';
            }elseif($item['status']==5){
                $say = '退款处理中';
                if($item['refund_status']==0){
                    $say = '拒绝退款，联系商家';
                }elseif($item['refund_status']==2){
                    $say = '退款成功';
                }
                $item['btn'] = ['click'=>'','class'=>'bg-gradual-red','name'=>$say];
            }elseif($item['status']==6){
                $item['btn'] = ['click'=>'','class'=>'bg-grey','name'=>'订单已结束'];
                $say = '订单已结束';
            }
            $item['status_say'] = $say;
            $item['add_time'] = format_time($item['add_time'],'Y-m-d H:i');
            $item['child'] = $items;
            $is_ziti = 1;
            $this->load->model(['shop/Shops']);
            list($shop,$is_zitis) = $this->Shops->send($item['shop_id'],$is_ziti,$item['total']);
            $item['send'] = $shop;
            $item['is_ziti'] = $is_zitis;
            AjaxResult_page($item);
        }
    }

    function index_delete(){
        if(is_ajax_request()) {
            $id = Del_Put('id');
            $uid = $this->User['id'];
            $this->load->model(array('goods/Orders'=>'do','goods/Orders_lists'=>'lists'));
            $result = $this->do->del(array('id'=>$id,'uid'=>$uid));
            if($result){
                $this->lists->del(array('order_id'=>$id));
            }
            is_AjaxResult($result);
        }
    }

    function get_config_get(){
        if(is_ajax_request()){
            $this->load->model(array('admin/AdminConfig'=>'doconfig'));
            $stor_reason = $this->doconfig->getValue('stor_reason');
            if(!$stor_reason)AjaxResult_error('后台未配置');
            $config['stor_reason'] = explode("+",$stor_reason);
            AjaxResult_page($config);
        }
    }

    function refund_post(){//退款
        if(is_ajax_request()){
            $post = Posts();
            $this->load->model(array('goods/Orders'=>'do'));
            $where['id'] = $post['id'];
            $post['status'] = 5;
            $post['refund_status'] = 1;
            $post['refund_time'] = time();
            $result = $this->do->edit($post,$where);
            is_AjaxResult($result);
        }
    }

    //获取H5二维码的链接
    function get_hx_qrcode_get(){
        if(is_ajax_request()){
            $id = Gets('id');
            $uid = $this->User['id'];
            $url = base_url("web/#/pages/order/hexiao?id=$id&uid=$uid");
            AjaxResult_page($url);
        }
    }

    function hx_put(){
        if(is_ajax_request()){
            $id = Del_Put('id');
            $uid = Del_Put('uid');
            $this->load->model(array('goods/Orders'=>'do'));
            $where['id'] = $id;
            $where['uid'] = $uid;
            $item = $this->do->getItem($where);
            if($item['status']==4)AjaxResult_error('操作失败，请关闭');
            $this->do->start();
            $result = $this->do->edit(array('status'=>4),$where);
            $this->do->complete();
            is_AjaxResult($result);
        }
    }

    function pay(){
        if(is_ajax_request()){
            $id = Posts('id');
            $this->load->model(array('store/Orders','admin/AdminConfig','user/Users'));
            $order = $this->Orders->getItem(['id'=>$id]);
            $config = get_Cache('wxappConfig');
            $configs = [
                'app_id'=>$config['appid'],
                'secret'=>$config['appsecret'],
                'payment' => [
                    'merchant_id'=> $config['mchid'],
                    'key'=> $config['key'],
                    'cert_path'=> $config['certpem'],
                    'key_path'=> $config['keypem'],
                    'notify_url'=> XCXNOTIFY_URL
                ]
            ];
            $app = new Application($configs);
            $payment = $app->payment;
            //订单参数
            $openid = $this->Users->get_openid('openid');
            $title = '商品订单'.$order['order_id'];
            $attributes = [
                'trade_type'=>'JSAPI',
                'body'=> $title,
                'detail'=> $title,
                'out_trade_no'=>$order['edit_oid']?$order['edit_oid']:$order['order_id'],
                'total_fee'=> $order['pay_price'] * 100,
                'openid'=> $openid
            ];
            $order = new Orders($attributes);
            $result = $payment->prepare($order)->toArray();
            if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
                $prepayId = $result['prepay_id'];
                $arr = $payment->configForPayment($prepayId,false);
                AjaxResult(1,'签名成功',$arr);
            }else{
                AjaxResult_error($result['return_code'].':'.$result['return_msg'].$result['err_code_des']);
            }
        }
    }


    function assess_get(){
        if(is_ajax_request()){
            $post = Gets();
            $where['order_id'] = $post['id'];
            $this->load->model(array('goods/Orders_lists'=>'do'));
            $items = $this->do->getItems($where);
            AjaxResult_page($items);
        }
    }

    function assess_post(){//评论
        if(is_ajax_request()){
            $post = json_decode(Posts('data'),true);
            $order_id = Posts('order_id');
            $this->load->model(array('goods/Comments'=>'do','goods/Orders'=>'dos'));
            $order = $this->dos->getItem(['id'=>$order_id],'shop_id');
            foreach ($post as &$item) {
                $item['uid'] = $this->User['id'];
                $item['shop_id'] = $order['shop_id'];
                $item['add_time'] = time();
            }
            $result = $this->do->add_batch($post);
            if($result){
                $this->dos->edit(['status'=>6],['id'=>$order_id]);
            }
            is_AjaxResult($result);
        }
    }
}