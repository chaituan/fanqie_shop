<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 店铺管理
 * @author chaituan@126.com
 */

class Shop extends XcxCheckLoginCommon {
    protected $shop_config = [];
    protected $shop = '';
    function __construct(){
        parent::__construct();
        $this->load->model(array('shop/Shops'=>'do','admin/AdminConfig'));
        $this->shop_config = $this->AdminConfig->getAllConfig(5);
        $shop_verify_newsid = $this->shop_config['verify_newsid'];
        $this->shop = $item = $this->do->getItem(['uid'=>$this->User['id']],'id,logo,title,username,info,mobile,thumb,thumb_top,send_type,status,location_id,buy_money,send_id,send_name,send_mobile,send_time,send_money');
        if($item){
            if($item['status']==0){
                AjaxResult(7,'您的申请，还在审核中...');
            }
        }else{
            AjaxResult(6,'抱歉您还不是商家，马上去申请',$shop_verify_newsid);
        }
    }


    function index_get(){
        if(is_ajax_request()){
            $item = $this->shop;
            $data['my'] = $item;
            $this->load->model(['shop/ShopBills']);
            list($z_money,$t_money,$y_order,$z_order,$t_order) = $this->ShopBills->income($item['id']);
            $data['income'] = ['z_money'=>$z_money,'t_money'=>$t_money,'y_order'=>$y_order,'z_order'=>$z_order,'t_order'=>$t_order];
            AjaxResult_page($data);
        }
    }
    //配送更新
    function index_put(){
        if(is_ajax_request()){
            $data = Del_Put();
            $data['send_id'] = isset($data['send_id'])?$data['send_id']:'';
            $res = $this->do->edit($data,['id'=>$this->shop['id']]);
            AjaxResult_page($res);
        }
    }

    function send_get(){
        if (is_ajax_request()){
            $shop = $this->shop;
            $type = ['任意包配送（自送）','限额满配送（自送）','任意包配送（平台送）','限额满配送（平台送）','客户自提'];
            $data['type'] = $type;
            $data['send'] = intval($shop['send_type']);
            $money = $this->AdminConfig->getValue('pmoney');
            $data['field'] = [
                'buy_money'=>$shop['buy_money'],
                'send_id'=>$shop['send_id'],
                'send_name'=>$shop['send_name'],
                'send_mobile'=>$shop['send_mobile'],
                'send_time'=>$shop['send_time'],
                'send_money'=>$money
            ];
            AjaxResult_page($data);
        }
    }

    //获取合伙人信息
    function get_partner_get(){
        if(is_ajax_request()){
            $this->load->model(['partner/Partners']);
            $items = $this->Partners->getItems(['location_id'=>$this->shop['location_id'],'status'=>1],'username,mobile,id,send_time');
            $money = $this->AdminConfig->getValue('pmoney');
            foreach ($items as &$v){
                $v['send_money'] = $money;
            }
            AjaxResult_page($items);
        }
    }

    function order_get(){
        if(is_ajax_request()){
            $data['shop_id'] = $this->shop['id'];
            $data['id'] = Gets('id');//状态ID
            $this->load->model(array('goods/Orders'));
            $result = $this->Orders->shop_order_lists($data);
            AjaxResult_page($result,'',true);
        }
    }

    function order_detail_get(){
        if(is_ajax_request()){
            $id = Gets('id');
            $this->load->model(array('goods/Orders','goods/Orders_lists'));
            $where['id'] = $id;
            $item = $this->Orders->getItem($where);
            $item['pay_type_say'] = $item['pay_type']==1?'微信支付':'余额支付';
            $items = $this->Orders_lists->getItems(['order_id'=>$item['id']]);
            if(!$item)AjaxResult_error('数据错误');

            if($item['status']==1){
                $say = '请支付该订单';
            }elseif($item['status']==2){
                $item['btn'] = ['click'=>'onOver','class'=>'bg-gradual-red','name'=>'点击完成拣货'];
                $say = '请及时处理当前订单';
            }elseif($item['status']==3){
                $say = '配送中...';
            }if($item['status']==33){
                $say = '等待客户上门取货';
            }elseif($item['status']==4){
                $say = '等待客户评价';
            }elseif($item['status']==5){
                $say = '请在PC后台处理中当前退款申请';
                if($item['refund_status']==0){
                    $say = '退款已拒绝';
                }elseif($item['refund_status']==2){
                    $say = '退款成功';
                }
            }elseif($item['status']==6){
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

    function order_put(){
        if(is_ajax_request()){
            $id = Del_Put('id');
            $this->load->model(array('goods/Orders'));
            $where['id'] = $id;
            $item = $this->Orders->getItem($where);
            if($item['status']!=2)AjaxResult_error('订单已经处理');
            $this->Orders->fh($item,$id);
        }
    }

    function info_get(){
        if(is_ajax_request()){
            $d = $this->shop;
            $data = ['title'=>$d['title'],'info'=>$d['info'],'mobile'=>$d['mobile'],'username'=>$d['username'],'logo'=>$d['logo']?$d['logo']:'','thumb'=>$d['thumb']?$d['thumb']:''];
            AjaxResult_page($data);
        }
    }

    function info_put(){
        if(is_ajax_request()){
            $data = Del_Put();
            $res = $this->do->edit($data,['id'=>$this->shop['id']]);
            AjaxResult_page($res);
        }
    }

    function withdraw_get(){
        if(is_ajax_request()){
            $uid = $this->shop['id'];
            $this->load->model(['shop/ShopBills']);
            $data['type'] = $this->AdminConfig->get_payout_type();
            $data['field'] = [
                'payout_type'=>'',
                'uid'=>$uid,
                'weixin'=>'',
                'alipay'=>'',
                'bank_name'=>'',
                'bank_no'=>'',
                'username'=>'',
                'money'=>''
            ];
            $money = $this->ShopBills->surplus($uid);
            $data['total'] = $money;
            $data['config'] = ['lowest'=>$this->shop_config['lowest'],'sxf'=>$this->shop_config['sxf']];
            AjaxResult(1,'',$data);
        }
    }

    function withdraw_post(){
        if(is_ajax_request()){
            $post = Posts();
            $this->load->model(['shop/ShopBills']);
            $uid = $this->shop['id'];
            $data['payout_type'] = $post['payout_type'];
            $money = $post['money'];
            unset($post['payout_type'],$post['money'],$post['uid']);
            $data['payout_data'] = json_encode($post);
            $result = $this->ShopBills->sub($uid,$money,$this->shop_config,$data);
            is_AjaxResult($result,'提交成功，等待审核');
        }
    }



    function detail_get(){
        if(is_ajax_request()){
            $type = Gets('type');
            $uid = $this->shop['id'];
            $this->load->model(array('shop/ShopBills'));
            $result = $this->ShopBills->getItems(['uid'=>$uid,'type'=>$type],"",'id desc');
            if($result){
                foreach ($result as $v){
                    if($type==2){
                        if($v['status']==0){
                            $status = ['color'=>'bg-orange','say'=>'审核中'];
                        }elseif ($v['status']==1){
                            $status = ['color'=>'bg-green','say'=>'提现成功'];
                        }elseif ($v['status']==2){
                            $status = ['color'=>'bg-red','say'=>'提现被拒绝:'.$v['mark']];
                        }
                        $v['status'] = $status;
                    }elseif($type==1){
                        if($v['status']==0){
                            $status = ['color'=>'bg-orange','say'=>'审核中'];
                        }elseif ($v['status']==1){
                            $status = ['color'=>'bg-green','say'=>'入账成功'];
                        }elseif ($v['status']==2){
                            $status = ['color'=>'bg-red','say'=>'入帐失败:'.$v['mark']];
                        }
                        $v['status'] = $status;
                    }
                    $v['add_time'] = format_time($v['add_time'],'Y-m-d H:i');
                    $v['src'] = str_cut($v['src'],18);
                    $results[] = $v;
                }
            }else{
                $results = '';
            }
            AjaxResult_page($results,'',true);
        }
    }

}
