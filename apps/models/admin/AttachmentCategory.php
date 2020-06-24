<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 文件管理分类
 * @author: chaituan@126.com
 */
class AttachmentCategory extends MY_Model {
  
	function __construct() {
		parent::__construct ();
		$this->table_name = 'system_attachment_category';
	}
    
    function getAll($where){
        $items = $this->getItems($where);
        if(!$items)return '';
        $this->load->library('Tree');
        $result = Tree::makeTree($items,array('parent_key' => 'pid'));
        return $result;
    }
    
    function getCatTree($where){
    	$items = $this->getAll($where);
    	foreach ($items as $v){
    		$m[] = $v;
    		if(isset($v['children'])){
    			foreach ($v['children'] as $vo){
    				$vo['name'] = '|-----'.$vo['name'];
    				$m[] = $vo;
    			}
    		}
    	}
    	return $m;
    }
    
    function getCatTop($where){
        $where['pid'] = 0;
    	return $this->getItems($where);
    }

}