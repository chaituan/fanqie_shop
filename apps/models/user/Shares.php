<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 分享管理
 * @author chaituan@126.com
 */

class Shares extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'share';
	}
}