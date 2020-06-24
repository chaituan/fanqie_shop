<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 账单
 * @author chaituan@126.com
 */

class ShopBills extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'shop_bill';
	}
    //获取各种收益
	function income($shop_id){
        $items = $this->getItems(array('uid'=>$shop_id));
        //总收入
        $z_money = 0;
        foreach ($items as $v){
            if($v['type']==1){
                $z_money = bcadd($z_money,bcsub($v['money'],$v['sxf'],2),2);
            }
        }
        //当天收入
        $t_money = 0;
        $time = format_time(time(),'Y-m-d');
        foreach ($items as $v){
            $day = format_time($v['add_time'],'Y-m-d');
            if($v['type']==1&&$day==$time){
                $t_money = bcadd($t_money,bcsub($v['money'],$v['sxf'],2),2);
            }
        }
        //预计收入
        $this->load->model(array('goods/Orders'));
        $order = $this->Orders->getItems(['shop_id'=>$shop_id]);
        $y_order = 0;
        foreach ($order as $v){
            if($v['status']==2||$v['status']==3){
                $y_order = bcadd($y_order,$v['pay_price'],2);
            }
        }
        //订单总数
        $z_order = 0;
        foreach ($order as $v){
            $day = format_time($v['pay_time'],'Y-m-d');
            if($v['status']!=1){
                $z_order += 1;
            }
        }
        //今天订单
        $t_order = 0;
        foreach ($order as $v){
            $day = format_time($v['pay_time'],'Y-m-d');
            if(($v['status']!=1)&&$day==$time){
                $t_order += 1;
            }
        }
        return [$z_money,$t_money,$y_order,$z_order,$t_order];
    }
    //可提现金额
    function surplus($uid){
        $items = $this->getItems(array('uid'=>$uid,'status<>'=>2));
        $money = 0;
        foreach ($items as $v){
            if($v['type']==1){
                $money = bcadd($money,bcsub($v['money'],$v['sxf'],2),2);
            }else{
                $money = bcsub($money,bcadd($v['money'],$v['sxf'],2),2);
            }
        }

        return $money;
    }
    //开始提现
    function sub($uid,$money,$config,$datas){
        $res = $config;
        if($money < $res['lowest'])AjaxResult_error("最小提现金额为".$res['lowest']."元");
        //可提现金额
        $surmoney = $this->surplus($uid);
        $sxf = $config['sxf'];
        if(strpos($sxf,'%')){
            $sxf = bcdiv((explode('%',$sxf)[0]),100,2);
            $sxf = bcmul($money,$sxf,2);
            $moneys = bcadd($money,$sxf,2);
        }else{
            $sxf = explode('元',$sxf)[0];
            $moneys = bcadd($money,$sxf,2);
        }
        if($surmoney <= 0)AjaxResult_error('你没有钱可以提');
        if(bcsub($surmoney,$moneys,2) <= 0)AjaxResult_error("余额不足，需要余额：".bcadd($surmoney,$sxf,2));
        $ing = $this->getItem(['uid'=>$uid,'status'=>0],'id');
        if($ing)AjaxResult_error('有一笔提现，正在审核中');
        $data = array('uid'=>$uid,'type'=>2,'money'=>$money,'status'=>0,'add_time'=>time(),'ands'=>'-','sxf'=>$sxf,'src'=>'佣金提现');
        $data['payout_type'] = $datas['payout_type'];
        $data['payout_data'] = $datas['payout_data'];
        $result = $this->add($data);
        return $result;
    }
}