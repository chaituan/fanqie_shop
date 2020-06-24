<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );
/**
 *
 * @author chaituan@126.com
 *         过滤函数
 */

if (! function_exists ( 'check_id' )) {
	/**
	 * 检测id是否是数字，如果不是返回true
	 *
	 * @param unknown $id        	
	 * @return boolean
	 */
	function check_id($id) {
		if (is_array ( $id )) {
			array_map ( 'check_id', $id );
		} else {
			$id = trim ( $id );
			$id = check_input ( $id );
			if (is_number ( $id )) {
				return $id;
			} else {
				if (is_ajax_request ()) {
					AjaxResult ( '2', '参数ID错误' );
				} else {
					showmessage ( '参数ID错误', 'error' );
				}
			}
		}
	}
}

if (! function_exists ( 'is_number' )) {
	function is_number($number) {
		if (preg_match ( '/^[-\+]?\d+$/', $number )) {
			return true;
		} else {
			return false;
		}
	}
}

if (! function_exists ( 'input_trim' )) {
	/**
	 * 去除空格
	 * 
	 * @param unknown $data        	
	 */
	function input_trim($data) {
		if (is_array ( $data )) {
			return array_map ( 'input_trim', $data );
		} else {
			return trim ( $data );
		}
	}
}

if (! function_exists ( 'check_input' )) {
	/**
	 * 安全检测输入
	 *
	 * @param unknown $data        	
	 */
	function check_input($data) {
		if (isset ( $data ['content'] )) {
			$content = dsafe ( $data ['content'] );
			unset ( $data ['content'] );
			$data = dhtmlspecialchars ( $data );
			$data ['content'] = $content;
		} else {
			$data = dhtmlspecialchars ( input_trim ( $data ) );
		}
		return $data;
	}
}

/**
 * *****************安全过来函数star*******************************
 */
if (! function_exists ( 'dhtmlspecialchars' )) {
	function dhtmlspecialchars($string) {
		if (is_array ( $string )) {
			return array_map ( 'dhtmlspecialchars', $string );
		} else {
			$string = htmlspecialchars ( $string, ENT_NOQUOTES, 'UTF-8' ); // 不转义任何引号
			$string = str_replace ( '&amp;', '&', $string );
			return strip_sql ( $string );
		}
	}
}

if (! function_exists ( 'dsafe' )) {
	function dsafe($string, $type = 1) {
		if (is_array ( $string )) {
			return array_map ( 'dsafe', $string );
		} else {
			if ($type) {
				$string = str_replace ( '<em></em>', '', $string );
				$string = preg_replace ( "/\<\!\-\-([\s\S]*?)\-\-\>/", "", $string );
				$string = preg_replace ( "/\/\*([\s\S]*?)\*\//", "", $string );
				$string = preg_replace ( "/&#([a-z0-9]{1,})/i", "<em></em>&#\\1", $string );
				$match = array (
						"/s[\s]*c[\s]*r[\s]*i[\s]*p[\s]*t/i",
						"/d[\s]*a[\s]*t[\s]*a[\s]*\:/i",
						"/b[\s]*a[\s]*s[\s]*e/i",
						"/e[\\\]*x[\\\]*p[\\\]*r[\\\]*e[\\\]*s[\\\]*s[\\\]*i[\\\]*o[\\\]*n/i",
						"/i[\\\]*m[\\\]*p[\\\]*o[\\\]*r[\\\]*t/i",
						"/on([a-z]{2,})([\(|\=|\s]+)/i",
						"/about/i",
						"/frame/i",
						"/link/i",
						"/meta/i",
						"/textarea/i",
						"/eval/i",
						"/alert/i",
						"/confirm/i",
						"/prompt/i",
						"/cookie/i",
						"/document/i",
						"/newline/i",
						"/colon/i",
						"/<style/i",
						"/\\\x/i" 
				);
				$replace = array (
						"s<em></em>cript",
						"da<em></em>ta:",
						"ba<em></em>se",
						"ex<em></em>pression",
						"im<em></em>port",
						"o<em></em>n\\1\\2",
						"a<em></em>bout",
						"f<em></em>rame",
						"l<em></em>ink",
						"me<em></em>ta",
						"text<em></em>area",
						"e<em></em>val",
						"a<em></em>lert",
						"/con<em></em>firm/i",
						"prom<em></em>pt",
						"coo<em></em>kie",
						"docu<em></em>ment",
						"new<em></em>line",
						"co<em></em>lon",
						"<sty1e",
						"\<em></em>x" 
				);
				return str_replace ( array (
						'isShowa<em></em>bout' 
				), array (
						'isShowAbout' 
				), preg_replace ( $match, $replace, $string ) );
			} else {
				return str_replace ( array (
						'<em></em>',
						'<sty1e' 
				), array (
						'',
						'<style' 
				), $string );
			}
		}
	}
}

if (! function_exists ( 'strip_sql' )) {
	function strip_sql($string, $type = 1) {
		if (is_array ( $string )) {
			return array_map ( 'strip_sql', $string );
		} else {
			if ($type) {
				$DT_PRE = 'ct_';
				$string = preg_replace ( "/\/\*([\s\S]*?)\*\//", "", $string );
				$string = preg_replace ( "/0x([a-f0-9]{2,})/i", '0&#120;\\1', $string );
				$string = preg_replace_callback ( "/(select|update|replace|delete|drop)([\s\S]*?)({$DT_PRE}|from)/i", 'strip_wd', $string );
				$string = preg_replace_callback ( "/(load_file|substring|substr|reverse|trim|space|left|right|mid|lpad|concat|concat_ws|make_set|ascii|bin|oct|hex|ord|char|conv)([^a-z]?)\(/i", 'strip_wd', $string );
				$string = preg_replace_callback ( "/(union|where|having|outfile|dumpfile|{$DT_PRE})/i", 'strip_wd', $string );
				return $string;
			} else {
				return str_replace ( array (
						'&#95;',
						'&#100;',
						'&#101;',
						'&#103;',
						'&#105;',
						'&#109;',
						'&#110;',
						'&#112;',
						'&#114;',
						'&#115;',
						'&#116;',
						'&#118;',
						'&#120;' 
				), array (
						'_',
						'd',
						'e',
						'g',
						'i',
						'm',
						'n',
						'p',
						'r',
						's',
						't',
						'v',
						'x' 
				), $string );
			}
		}
	}
}

if (! function_exists ( 'strip_wd' )) {
	function strip_wd($m) {
		if (is_array ( $m ) && isset ( $m [1] )) {
			$wd = substr ( $m [1], 0, - 1 ) . '&#' . ord ( strtolower ( substr ( $m [1], - 1 ) ) ) . ';';
			if (isset ( $m [3] ))
				return $wd . $m [2] . $m [3];
			if (isset ( $m [2] ))
				return $wd . $m [2] . '(';
			return $wd;
		}
		return '';
	}
}
/*******************安全过来函数end********************************/
