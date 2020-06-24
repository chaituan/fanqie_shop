<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 账单
 * @author chaituan@126.com
 */

class UserBills extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'user_bill';
	}

	function income($uid){
        $items = $this->getItems(array('uid'=>$uid,'status'=>1));
        $money = 0;
        $c_money = 0;
        $x_money = 0;
        foreach ($items as $v){
            if($v['type']==1||$v['type']==2||$v['type']==3||$v['type']==6||$v['type']==7){
                $money = bcadd($money,$v['money'],2);
                $c_money =  bcadd($c_money,$v['money'],2);
            }else{
                $money = bcsub($money,$v['money'],2);
                $x_money = bcsub($x_money,$v['money'],2);
            }
        }
        return [$money,$c_money,abs($x_money)];
    }

    function test(){return 1;
    }

    //可用余额
    function surplus($uid){
        $items = $this->getItems(array('uid'=>$uid,'status'=>1));
        $money = 0;
        foreach ($items as $v){
            if($v['type']==1||$v['type']==2||$v['type']==3||$v['type']==6||$v['type']==7){
                $money = bcadd($money,$v['money'],2);
            }else{
                $money = bcsub($money,$v['money'],2);
            }
        }
        return $money;
    }

}