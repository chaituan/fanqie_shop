<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 订单管理
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
class Order extends AdminCommon{

    function __construct(){
        parent::__construct();
        $this->load->model(array('goods/Orders'=>'do'));
    }

    function index()  {
        $this->load->view('admin/goods/order/index');
    }

    function lists(){
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
        if($time){
            list($s_time,$e_time) = explode(' 到 ',$time);
            $where['add_time>='] = strtotime($s_time);
            $where['add_time<='] = strtotime($e_time);
        }
        $page = Gets('page','num');$limit = Gets('limit','num');$total = Gets('total','num');
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
        $this->load->model(array('goods/Orders_lists'=>'lists','user/Users'=>'users','shop/Shops'));
        $data['child'] = $items = $this->lists->getItems(['order_id'=>$item['id']]);
        $user = $this->users->getItem(['id'=>$item['uid']],'nickname');
        $item['nickname'] = $user['nickname'];
        $data['item'] = $item;
        $this->load->model(['admin/AdminConfig']);
        $shop = $this->Shops->getItem(['id'=>$item['shop_id']],'title');
        $data['shopname'] = $shop['title'];
        $this->load->view('admin/goods/order/prints',$data);
    }

    //发货
    function send(){
        if(is_ajax_request()){
            $where['id'] = $id = Posts('id');
            $item = $this->do->getItem($where);
            if($item['status']!=2)AjaxResult_error('发货失败');
            $this->do->fh($item,$id);
        }
    }

    function lock(){
        $where['id'] = Gets('id');
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
                        $this->do->edit(['refund_status'=>2,'refund_say'=>$data['refund_say']],array('id'=>$post['id']));
                        $this->do->back_result($post['id']);
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
                        $result = $this->do->edit(['refund_status'=>2,'refund_no_say'=>$data['refund_say']],array('id'=>$post['id']));
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
        $id = Gets('id');
        $this->load->model(array('goods/Goodss'=>'goods'));
        $result = $this->goods->del_orders($id);
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
            $this->load->view('admin/goods/order/add',$data);
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

            $this->load->view('admin/goods/order/detail',$data);
        }
    }

    function export(){
        header("Content-type:application/vnd.ms-excel" );
        header('Content-Disposition: attachment;filename="' . date('YmdHis') . '.csv"');
        $where = [];
        $name = Gets('srk');//搜索
        $status = Gets('status');
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
        $this->load->model(array('goods/Orders_lists'=>'lists'));
        fputcsv($fp, $strs);
        for ($i=1;$i<intval($total_export_count/$pre_count)+2;$i++){
            $result = $this->do->getItems($where,'*','id desc',$i,$pre_count);
            foreach ($result as $k=>$v){
                $order_id = iconv('utf-8','gb2312',$v['order_no']); //中文转码
                $real_name = iconv('utf-8','gb2312',$v['a_name']);
                $user_phone = iconv('utf-8','gb2312',$v['a_mobile']);
                $user_address = iconv('utf-8','gb2312',$v['a_address']);
                $total = iconv('utf-8','gb2312',$v['total']);
                $goods = '';
                $child = $this->lists->getItems(['order_id'=>$v['id']]);
                foreach ($child as $vs){
                    $goods .=  iconv('utf-8','gb2312',($vs['title'].'，数量：'.$vs['num'].'，规格:'.$vs['sku_opt']."\r\n"));
                }
                $add_time = iconv('utf-8','gb2312',format_time($v['add_time']));
                $state = '';
                if($v['status']==1){
                    $state = "待付款";
                }elseif($v['status']==2){
                    $state = "待配货";
                }elseif($v['status']==3){
                    $state = "配送中";
                }elseif($v['status']==33){
                    $state = "上门取货";
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
