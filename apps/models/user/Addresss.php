<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 用户地址库
 * @author chaituan@126.com
 */

class Addresss extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'user_address';
	}
}