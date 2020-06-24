<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 帖子
 * @author chaituan@126.com
 */
class Ties extends MY_Model {
	function __construct() {
		parent::__construct ();
		$this->table_name = 'tie';
	}
}