<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 产品分类
 * @author chaituan@126.com
 */
class Groups extends MY_Model {

	function __construct() {
		parent::__construct ();
		$this->table_name = 'goods_group';
	}

	function getAll(){
		$items = $this->getItems(['status'=>1]);
		$this->load->library('Tree');
		$result = Tree::makeTree($items,array('parent_key' =>'pid'));
		return $result;
	}
	
	function getCatTree(){
		$items = $this->getItems();
		$this->load->library('Tree');
		$result = Tree::makeTreeForHtml($items,array('parent_key' =>'pid'));
		return $result;
	}
	
	function getCatTop(){
		return $this->getItems(array('pid'=>0));
	}
}