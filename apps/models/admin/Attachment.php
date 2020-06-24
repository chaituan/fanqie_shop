<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 文件管理
 * @author: chaituan@126.com
 */
class Attachment extends MY_Model{
	
	function __construct() {
		parent::__construct ();
		$this->table_name = 'system_attachment';
	}

}