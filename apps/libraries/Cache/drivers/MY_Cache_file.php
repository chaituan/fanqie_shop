<?php
/**
 * 重写缓存 添加目录
 * @author chaituan@126.com
 */
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
class MY_Cache_file extends CI_Cache_file {
	public function __construct() {
		parent::__construct ();
	}
	public function saves($id, $data, $ttl = 60, $dir = '') {
		$cache_path = ($dir === '') ? APPPATH . 'cache/' : APPPATH . 'cache/' . $dir . '/';
		$contents = array (
				'time' => time (),
				'ttl' => $ttl,
				'data' => $data 
		);
		
		if (write_file ( $cache_path . $id, serialize ( $contents ) )) {
			chmod ( $cache_path . $id, 0640 );
			return TRUE;
		}
		return FALSE;
	}
	public function gets($id, $dir = '') {
		$cache_path = ($dir === '') ? APPPATH . 'cache/' : APPPATH . 'cache/' . $dir . '/';
		if (! is_file ( $cache_path . $id )) {
			return FALSE;
		}
		$data = unserialize ( file_get_contents ( $cache_path . $id ) );
		if ($data ['ttl'] > 0 && time () > $data ['time'] + $data ['ttl']) {
			unlink ( $cache_path . $id );
			return FALSE;
		}
		return is_array ( $data ) ? $data ['data'] : FALSE;
	}
}
