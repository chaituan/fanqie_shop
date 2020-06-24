<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 产品管理
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
use EasyWeChat\Payment\Order;
class Goodss extends MY_Model {

    function __construct() {
        parent::__construct ();
        $this->table_name = 'goods';
    }


    function pay($data){
        $this->start();
        $type = $data['type'];//区分购物车的
        $mark = json_decode($data['mark'],true);
        $this->load->model(['goods/Carts']);
        //暂时购物车不允许添加营销类产品
        $cart_where['type'] = $type;
        if($type){
            //购物车才有选中
            $cart_where['cart_sel'] = 1;
        }
        $cart_where['uid'] = $data['uid'];
        $cartItems = $this->Carts->getItems($cart_where);
        $goodsId_arr = array_unique(array_column($cartItems,'goods_id'));
        $goodsTotal_arr = array_sum(array_column($cartItems,'total'));
        $cartId_arr = array_column($cartItems,'id');
        $this->db->where_in('id',$goodsId_arr);
        //获取购物车中的产品数据
        $goodsItems = $this->getItems();
        if(!$goodsItems)AjaxResult_error('数据异常');
        $goodsItems_news = [];
        foreach ($goodsItems as $item){
            $goodsItems_news[$item['id']] = $item;
        }
        $total = 0;
        foreach ($cartItems as $item){
            $goods = $goodsItems_news[$item['goods_id']];//获取产品的所有参数
            if($item['sku_path']!==''){//根据是否开始规格来判断产品是否已经没有库存了
                $sku_stock = json_decode($goods['sku_stock'],true);
                if($sku_stock[$item['sku_path']] <= 0)AjaxResult_error('抱歉，商品已售完');
                if($sku_stock[$item['sku_path']] < $item['num'])AjaxResult_error($item['goods_id'].'产品库存不足，无法下单');
                $sku_price = json_decode($goods['sku_price'],true);
                $price = $sku_price[$item['sku_path']];
            }else{
                if($goods['stock'] <= 0)AjaxResult_error('抱歉，商品已售完');
                if($goods['stock'] < $item['num'])AjaxResult_error($item['goods_id'].'产品库存不足，无法下单');
                $price = $goods['price'];
            }
            $total += bcmul($item['num'],$price,2);
        }
        //减库存
        foreach ($cartItems as $item){
            $goods = $goodsItems_news[$item['goods_id']];//获取产品的所有参数
            if($item['sku_path']!==''){//根据是否开始规格来判断产品是否已经没有库存了
                $sku_stock = json_decode($goods['sku_stock'],true);
                $sku_stock[$item['sku_path']] = bcsub($sku_stock[$item['sku_path']],$item['num']);
                $goodsItems_news[$item['goods_id']]['sku_stock'] = $sku_stock_new = json_encode((object)$sku_stock);
                $stock = array_sum($sku_stock);
                $this->edit(['stock'=>$stock,'sku_stock'=>$sku_stock_new],['id'=>$item['goods_id']]);
            }else{
                $this->edit(['stock'=>'-='.$item['num']],['id'=>$item['goods_id']]);
            }
        }
        //如果购物车和计算出来的价格相等，那么就开始写订单
        if($goodsTotal_arr == $total){
            $this->load->model(['shop/Shops','user/Users']);
            //支付方式 2钱包
            if($data['pay_type'] == 2){
                $status = 2;
                $this->load->model(array('user/UserBills'));
                $surplus = $this->UserBills->surplus($data['uid']);
                if($total > $surplus)AjaxResult_error('余额不足，无法支付');
            }else{
                $status = 1;
            }

            //查出地址
            $this->load->model(['user/Addresss','goods/Orders','goods/Orders_lists']);

            $order_no = order_trade_no();
            $order_main = [];
            $total_arr = [];//订单小计
            $total_count = 0;
            foreach ($cartItems as $key=>$item) {
                $order_nos = order_trade_no().$key;
                //计算每个店铺的小计
                if(isset($total_arr[$item['shop_id']])){
                    $total_arr[$item['shop_id']] = bcadd($total_arr[$item['shop_id']],$item['total'],2);
                }else{
                    $total_arr[$item['shop_id']] =$item['total'];
                }
                $order_main[$item['shop_id']]['main'] = [
                    'order_no'=>$order_no,
                    'order_no_main'=>$order_no.$item['shop_id'],
                    'uid'=>$data['uid'],
                    'shop_id'=>$item['shop_id'],
                    'total'=>$total_arr[$item['shop_id']],
                    'pay_type'=>$data['pay_type'],
                    'use_integral'=>0,
                    'mark'=>$mark?$mark[$item['shop_id']]:'',
                    'add_time'=>time(),
                    'status'=>$status,
                    'pay_price'=>$data['pay_type']==2?$total_arr[$item['shop_id']]:''
                ];
                $order_main[$item['shop_id']]['child'][] = [
                    'order_nos'=>$order_nos,
                    'order_id'=>0,
                    'price'=>$item['price'],
                    'num'=>$item['num'],
                    'title'=>$item['goods_title'],
                    'thumb'=>$item['goods_thumb'],
                    'goods_id'=>$item['goods_id'],
                    'sku_opt'=>$item['sku_opt'],
                    'sku_path'=>$item['sku_path'],
                    'type'=>$item['goods_type']
                ];
            }
            //配送方式,如果没有地址则全部是自提
            if($data['a_id']){
                $addressItem = $this->Addresss->getItem(['id'=>$data['a_id']]);
            }
            $result = '';
            $is_ziti = 1;//1配送 0自提
            $id_Arr = [];
            foreach ($order_main as $key=>$item){
                list($shop,$is_zitis) = $this->Shops->send($key,$is_ziti,$item['main']['total']);
                $item['main']['a_name'] = $addressItem['username'];
                $item['main']['a_mobile'] = $addressItem['mobile'];
                if($is_zitis){
                    $item['main']['a_address'] = $addressItem['detail'];
                    $item['main']['send_id'] = $shop['send_id'];
                    $item['main']['send_type'] = $shop['send_type'];
                    $item['main']['send_name'] = $shop['send_name'];
                    $item['main']['send_mobile'] = $shop['send_mobile'];
                    $item['main']['send_money'] = $shop['send_money'];
                    $item['main']['send_time'] = $shop['send_time'];
                }else{
                    $item['main']['send_time'] = '自提';
                }
                $id = $this->Orders->add($item['main']);
                $id_Arr[] = $id;
                foreach ($item['child'] as $v){
                    $v['order_id'] = $id;
                    $result = $this->Orders_lists->add($v);
                }
            }
            $this->Carts->db->where_in('id',$cartId_arr);
            $this->Carts->del();
            $this->complete();
            if($result){
                if($data['pay_type']==2){
                    $this->Orders->pay_finish($id_Arr);
                    is_AjaxResult($result);
                }elseif($data['pay_type']==1){
                    $config = get_Cache('wechatConfig');
                    $configs = [
                        'app_id'=>$config['appid'],
                        'secret'=>$config['appsecret'],
                        'payment' => [
                            'merchant_id'=> $config['mchid'],
                            'key'=> $config['key'],
                            'notify_url'=> NOTIFY_URL
                        ]
                    ];
                    $app = new Application($configs);
                    $payment = $app->payment;
                    $openid = $this->Users->get_openid('openid');
                    $attributes = [
                        'trade_type'=>'JSAPI',
                        'body'=> '商城下单',
                        'detail'=> '商城下单',
                        'out_trade_no'=>$order_no,
                        'total_fee'=> $total * 100,
                        'openid'=> $openid
                    ];
                    $order = new Order($attributes);
                    $result = $payment->prepare($order)->toArray();
                    if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
                        $prepayId = $result['prepay_id'];
                        $arr = $payment->configForPayment($prepayId,false);
                        AjaxResult_page(['config'=>$arr,'order_id'=>$order_no]);
                    }else{
                        $this->del_order($order_no,$data['uid']);
                        AjaxResult_error($result['return_code'].':'.$result['return_msg'].$result['result_code'].$result['err_code'].$result['err_code_des']);
                    }
                }
            }
        }else{
            AjaxResult_error('价格计算异常');
        }
    }

    //删掉订单，返还库存 处理下单时候的删除
    function del_order($oid,$uid){
        $this->load->model(['goods/Orders','goods/Orders_lists']);
        $order = $this->Orders->getItems(['order_no'=>$oid,'uid'=>$uid],'id,status');
        $order_id = array_column($order,'id');
        $this->Orders_lists->db->where_in('order_id',$order_id);
        $order_lists = $this->Orders_lists->getItems();
        $this->db->where_in('id',array_unique(array_column($order_lists,'goods_id')));
        $goods = $this->getItems();
        $goodsItems_news = [];
        foreach ($goods as $item){
            $goodsItems_news[$item['id']] = $item;
        }
        foreach ($order_lists as $item){//返还库存
            $goods = $goodsItems_news[$item['goods_id']];//获取产品的所有参数
            if($item['sku_path']!==''){
                $sku_stock = json_decode($goods['sku_stock'],true);
                $sku_stock[$item['sku_path']] = bcadd($sku_stock[$item['sku_path']],$item['num']);
                $goodsItems_news[$item['goods_id']]['sku_stock'] = $sku_stock_new = json_encode((object)$sku_stock);
                $stock = array_sum($sku_stock);
                $this->edit(['stock'=>$stock,'sku_stock'=>$sku_stock_new],['id'=>$item['goods_id']]);
            }else{
                $this->edit(['stock'=>'+='.$item['num']],['id'=>$item['goods_id']]);
            }
        }
        $result = $this->Orders->del(['order_no'=>$oid,'uid'=>$uid]);
        $this->Orders_lists->db->where_in('order_id',$order_id);
        $this->Orders_lists->del();
        return $result;
    }

    //删掉订单，返还库存 处理在订单的删除s
    function del_orders($id){
        $this->load->model(['goods/Orders','goods/Orders_lists']);
        $order = $this->Orders->getItem(['id'=>$id],'id,status');
        if($order['status']==1){
            $order_id = $order['id'];
            $order_lists = $this->Orders_lists->getItems(['order_id'=>$order_id]);
            $this->db->where_in('id',array_unique(array_column($order_lists,'goods_id')));
            $goods = $this->getItems();
            $goodsItems_news = [];
            foreach ($goods as $item){
                $goodsItems_news[$item['id']] = $item;
            }
            foreach ($order_lists as $item){//返还库存
                $goods = $goodsItems_news[$item['goods_id']];//获取产品的所有参数
                if($item['sku_path']!==''){
                    $sku_stock = json_decode($goods['sku_stock'],true);
                    $sku_stock[$item['sku_path']] = bcadd($sku_stock[$item['sku_path']],$item['num']);
                    $goodsItems_news[$item['goods_id']]['sku_stock'] = $sku_stock_new = json_encode((object)$sku_stock);
                    $stock = array_sum($sku_stock);
                    $this->edit(['stock'=>$stock,'sku_stock'=>$sku_stock_new],['id'=>$item['goods_id']]);
                }else{
                    $this->edit(['stock'=>'+='.$item['num']],['id'=>$item['goods_id']]);
                }
            }
        }
        $result = $this->Orders->del(['order_no'=>$id]);
        $this->Orders_lists->del(['order_id'=>$order_id]);
        return $result;
    }

    function get_hb($user,$data){
        $uid = $user['id'];
        //手动生成
        if($data['hb_img']){
            $url = base_url("web/#/pages/goods/detail?id={$data['id']}&uid=$uid");
            $item['hb_field'] = [
                [
                    'type'=>'qrcode','text'=>$url,'dx'=>$data['hb_x'],'dy'=>$data['hb_y'],'size'=>220
                ]
            ];
        }else{//自动生成
            $url = base_url("web/#/pages/goods/detail?id={$data['id']}&uid=$uid");
            $item['hb_field'] = [
                [
                    'type'=>'image','url'=>$user['avatar'],'dx'=>60,'dy'=>910,'dWidth'=>100,'dHeight'=>100,'circleSet'=>['r'=>intval(100/2)]
                ],
                [
                    'type'=>'image','url'=>$data['thumb'],'dx'=>60,'dy'=>60,'dWidth'=>634,'dHeight'=>634
                ],
                [
                    'type'=>'text','dx'=> 59,'dy'=>760,'text'=>$data['title'],'size'=>0, 'color'=>'#8d8d8d','lineFeed'=>['maxWidth'=>634]
                ],
                [
                    'type'=>'qrcode','text'=>$url,'dx'=>500,'dy'=>910,'size'=>200
                ],
                [
                    'type'=>'text','text'=>$user['nickname'],'dx'=>180,'dy'=>960,'size'=>0,'color'=>'#8d8d8d'
                ],
                [
                    'type'=>'text','text'=>'抢购价：'.$data['price'],'dx'=>60,'dy'=>1080,'size'=>0,'color'=>'#F43F3B'
                ],
                [
                    'type'=>'text','text'=>'返现：'.$data['yj_money'],'dx'=>60,'dy'=>1150,'size'=>0,'color'=>'#F43F3B'
                ],
                [
                    'type'=>'text','text'=>'长按立即购买','dx'=>490,'dy'=>1150,'size'=>0,'color'=>'#080808'
                ]
            ];
        }
        //头像


        return $item;
    }



}