<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 账单
 * @author chaituan@126.com
 */

class Bills extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'partner_bill';
	}

    //获取各种收益
    function income($uid){
        $items = $this->getItems(array('uid'=>$uid));
        //总收入
        $z_money = 0;
        foreach ($items as $v){
            if($v['type']==1||$v['type']==4){
                $z_money = bcadd($z_money,bcsub($v['money'],$v['sxf'],2),2);
            }
        }
        //商家分成
        $s_money = 0;
        foreach ($items as $v){
            if($v['type']==1){
                $s_money = bcadd($s_money,bcsub($v['money'],$v['sxf'],2),2);
            }
        }
        //配送收入
        $p_money = 0;
        foreach ($items as $v){
            if($v['type']==4){
                $p_money = bcadd($p_money,bcsub($v['money'],$v['sxf'],2),2);
            }
        }
        return [$z_money,$s_money,$p_money];
    }

    //可提现金额
    function surplus($uid){
        $items = $this->getItems(array('uid'=>$uid,'status<>'=>2));
        $money = 0;
        foreach ($items as $v){
            if($v['type']==1||$v['type']==4){
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
        if($money < $res['p_lowest'])AjaxResult_error("最小提现金额为".$res['p_lowest']."元");
        //可提现金额
        $surmoney = $this->surplus($uid);
        $sxf = $config['p_sxf'];
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
        $data = array('uid'=>$uid,'type'=>2,'money'=>$money,'status'=>0,'add_time'=>time(),'ands'=>'-','sxf'=>$sxf,'src'=>'店铺收益提现');
        $data['payout_type'] = $datas['payout_type'];
        $data['payout_data'] = $datas['payout_data'];
        $result = $this->add($data);
        return $result;
    }
}