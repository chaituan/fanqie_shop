<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 广告管理
 * @author chaituan@126.com
 */

class Ads extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'ad';
	}

}