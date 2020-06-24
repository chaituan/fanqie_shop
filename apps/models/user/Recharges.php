<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 充值表
 * @author chaituan@126.com
 */

class Recharges extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'user_recharge';
	}
}