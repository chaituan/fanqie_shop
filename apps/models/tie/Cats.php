<?php
if (! defined ( 'BASEPATH' ))exit ( 'No direct script access allowed' );
/**
 * @author chaituan@126.com
 */
class Cats extends MY_Model {
	function __construct() {
		parent::__construct ();
		$this->table_name = 'tie_cat';
	}
	
	function cache() {
		$items = $this->getItems();
		set_Cache('tie_cat',$items);
	}
}