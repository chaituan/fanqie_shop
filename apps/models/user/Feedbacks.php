<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 反馈管理
 * @author chaituan@126.com
 */

class Feedbacks extends MY_Model {
	
	function __construct(){
		parent::__construct ();
		$this->table_name = 'feedback';
	}
}