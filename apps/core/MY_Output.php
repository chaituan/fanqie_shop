<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );
/**
 * 重写输出类
 *
 * @author chaituan@126.com
 */
class MY_Output extends CI_Output {
	
	// $param=1写入文件缓存 $param=0读取文件缓存
	public function breakup_cachefiles($cache_path, $param = 1) {
		$ret = '';
		
		/*
		 * 1、取得md5码的后2个字母，目的是分散缓存到不同的文件夹，使磁盘能够更快索引 substr($cache_path, -3) C(36,3) = 7140（排列组合数），磁盘可以承受再大就不行了
		 */
		$md5_2 = substr ( $cache_path, - 2 );
		// echo '<font color=blue>'.$md5_2.'<font>';
		// 2、建立目录名=$md5_2的目录
		$dir = dirname ( $cache_path ); // 获取当前目录名
		
		$file = basename ( $cache_path ); // 获取当前文件名
		
		$newdir = $dir . '/' . $md5_2; // 新的目录名
		if ($param == 1) {
			if (! file_exists ( $newdir )) // 目录不存在则创建
				mkdir ( $newdir, 0777 );
		}
		// 3、将 $cache_path 定位到新的文件夹
		$ret = $newdir . '/' . $file;
		return $ret;
	}
	
	// 以下方法都是重写
	public function _write_cache($output) {
		$CI = & get_instance ();
		$path = $CI->config->item ( 'cache_path' );
		$cache_path = ($path === '') ? APPPATH . 'cache/' : $path;
		
		if (! is_dir ( $cache_path ) or ! is_really_writable ( $cache_path )) {
			log_message ( 'error', 'Unable to write cache file: ' . $cache_path );
			return;
		}
		// 改动，这里的url需要默认增加index 不然会生成2个缓存文件
		$uri = $CI->uri->uri_string ();
		if (! $CI->uri->segment ( 3 ))
			$uri = $uri . '/index';
		$uri = $CI->config->item ( 'base_url' ) . $CI->config->item ( 'index_page' ) . $uri;
		if (($cache_query_string = $CI->config->item ( 'cache_query_string' )) && ! empty ( $_SERVER ['QUERY_STRING'] )) {
			if (is_array ( $cache_query_string )) {
				$uri .= '?' . http_build_query ( array_intersect_key ( $_GET, array_flip ( $cache_query_string ) ) );
			} else {
				$uri .= '?' . $_SERVER ['QUERY_STRING'];
			}
		}
		$cache_path .= md5 ( $uri );
		$cache_path = self::breakup_cachefiles ( $cache_path );
		if (! $fp = @fopen ( $cache_path, 'w+b' )) {
			log_message ( 'error', 'Unable to write cache file: ' . $cache_path );
			return;
		}
		if (flock ( $fp, LOCK_EX )) {
			// If output compression is enabled, compress the cache
			// itself, so that we don't have to do that each time
			// we're serving it
			if ($this->_compress_output === TRUE) {
				$output = gzencode ( $output );
				
				if ($this->get_header ( 'content-type' ) === NULL) {
					$this->set_content_type ( $this->mime_type );
				}
			}
			
			$expire = time () + ($this->cache_expiration * 60);
			
			// Put together our serialized info.
			$cache_info = serialize ( array (
					'expire' => $expire,
					'headers' => $this->headers 
			) );
			
			$output = $cache_info . 'ENDCI--->' . $output;
			
			for($written = 0, $length = strlen ( $output ); $written < $length; $written += $result) {
				if (($result = fwrite ( $fp, substr ( $output, $written ) )) === FALSE) {
					break;
				}
			}
			flock ( $fp, LOCK_UN );
		} else {
			log_message ( 'error', 'Unable to secure a file lock for file at: ' . $cache_path );
			return;
		}
		
		fclose ( $fp );
		
		if (is_int ( $result )) {
			chmod ( $cache_path, 0640 );
			log_message ( 'debug', 'Cache file written: ' . $cache_path );
			// Send HTTP cache-control headers to browser to match file cache settings.
			$this->set_cache_header ( $_SERVER ['REQUEST_TIME'], $expire );
		} else {
			@unlink ( $cache_path );
			log_message ( 'error', 'Unable to write the complete cache content at: ' . $cache_path );
		}
	}
	public function _display_cache(&$CFG, &$URI) {
		$cache_path = ($CFG->item ( 'cache_path' ) === '') ? APPPATH . 'cache/' : $CFG->item ( 'cache_path' );
		
		// Build the file path. The file name is an MD5 hash of the full URI
		// 改动，这里的url需要默认增加index 不然会生成2个缓存文件
		$uri = $URI->uri_string;
		if (! isset ( $URI->segments [3] ))
			$uri = $uri . '/index';
		
		$uri = $CFG->item ( 'base_url' ) . $CFG->item ( 'index_page' ) . $uri;
		
		if (($cache_query_string = $CFG->item ( 'cache_query_string' )) && ! empty ( $_SERVER ['QUERY_STRING'] )) {
			if (is_array ( $cache_query_string )) {
				$uri .= '?' . http_build_query ( array_intersect_key ( $_GET, array_flip ( $cache_query_string ) ) );
			} else {
				$uri .= '?' . $_SERVER ['QUERY_STRING'];
			}
		}
		
		$filepath = $cache_path . md5 ( $uri );
		$filepath = self::breakup_cachefiles ( $filepath, 0 );
		if (! file_exists ( $filepath ) or ! $fp = @fopen ( $filepath, 'rb' )) {
			return FALSE;
		}
		flock ( $fp, LOCK_SH );
		
		$cache = (filesize ( $filepath ) > 0) ? fread ( $fp, filesize ( $filepath ) ) : '';
		
		flock ( $fp, LOCK_UN );
		fclose ( $fp );
		
		// Look for embedded serialized file info.
		if (! preg_match ( '/^(.*)ENDCI--->/', $cache, $match )) {
			return FALSE;
		}
		
		$cache_info = unserialize ( $match [1] );
		$expire = $cache_info ['expire'];
		
		$last_modified = filemtime ( $filepath );
		
		// Has the file expired?
		if ($_SERVER ['REQUEST_TIME'] >= $expire && is_really_writable ( $cache_path )) {
			// If so we'll delete it.
			@unlink ( $filepath );
			log_message ( 'debug', 'Cache file has expired. File deleted.' );
			return FALSE;
		} else {
			// Or else send the HTTP cache control headers.
			$this->set_cache_header ( $last_modified, $expire );
		}
		
		// Add headers from cache file.
		foreach ( $cache_info ['headers'] as $header ) {
			$this->set_header ( $header [0], $header [1] );
		}
		
		// Display the cache
		$this->_display ( substr ( $cache, strlen ( $match [0] ) ) );
		log_message ( 'debug', 'Cache file is current. Sending it to browser.' );
		return TRUE;
	}
	public function delete_cache($uri = '') {
		$CI = & get_instance ();
		$cache_path = $CI->config->item ( 'cache_path' );
		if ($cache_path === '') {
			$cache_path = APPPATH . 'cache/';
		}
		
		if (! is_dir ( $cache_path )) {
			log_message ( 'error', 'Unable to find cache path: ' . $cache_path );
			return FALSE;
		}
		
		if (empty ( $uri )) {
			$uri = $CI->uri->uri_string ();
			if (! $CI->uri->segment ( 3 ))
				$uri = $uri . '/index';
			if (($cache_query_string = $CI->config->item ( 'cache_query_string' )) && ! empty ( $_SERVER ['QUERY_STRING'] )) {
				if (is_array ( $cache_query_string )) {
					$uri .= '?' . http_build_query ( array_intersect_key ( $_GET, array_flip ( $cache_query_string ) ) );
				} else {
					$uri .= '?' . $_SERVER ['QUERY_STRING'];
				}
			}
		} else {
			// 改动，这里的url需要默认增加index 不然会生成2个缓存文件
			$uri = explode ( '/', trim ( $uri, '/' ) );
			if (! isset ( $uri [2] ))
				array_push ( $uri, 'index' );
			$uri = implode ( '/', $uri );
		}
		
		$cache_path .= md5 ( $CI->config->item ( 'base_url' ) . $CI->config->item ( 'index_page' ) . $uri );
		$cache_path = self::breakup_cachefiles ( $cache_path, 0 );
		if (! @unlink ( $cache_path )) {
			log_message ( 'error', 'Unable to delete cache file for ' . $uri );
			return FALSE;
		}
		return TRUE;
	}
}

