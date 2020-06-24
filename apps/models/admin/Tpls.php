<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 首页设计
 * @author chaituan@126.com
 */
class Tpls extends MY_Model {
	public function __construct() {
		parent::__construct ();
		$this->table_name = 'tpl';
	}
}