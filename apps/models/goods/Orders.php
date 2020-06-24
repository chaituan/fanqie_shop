<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 订单管理
 * @author chaituan@126.com
 */
class Orders extends MY_Model {

    function __construct() {
        parent::__construct ();
        $this->table_name = 'goods_order';
    }

    //退款处理成功后
    function back_result($id){
        $this->load->model(['goods/Orders_lists','goods/Goodss']);
        $order_lists = $this->Orders_lists->getItems(['order_id'=>$id]);
        $this->Goodss->db->where_in('id',array_unique(array_column($order_lists,'goods_id')));
        $goods = $this->Goodss->getItems();
        $goodsItems_news = [];
        foreach ($goods as $item){
            $goodsItems_news[$item['id']] = $item;
        }
        //返还库存
        foreach ($order_lists as $item){
            $goods = $goodsItems_news[$item['goods_id']];
            if($item['sku_path']!==''){
                $sku_stock = json_decode($goods['sku_stock'],true);
                $sku_stock[$item['sku_path']] = bcadd($sku_stock[$item['sku_path']],$item['num']);
                $goodsItems_news[$item['goods_id']]['sku_stock'] = $sku_stock_new = json_encode((object)$sku_stock);
                $this->Goodss->edit(['sku_stock'=>$sku_stock_new],['id'=>$item['goods_id']]);
            }else{
                $this->Goodss->edit(['stock'=>'+='.$item['num']],['id'=>$item['goods_id']]);
            }
        }
    }
    //支付完毕后处理
    function pay_finish($idArr){
        $this->start();
        $this->load->model(['user/Integrals','user/Users','goods/Orders_lists','goods/Goodss','user/UserBills','shop/Shops','user/Templates']);
        $shop_id_arr =  [];
        foreach ($idArr as $id) {
            $order = $this->getItem(['id'=>$id]);
            $shop_id_arr[] = $order['shop_id'];
            //处理积分，暂不处理
            if($order['use_integral']){

            }
            //增加购买积分，暂不处理
            if($order['gain_integral']){

            }
            //处理余额
            if($order['pay_type']==2){
                $bill = [
                    'money'=>$order['pay_price'],'src'=>"支付订单({$order['id']})",'ands'=>'-','add_time'=>time(),'uid'=>$order['uid'],'type'=>5
                ];
                $this->UserBills->add($bill);
            }
            //处理销量
            $items = $this->Orders_lists->getItems(['order_id'=>$order['id']]);
            foreach ($items as $v){
                if($v['type']==2){

                }elseif($v['type']==3){

                }elseif($v['type']==4){

                }elseif($v['type']==5){

                }else{
                    //库存在下单前已经减去，这里处理销量
                    $this->Goodss->edit(['sales'=>'+='.$v['num']],['id'=>$v['goods_id']]);
                }
            }
        }
        //是否成为分销
        $this->Users->fx_check($order['uid']);

        $shop_id_arrs = array_unique($shop_id_arr);
        foreach ($shop_id_arrs as $id){
            //发送模版消息
            $this->Templates->send_newsorder($id);
        }


        $this->complete();

    }


    function lists($data){
        $uid = $data['uid'];
        $status = $data['id'];//状态ID
        $this->load->model(array('goods/Orders_lists'=>'lists'));
        $where['a.uid'] =  $uid;
//      $this->do->chaoshi($uid);
        if($status){
            $inid = $status;
            if(is_array($inid)){
                $this->db->where_in('a.status',$inid);
            }else{
                $where['a.status'] = $inid;
            }
        }
        $join = [
            'more'=>[
                ['table'=>'goods_order_lists as b','cond'=>'a.id = b.order_id'],
                ['table'=>'shop as c','cond'=>'c.id = a.shop_id'],
            ],
            'ytable'=>'goods_order as a'
        ];
        $items = $this->getItems_join($join,$where,"a.id,a.order_no,a.order_no_main,a.shop_id,a.total,a.status,a.refund_status,b.title,b.price,b.thumb,b.sku_opt,b.num,b.type,c.title as shop_title",'a.id desc',1, PAGESIZE);
        if($items){
            foreach ($items as $item){
                $key = $item['shop_id'].$item['order_no'];
                $newItems[$key]['name'] = $item['shop_title'];
                $newItems[$key]['id'] = $item['id'];
                $newItems[$key]['child'][] = [
                    'title'=>$item['title'],
                    'thumb'=>$item['thumb'],
                    'sku_opt'=>$item['sku_opt'],
                    'num'=>$item['num'],
                    'price'=>$item['price'],
                    'type'=>$this->goods_type($item['type'])
                ];
                if($item['status']==1){
                    $newItems[$key]['status'] = array('state_id'=>1,'state_say'=>'待支付','btn_name'=>'支付订单','id'=>$item['id'],'bg_color'=>'bg-red');
                }elseif($item['status']==2){
                    $newItems[$key]['status'] = array('state_id'=>2,'state_say'=>'商家拣货中','btn_name'=>'等待配送','id'=>$item['id'],'bg_color'=>'bg-orange');
                }elseif($item['status']==3){
                    $newItems[$key]['status'] = array('state_id'=>3,'state_say'=>'配送中','btn_name'=>'收货二维码','id'=>$item['id'],'bg_color'=>'bg-green');
                }if($item['status']==33){
                    $newItems[$key]['status'] = array('state_id'=>33,'state_say'=>'等待上门取货','btn_name'=>'取货二维码','id'=>$item['id'],'bg_color'=>'bg-green');
                }elseif($item['status']==4){
                    $newItems[$key]['status'] = array('state_id'=>4,'state_say'=>'待评价','btn_name'=>'评价','id'=>$item['id'],'bg_color'=>'bg-brown');
                }elseif($item['status']==5){
                    $refund = '等待商家处理';
                    if($item['refund_status']==0){
                        $refund = '拒绝退款';
                    }elseif($item['refund_status']==2){
                        $refund = '退款成功';
                    }
                    $newItems[$key]['status'] = array('state_id'=>5,'state_say'=>$refund,'btn_name'=>$refund,'id'=>$item['id'],'bg_color'=>'bg-red');
                }elseif($item['status']==6){
                    $newItems[$key]['status'] = array('state_id'=>6,'state_say'=>'订单已关闭','btn_name'=>'交易已关闭','id'=>$item['id'],'bg_color'=>'bg-grey');
                }
            }
//            var_dump($newItems);exit;
//            array_multisort($idArr,SORT_DESC,$newItems);
        }else{
            $newItems = "";
        }
        return $newItems;
    }

    function shop_order_lists($data){
        $shop_id = $data['shop_id'];
        $status = $data['id'];//状态ID
        $this->load->model(array('goods/Orders_lists'=>'lists'));
        $where['a.shop_id'] =  $shop_id;
//      $this->do->chaoshi($uid);
        if($status){
            $inid = $status;
            if(is_array($inid)){
                $this->db->where_in('a.status',$inid);
            }else{
                $where['a.status'] = $inid;
            }
        }
        $join = [
            'more'=>[
                ['table'=>'goods_order_lists as b','cond'=>'a.id = b.order_id']
            ],
            'ytable'=>'goods_order as a'
        ];
        $items = $this->getItems_join($join,$where,"a.id,a.order_no,a.order_no_main,a.shop_id,a.total,a.status,a.refund_status,b.title,b.price,b.thumb,b.sku_opt,b.num,b.type",'a.id desc',1, PAGESIZE);
        if($items){
            foreach ($items as $item){
                $key = $item['shop_id'].$item['order_no'];
                $newItems[$key]['name'] = '我的店铺';
                $newItems[$key]['id'] = $item['id'];
                $newItems[$key]['child'][] = [
                    'title'=>$item['title'],
                    'thumb'=>$item['thumb'],
                    'sku_opt'=>$item['sku_opt'],
                    'num'=>$item['num'],
                    'price'=>$item['price'],
                    'type'=>$this->goods_type($item['type'])
                ];
                if($item['status']==1){
                    $newItems[$key]['status'] = array('state_id'=>1,'state_say'=>'待支付','btn_name'=>'支付订单','id'=>$item['id'],'bg_color'=>'bg-red');
                }elseif($item['status']==2){
                    $newItems[$key]['status'] = array('state_id'=>2,'state_say'=>'需要拣货','btn_name'=>'拣货完成','id'=>$item['id'],'bg_color'=>'bg-orange');
                }elseif($item['status']==3){
                    $newItems[$key]['status'] = array('state_id'=>3,'state_say'=>'配送中','btn_name'=>'收货二维码','id'=>$item['id'],'bg_color'=>'bg-green');
                }if($item['status']==33){
                    $newItems[$key]['status'] = array('state_id'=>33,'state_say'=>'等待客户上门取货','btn_name'=>'取货二维码','id'=>$item['id'],'bg_color'=>'bg-green');
                }elseif($item['status']==4){
                    $newItems[$key]['status'] = array('state_id'=>4,'state_say'=>'等待客户评价','btn_name'=>'评价','id'=>$item['id'],'bg_color'=>'bg-brown');
                }elseif($item['status']==5){
                    $refund = '请在PC后台处理中当前退款申请';
                    if($item['refund_status']==0){
                        $refund = '退款已拒绝';
                    }elseif($item['refund_status']==2){
                        $refund = '退款成功';
                    }
                    $newItems[$key]['status'] = array('state_id'=>5,'state_say'=>$refund,'btn_name'=>$refund,'id'=>$item['id'],'bg_color'=>'bg-red');
                }elseif($item['status']==6){
                    $newItems[$key]['status'] = array('state_id'=>6,'state_say'=>'订单已结束','btn_name'=>'订单已结束','id'=>$item['id'],'bg_color'=>'bg-grey');
                }
            }
//            var_dump($newItems);exit;
//            array_multisort($idArr,SORT_DESC,$newItems);
        }else{
            $newItems = "";
        }
        return $newItems;
    }

    //城市合伙人需要发货订单
    function partner_send_lists($partner_id){
        $status = 3;//状态ID
        $this->load->model(array('goods/Orders_lists'=>'lists'));
        $where['a.send_id'] =  $partner_id;
        $where['a.status'] = $status;
        $join = [
            'more'=>[
                ['table'=>'goods_order_lists as b','cond'=>'a.id = b.order_id'],
                ['table'=>'shop as c','cond'=>'c.id = a.shop_id'],
            ],
            'ytable'=>'goods_order as a'
        ];
        $items = $this->getItems_join($join,$where,"a.id,a.order_no,a.order_no_main,a.shop_id,a.total,a.status,a.refund_status,b.title,b.price,b.thumb,b.sku_opt,b.num,b.type,c.title as shop_title",'a.id desc',1, PAGESIZE);
        if($items){
            foreach ($items as $item){
                $key = $item['shop_id'].$item['order_no'];
                $newItems[$key]['name'] = $item['shop_title'];
                $newItems[$key]['id'] = $item['id'];
                $newItems[$key]['child'][] = [
                    'title'=>$item['title'],
                    'thumb'=>$item['thumb'],
                    'sku_opt'=>$item['sku_opt'],
                    'num'=>$item['num'],
                    'price'=>$item['price'],
                    'type'=>$this->goods_type($item['type'])
                ];
                if($item['status']==3){
                    $newItems[$key]['status'] = array('state_id'=>3,'state_say'=>'请及时配送','btn_name'=>'收货二维码','id'=>$item['id'],'bg_color'=>'bg-green');
                }
            }
        }else{
            $newItems = "";
        }
        return $newItems;
    }

    function goods_type($id){
        $arr = [
            '1'=>'普通订单','2'=>'砍价订单','3'=>'秒杀订单','4'=>'团购订单','5'=>'翻牌订单'
        ];
        return $arr[$id];
    }
    //发货
    function fh($item,$id){
        $this->load->model(['user/Templates','user/Users']);
        $user = $this->Users->getItem(['id'=>$item['uid']],'id,openid,nickname,system');
        if($user['openid']){
            $this->Templates->send_fh($user,$item);
        }
        $data['status'] = 3;
        if($item['send_type']==0)$data['status'] = 33;
        $result = $this->edit($data,['id'=>$id]);
        is_AjaxResult($result);
    }

    //处理7天后未确认收货的订单
    function chaoshi($uid=''){
        $this->load->model(array('user/Users'));
        $where = '';
        if($uid)$where = ' and uid='.$uid;
        $items = $this->getItems("FROM_UNIXTIME(send_time,'%Y-%m-%d') < adddate(now(),-7) and status=3 $where",'id');
        if($items){
            foreach ($items as $item) {
                $this->edit(['status'=>4],['id'=>$item['id']]);
                $this->Users->fx_fl($item);
            }
        }
    }

}