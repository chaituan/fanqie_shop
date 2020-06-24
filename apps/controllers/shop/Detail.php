<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 流水
 * @author chaituan@126.com
 */
class Detail extends ShopCommon {

    function __construct(){
        parent::__construct();
        $this->load->model(array('shop/ShopBills'=>'do'));
    }

    function index()  {
        $this->load->view('shop/detail/index');
    }

    function lists(){
        $where = [];
        $name = Gets('srk');//搜索
        $page = Gets('page','num');$limit = Gets('limit','num');$total = Gets('total','num');
        $where['uid'] = $this->loginUser['id'];
        $data = $this->do->getItems($where,'','id desc',$page,$limit,$total);
        $find = Gets('find');
        if(($name&&$find)||!$total){
            $total = $this->do->count;
        }
        f_ajax_lists($total, $data);
    }

    function prints(){
        $where['id'] = Gets('id');
        $item = $this->do->getItem($where);
        $this->load->model(array('store/Orders_lists'=>'lists','user/Users'=>'users'));
        $data['child'] = $items = $this->lists->getItems(['oid'=>$item['id']]);
        $user = $this->users->getItem(['id'=>$item['uid']],'nickname');
        $item['nickname'] = $user['nickname'];
        $data['item'] = $item;
        $this->load->model(['admin/AdminConfig']);
        $data['shopname'] = $this->AdminConfig->getValue('site_name');
        $this->load->view('shop/order/prints',$data);
    }

    //发货
    function send(){
        if(is_ajax_request()){
            $data['status'] = 3;
            $where['id'] = Posts('id');
            $where['shop_id'] = $this->loginUser['id'];
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }
    }

    function lock(){
        $where['id'] = Gets('id');
        $where['shop_id'] = $this->loginUser['id'];
        $result = $this->do->edit(array('is_show'=>Gets('open')),$where);
        is_AjaxResult($result);
    }

    function back(){
        if(is_ajax_request()){
            $post = Posts();
            $data = $post['data'];
            if($data['refund_status']==2){
                if($post['pay_type']==1){
                    $config = get_Cache('wechatConfig');
                    $configs = [
                        'app_id'=>$config['appid'],
                        'secret'=>$config['appsecret'],
                        'payment' => [
                            'merchant_id'=> $config['mchid'],
                            'key'=> $config['key'],
                            'cert_path'=> $config['certpem'],
                            'key_path'=> $config['keypem'],
                            'notify_url'=> NOTIFY_URL_OUT
                        ]
                    ];
                    if(!$configs['payment']['cert_path'])AjaxResult_error('没有证书');
                    $app = new Application($configs);
                    $result  = $app->payment->refundByTransactionId($post['wx_oid'],order_trade_no(),$data['refund_money']*100);
                    if($result->return_code == 'SUCCESS' && $result->result_code == 'SUCCESS'){
                        $this->do->start();
                        $where['shop_id'] = $this->loginUser['id'];
                        $where['id'] = $post['id'];
                        $e = $this->do->edit(['refund_status'=>2,'refund_say'=>$data['refund_say']],$where);
                        if($e){
                            $this->do->back_result($post['id']);
                        }
                        $this->do->complete();
                        AjaxResult_ok();
                    }else{
                        AjaxResult_error($result->return_msg.$result->err_code);
                    }
                }else{
                    $this->do->start();
                    $this->load->model(['user/UserBills']);
                    $bill = [
                        'money'=>$data['refund_money'],'src'=>"订单退款({$post['id']})",'ands'=>'+','add_time'=>time(),'uid'=>$data['uid'],'type'=>7
                    ];
                    $id = $this->UserBills->add($bill);
                    $result = '';
                    if($id){
                        $where['shop_id'] = $this->loginUser['id'];
                        $where['id'] = $post['id'];
                        $result = $this->do->edit(['refund_status'=>2,'refund_no_say'=>$data['refund_say']],$where);
                        $this->do->back_result($post['id']);
                    }
                    $this->do->complete();
                    is_AjaxResult($result);
                }
            }else{
                $result = $this->do->edit(['refund_status'=>0,'refund_no_say'=>$data['refund_say']],array('id'=>$post['id']));
                is_AjaxResult($result);
            }
        }
    }


    function del(){
        $where['id'] = Gets('id');
        $result = $this->do->del($where);
        is_AjaxResult($result);
    }


    function add(){
        if(is_ajax_request()){
            $data = Posts('data');
            list($s_time,$e_time) = $data['section_time']?explode(' 到 ',$data['section_time']):[0,0];
            unset($data['section_time']);
            $data['start_time'] = strtotime($s_time);
            $data['stop_time'] = strtotime($e_time);
            $data['description'] =  $_POST['data']['description'];
            $data['rule'] = $_POST['data']['rule'];
            $data['add_time'] = time();
            $result = $this->do->add($data);
            is_AjaxResult($result);
        }else{
            $this->load->model(array('store/Products'));
            $id = Gets('id');
            $data['item'] = $this->Products->getItem(['id'=>$id]);
            $this->load->view('shop/order/add',$data);
        }
    }

    function edit(){
        if(is_ajax_request()){
            $data = Posts('data');
            if(isset($data['pay_price'])){
                $data['edit_oid'] = order_trade_no().'e';
            }
            $where['id'] = Posts('id');
            $result = $this->do->edit($data,$where);
            is_AjaxResult($result);
        }else{
            $where['id'] = Gets('id');
            $item = $this->do->getItem($where);
            $this->load->model(array('goods/Orders_lists'=>'lists'));
            $data['items'] = $items = $this->lists->getItems(['order_id'=>$item['id']]);
            $item['num'] = count($items);
            if($item['status']==1){
                $item['status_say'] = '待付款';
            }elseif($item['status']==2){
                $item['status_say'] = '待发货';
            }elseif($item['status']==3){
                $item['status_say'] = '待收货';
            }elseif($item['status']==4){
                $item['status_say'] = '待评价';
            }elseif($item['status']==5&&$item['refund_status']==1){
                $item['status_say'] = '申请退款';
            }elseif($item['status']==6){
                $item['status_say'] = '交易结束';
            }elseif($item['status']==5&&$item['refund_status']==2){
                $item['status_say'] = '退款成功';
            }
            $item['type'] = '普通订单';
            if($item['pay_type']==1){
                $item['pay_type_say'] = '微信支付';
            }elseif($item['pay_type']==2){
                $item['pay_type_say'] = '余额支付';
            }elseif($item['pay_type']==3){
                $item['pay_type_say'] = '线下支付';
            }else{
                $item['pay_type_say'] = '其他支付';
            }
            $data['item'] = $item;

            $this->load->view('shop/order/detail',$data);
        }
    }

    function export(){
        header("Content-type:application/vnd.ms-excel" );
        header('Content-Disposition: attachment;filename="' . date('YmdHis') . '.csv"');
        $where = [];
        $name = Gets('srk');//搜索
        $status = Gets('status');
        $type = Gets('type');
        $time = Gets('time');
        if($name)$where['order_id'] = $name;
        if($status){
            if($status==5){
                $where['refund_status'] = 1;
            }elseif ($status==7){
                $where['refund_status'] = 2;
            }
            $where['status'] = $status;
        }
        if($type){
            if($type==1){
                $where['combination_id'] = 0;$where['bargain_id'] = 0;$where['seckill_id'] = 0;
            }elseif ($type==2){
                $where['combination_id<>'] = 0;
            }elseif ($type==3){
                $where['bargain_id<>'] = 0;
            }elseif ($type==4){
                $where['seckill_id<>'] = 0;
            }elseif ($type==5){
                $where['fanpai_id<>'] = 0;
            }
        }
        if($time){
            list($s_time,$e_time) = explode(' 到 ',$time);
            $where['add_time>='] = strtotime($s_time);
            $where['add_time<='] = strtotime($e_time);
        }
        $pre_count = 4000;
        $total_export_count = $this->do->count($where);
        $fp = fopen('php://output', 'a');
        $str = array('订单号','收货人','手机号','收货地址','支付价格','商品详情','状态','下单时间');
        foreach($str as $key => $v) {
            $strs[] = iconv('utf-8','gb2312',$v);
        }
        $this->load->model(array('store/Orders_lists'=>'lists'));
        fputcsv($fp, $strs);
        for ($i=1;$i<intval($total_export_count/$pre_count)+2;$i++){
            $result = $this->do->getItems($where,'*','',$i,$pre_count);
            foreach ($result as $k=>$v){
                $order_id = iconv('utf-8','gb2312',$v['order_id']); //中文转码
                $real_name = iconv('utf-8','gb2312',$v['real_name']);
                $user_phone = iconv('utf-8','gb2312',$v['user_phone']);
                $user_address = iconv('utf-8','gb2312',$v['user_address']);
                $total = iconv('utf-8','gb2312',$v['pay_price']);
                $goods = '';
                $child = $this->lists->getItems(['oid'=>$v['id']]);
                foreach ($child as $vs){
                    $goods .=  iconv('utf-8','gb2312',($vs['title'].'，数量：'.$vs['num'].'，规格:'.$vs['sku']."\r\n"));
                }
                $add_time = iconv('utf-8','gb2312',format_time($v['add_time']));
                $state = '';
                if($v['status']==1){
                    $state = "待付款";
                }elseif($v['status']==2){
                    $state = "待发货";
                }elseif($v['status']==3){
                    $state = "待收货";
                }elseif($v['status']==4){
                    $state = "待评价";
                }elseif($v['status']==5){
                    $state = "退货";
                }elseif($v['status']==5){
                    $state = "订单关闭";
                }
                $state = iconv('utf-8','gb2312',$state);
                $new = array($order_id,$real_name,$user_phone,$user_address,$total,$goods,$state,$add_time);
                fputcsv($fp, $new);
            }
            unset($new);
            ob_flush();
            flush();
        }
        exit;
    }

}
