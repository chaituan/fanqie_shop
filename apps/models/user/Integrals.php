<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 积分管理
 * @author chaituan@126.com
 */

class Integrals extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'user_integral';
	}

    //可用余额
    function surplus($uid){
        $item = $this->getItem(array('uid'=>$uid,'type!='=>4),'sum(num) as total');
        return $item['total'];
    }
}