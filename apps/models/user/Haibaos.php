<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 *海报
 * @author chaituan@126.com
 */

class Haibaos extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'haibao';
	}
}