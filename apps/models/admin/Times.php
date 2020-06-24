<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 错误记录
 * @author chaituan@126.com
 */
class Times extends MY_Model {
	public function __construct() {
		parent::__construct ();
		$this->table_name = 'times';
	}
}