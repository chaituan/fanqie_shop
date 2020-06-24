<?php if (! defined ( 'BASEPATH' )) exit ( 'No direct script access allowed' );
/**
 * 常用函数
 * 
 * @author chaituan@126.com
 */

if(!function_exists('cut_map')){
    function cut_map($address){
        preg_match('/(.*?(省|自治区|北京市|天津市))/', $address, $matches);
        if (count($matches) > 1) {
            $province = $matches[count($matches) - 2];
            $address = str_replace($province, '', $address);
        }
        preg_match('/(.*?(市|自治州|地区|区划|县))/', $address, $matches);
        if (count($matches) > 1) {
            $city = $matches[count($matches) - 2];
            $address = str_replace($city, '', $address);
        }
        preg_match('/(.*?(市|区|县|镇|乡|街道))/', $address, $matches);
        if (count($matches) > 1) {
            $area = $matches[count($matches) - 2];
            $address = str_replace($area, '', $address);
        }
        return [
            'province' => isset($province) ? $province : '',
            'city' => isset($city) ? $city : '',
            'district' => isset($area) ? $area : ''
        ];
    }

}
if(!function_exists('get_metre')){
    function get_metre($lng1,$lat1,$lng2,$lat2){
        $radLat1 = deg2rad($lat1);
        $radLat2 = deg2rad($lat2);
        $radLng1 = deg2rad($lng1);
        $radLng2 = deg2rad($lng2);
        $a = $radLat1-$radLat2;
        $b = $radLng1-$radLng2;
        $s = 2*asin(sqrt(pow(sin($a/2),2)+cos($radLat1)*cos($radLat2)*pow(sin($b/2),2)))*6378.137*1000;
        return floatval(bcdiv($s,1000,1));
    }
}
if (! function_exists ( 'template' )) {
	/**
	 * 模板调用
	 * 
	 * @param $name 目录名字        	
	 * @param $data 传值进入        	
	 */
	function template($name, $data = null) {
		get_CI ()->load->view ( $name, $data );
	}
}

if (!function_exists ( 'result_format_time' )) {
    /**
     * 结果时间格式化，方便前端使用
     */
    function result_format_time($data, $string = 'Y-m-d H:i:s') {
        if($data){
            foreach ($data as $v){
                if(is_array($v)){
                    $v['add_time'] = format_time($v['add_time'],$string);
                    $result[] = $v;
                }else{
                    $data['add_time'] = format_time($data['add_time'],$string);
                    $result = $data;
                    break;
                }
            }
        }else{
            $result = '';
        }
        return $result;
    }
}

if (!function_exists('str_replace_once')) {
	/**
	 * 替换第一个
	 * @param 字符串A $needle
	 * @param 将字符串A要替换成的新字符串 $replace
	 * @param 字符串B $haystack
	 * @return unknown|mixed
	 */
	function str_replace_once($needle, $replace, $haystack) {
		$pos = strpos($haystack, $needle);
		if ($pos === false) {
			return $haystack;
		}
		return substr_replace($haystack, $replace, $pos, strlen($needle));
	}
}

if (! function_exists ( 'time_ago' )) {
	/**
	 * 算出几天前
	 */
	function time_ago($agoTime) {
		$agoTime = ( int ) $agoTime;
		// 计算出当前日期时间到之前的日期时间的毫秒数，以便进行下一步的计算
		$time = time () - $agoTime;
		if ($time >= 31104000) { // N年前
			$num = ( int ) ($time / 31104000);
			return $num . '年前';
		}
		if ($time >= 2592000) { // N月前
			$num = ( int ) ($time / 2592000);
			return $num . '月前';
		}
		if ($time >= 86400) { // N天前
			$num = ( int ) ($time / 86400);
			return $num . '天前';
		}
		if ($time >= 3600) { // N小时前
			$num = ( int ) ($time / 3600);
			return $num . '小时前';
		}
		if ($time > 60) { // N分钟前
			$num = ( int ) ($time / 60);
			return $num . '分钟前';
		}
		return '1分钟前';
	}
}

if (! function_exists ( 'get_Cache' )) {
	/**
	 * 获取缓存
	 * 
	 * @param unknown $cache_name
	 *        	缓存 和 目录名字
	 */
	function get_Cache($cache_name, $dir = '') {
		get_CI ()->load->driver ( 'cache' );
		return get_CI ()->cache->file->gets ( $cache_name, $dir );
	}
}

if (! function_exists ( 'addimg_url' )) {
	/**
	 * 给图片添加url
	 */
	function addimg_url($data, $key = '') {
		foreach ( $data as $v ) {
			if ($key) {
				$v [$key] = base_url ( $v [$key] );
			} else {
				$v = base_url ( $v );
			}
			$news [] = $v;
		}
		return $news;
	}
}

if (! function_exists ( 'set_Cache' )) {
	/**
	 * 设置缓存
	 * 
	 * @param unknown $name        	
	 * @param unknown $data        	
	 * @param number $timesec        	
	 */
	function set_Cache($name, $data, $timesec = 0, $dir = '') {
		get_CI ()->load->driver ( 'cache' );
		return get_CI ()->cache->file->saves ( $name, $data, $timesec, $dir );
	}
}


if (! function_exists ( 'f_ajax_lists' )) {
	/**
	 * 列表 异步数据处理 后台专用
	 * 
	 * @param $total 总数        	
	 * @param $data 数据        	
	 */
	function f_ajax_lists($total, $data, $mark = "") {
		if ($data) {
			echo ( json_encode ( array (
					"code" => 0,
					"message" => "获取成功",
					"count" => $total,
					"data" => $data,
					'mark' => $mark 
			) ) );
		} else {
			echo ( json_encode ( array (
					"code" => 1,
					"message" => "暂时没有数据",
					"count" => $total,
					"data" => $data,
					'mark' => $mark 
			) ) );
		}
        get_CI()->output->_display();
        exit;
	}
}

if (! function_exists ( 'AjaxResult_page' )) {
    /**
     * 列表 异步数据处理 前端专用
     *
     * @param $total 总数
     * @param $data 数据
     * $errors 关闭报错 默认不开启
     */
    function AjaxResult_page($data, $mark = "",$errors = false,$msg=[]) {
        if ($data||$errors) {
            echo json_encode ( array (
                "state" => 1,
                "message" => isset($msg['success'])?$msg['success']:"操作成功",
                "data" => $data?$data:'',
                'mark' => $mark
            ));
        } else {
            echo json_encode (["state" => 2, "message" => isset($msg['error'])?$msg['error']:"暂无数据！~~~~(>_<)~~~~", "data" => $data?$data:'', 'mark' => $mark ] );
        }
        get_CI()->output->_display();
        exit;
    }
}
use chriskacerguis\RestServer\RestController;
if (! function_exists ( 'AjaxResult' )) {
	/**
	 *
	 * @param
	 *        	state int 0感叹号 1 正确 2错误 3 问号 4锁 5哭 6微笑
	 * @param string $message        	
	 * @param
	 *        	arr or string $data
	 */
	function AjaxResult($state, $message, $data = array()) {
		echo  json_encode ([ 'state' => $state, 'message' => $message, 'data' => $data ], JSON_NUMERIC_CHECK ) ;
		get_CI()->output->_display();
		exit;
	}
}

if (! function_exists ( 'AjaxResult_ok' )) {
	/**
	 * ajax 快捷操作成功
	 */
	function AjaxResult_ok($msg = false) {
		echo (json_encode(array('state' => "1",'message' => $msg?$msg:'操作成功'),JSON_NUMERIC_CHECK));
        get_CI()->output->_display();
        exit;
	}
}

if (! function_exists ( 'AjaxResult_error' )) {
	/**
	 * ajax 快捷操作失败
	 */
	function AjaxResult_error($msg = false) {
		echo (json_encode(array('state' =>'2','message' =>$msg?$msg:'操作失败'),JSON_NUMERIC_CHECK));
        get_CI()->output->_display();
        exit;
	}
}

if (! function_exists ( 'is_AjaxResult' )) {
	/**
	 * $result 快捷执行ajax
	 */
	function is_AjaxResult($result, $ok_msg = false, $error_msg = false) {
		if ($result) {
			AjaxResult_ok ( $ok_msg );
		} else {
			AjaxResult_error ( $error_msg );
		}
	}
}

if (! function_exists ( 'set_password' )) {
	function set_password($pwd) {
		$encrypt = random_string ( 'alnum', 7 );
		$pwd = md5 ( md5 ( $pwd . $encrypt ) );
		return ['password' => $pwd,'encrypt' => $encrypt];
	}
}
if (! function_exists ( 'get_password' )) {
	function get_password($pwd, $encrypt) {
		$pwd = md5 ( md5 ( $pwd . $encrypt ) );
		return $pwd;
	}
}

if (! function_exists ( 'get_diff' )) {
	function get_diff() {
		$diff = admin_config_cache ( 'tourism' )['tourism_diff'];
		$diff_1 = explode ( '+', $diff );
		foreach ( $diff_1 as $v ) {
			$new = explode ( '/', $v );
			$diff_news [$new [0]] = $new [1];
		}
		return $diff_news;
	}
}

if (! function_exists ( 'changeArrayKey' )) {
	/**
	 * 更改hash数组的key值, 注意：如果key不唯一则会产生覆盖
	 *
	 * @param array $array        	
	 * @param string $key        	
	 * @return array
	 */
	function changeArrayKey(&$array, $key = 'id') {
		$newArray = array ();
		foreach ( $array as $value )
			$newArray [$value [$key]] = $value;
		return $newArray;
	}
}
if (! function_exists ( 'filterArrayByKey' )) {
	/**
	 * 按照某一键值过滤数组，只适用与 key => value数组
	 *
	 * @param string $key
	 *        	要筛选的键
	 * @param mixed $val
	 *        	筛选的边界值(多个边界值可以用数组)
	 * @param array $array
	 *        	被筛选的数组
	 * @return array
	 */
	function filterArrayByKey($key, $val, &$array) {
		$newArray = array ();
		foreach ( $array as $value ) {
			if ($value [$key] == $val || (is_array ( $val ) && in_array ( $value [$key], $val )))
				$newArray [] = $value;
		}
		return $newArray;
	}
}

if (! function_exists ( 'parseURL' )) {
	/**
	 * 重写url里面的参数
	 * @param unknown $url        	
	 */
	function parseURL($url) {
		if (isset ( $url )) {
			$params = explode ( '-', $url );
			for($i = 0; $i < count ( $params ); $i ++) {
				if ($i % 2 == 0) {
					if (trim ( $params [$i] ) == '') {
						continue;
					}
					if (isset ( $params [$i + 1] )) {
						$_GET [$params [$i]] = $params [$i + 1];
					}
				}
			}
		}
	}
}

if (! function_exists ( 'is_ajax_request' )) {
	function is_ajax_request() {
		return get_CI ()->input->is_ajax_request ();
	}
}

if (! function_exists ( 'showmessage' )) {
	/**
	 * 错误消息提示
	 * 
	 * @param string $msg
	 *        	消息
	 * @param string $status
	 *        	状态 error success info warn waiting 默认成功
	 * @param string $url_forward
	 *        	要跳转的URL 写 # 不跳转
	 * @param number $ms
	 *        	秒数 默认3秒
	 * @param string $show_btn
	 *        	是否显示按钮，默认显示
	 */
	function showmessage($msg, $status = '', $url_forward = '', $ms = '', $show_btn = true) {
		if (is_ajax_request ()) { // 增加判断 当他是异步提交的时候 直接报错
			AjaxResult ( 2, $msg );
		} else {
			if ($url_forward == '') {
				$url_forward = PREV_URL;
			} else {
				if ($url_forward == '#') {
					$url_forward = '';
				} else {
					$url_forward = site_url ( $url_forward );
				}
			}
			switch ($status) {
				case 'error' :
					$tipsico = '<svg class="icon" aria-hidden="true"><use xlink:href="#icon-wrong"></use></svg>';
					break;
				case 'success' :
					$tipsico = '<svg class="icon" aria-hidden="true"><use xlink:href="#icon-success"></use></svg>';
					break;
				case 'info' :
					$tipsico = '<svg class="icon" aria-hidden="true"><use xlink:href="#icon-information"></use></svg>';
					break;
				case 'waiting' :
					$tipsico = '<svg class="icon" aria-hidden="true"><use xlink:href="#icon-history"></use></svg>';
					break;
				default :
					$status = 'success';
					$tipsico = '<svg class="icon" aria-hidden="true"><use xlink:href="#icon-success"></use></svg>';
			}
			if (strpos ( PREV_URL, '/adminct/' )) {
				$index = site_url ( 'adminct/manager/index' );
			} elseif (strpos ( PREV_URL, '/daili/' )) {
				$index = site_url ( 'shop/login/index' ); // 待定
			} else {
				$index = site_url ();
			}
			$datainfo = array (
					"msg" => $msg,
					"url_forward" => $url_forward,
					"ms" => $ms ? $ms : 3000,
					"index" => $index,
					'tipsico' => $tipsico,
					'show_btn' => $show_btn,
					'status' => $status 
			);
			echo get_CI ()->load->view ( 'message/message', $datainfo, true );
			exit ();
		}
	}
}

if (! function_exists ( 'Posts' )) {
	/**
	 * post
	 * $conditions 需要检测的条件
	 */
	function Posts($name = null, $conditions = null, $gl = true) {
		$post = get_CI ()->input->post ( $name, $gl );
		if ($post === null) { // 当post为空的时候
			if (is_ajax_request ()) {
				AjaxResult ( '2', '获取不到参数' );
			} else {
				showmessage ( 'error', '获取不到参数' );
			}
		}
		// 是否检测ID
		if ($conditions == 'checkid' || $conditions == 'num' && $post) {
			check_id ( $post );
		} else {
			$post = check_input ( $post );
		}
		return $post;
	}
}

if (! function_exists ( 'Gets' )) {
	/**
	 * get
	 * $conditions 需要检测的条件
	 * $gl 过滤 默认true
	 */
	function Gets($name = null, $conditions = null, $gl = true) {
		$get = get_CI ()->input->get ( $name, $gl );
		// 是否检测ID
		if (($conditions == 'checkid' || $conditions == 'num') && $get) {
			check_id ( $get );
		} else {
			$get = check_input ( $get );
		}
		return $get;
	}
}

if (! function_exists ( 'Dels' )) {
    /**
     * get
     * $conditions 需要检测的条件
     * $gl 过滤 默认true
     */
    function Del_Put($name = null, $conditions = null, $gl = true) {
        $get = get_CI ()->input->input_stream ( $name, $gl );
        // 是否检测ID
        if (($conditions == 'checkid' || $conditions == 'num') && $get) {
            check_id ( $get );
        } else {
            $get = check_input ( $get );
        }
        return $get;
    }
}


if (! function_exists ( 'url_value' )) {
	/**
	 * 网页前端get到URL的参数值
	 */
	function url_value($num, $is_num = false) {
		// get到的数据为null的时候返回0， 默认开启
		$get = get_CI ()->uri->segment ( $num, 0 );
		// ID是否是数字
		if ($is_num == 'number') {
			check_id ( $get );
		}
		return $get;
	}
}

if (! function_exists ( 'calcScope' )) {
	/**
	 * 根据经纬度和半径计算出范围
	 * 
	 * @param string $lat
	 *        	纬度
	 * @param String $lng
	 *        	经度
	 * @param float $radius
	 *        	半径 米
	 * @return Array 范围数组
	 */
	function calcScope($lat, $lng, $radius) {
		$degree = (24901 * 1609) / 360.0;
		$dpmLat = 1 / $degree;
		
		$radiusLat = $dpmLat * $radius;
		$minLat = $lat - $radiusLat; // 最小纬度
		$maxLat = $lat + $radiusLat; // 最大纬度
		
		$mpdLng = $degree * cos ( $lat * (M_PI / 180) );
		$dpmLng = 1 / $mpdLng;
		$radiusLng = $dpmLng * $radius;
		$minLng = $lng - $radiusLng; // 最小经度
		$maxLng = $lng + $radiusLng; // 最大经度
		
		/**
		 * 返回范围数组
		 */
		$scope = array (
				'minLat' => $minLat,
				'maxLat' => $maxLat,
				'minLng' => $minLng,
				'maxLng' => $maxLng 
		);
		return $scope;
	}
}

if (! function_exists ( 'calcDistance' )) {
	/**
	 * 获取两个经纬度之间的距离
	 * 
	 * @param string $lat1
	 *        	纬一
	 * @param String $lng1
	 *        	经一
	 * @param String $lat2
	 *        	纬二
	 * @param String $lng2
	 *        	经二
	 * @return float 返回两点之间的距离
	 */
	function calcDistance($lat1, $lng1, $lat2, $lng2) {
		/**
		 * 转换数据类型为 double
		 */
		$lat1 = doubleval ( $lat1 );
		$lng1 = doubleval ( $lng1 );
		$lat2 = doubleval ( $lat2 );
		$lng2 = doubleval ( $lng2 );
		/**
		 * 以下算法是 Google 出来的，与大多数经纬度计算工具结果一致
		 */
		$theta = $lng1 - $lng2;
		$dist = sin ( deg2rad ( $lat1 ) ) * sin ( deg2rad ( $lat2 ) ) + cos ( deg2rad ( $lat1 ) ) * cos ( deg2rad ( $lat2 ) ) * cos ( deg2rad ( $theta ) );
		$dist = acos ( $dist );
		$dist = rad2deg ( $dist );
		$miles = $dist * 60 * 1.1515;
		return ($miles * 1.609344);
	}
}

if (! function_exists ( 'format_time' )) {
	/**
	 * 格式化时间
	 * $conditions 需要检测的条件
	 */
	function format_time($time, $string = 'Y-m-d H:i:s') {
		return $time?date ( $string, $time ):'';
	}
}

if (! function_exists ( 'str_cut' )) {
	/**
	 * 字符截取 支持UTF8/GBK
	 * 
	 * @param  	$string
	 * @param 	$length
	 * @param  	$dot
	 */
	function str_cut($string, $length, $character = '...') {
		$string = strip_tags ( $string );
		$string = str_replace ( array (
				"\r",
				"\n",
				"'",
				'"' 
		), array (
				'',
				'',
				'\'',
				'\"' 
		), $string );
		if (getStringLength ( $string ) > $length) {
			return subString ( $string, 0, $length ) . $character;
		} else {
			return subString ( $string, 0, $length );
		}
	}
}
function getStringLength($text) {
	if (function_exists ( 'mb_substr' )) {
		$length = mb_strlen ( $text, 'UTF-8' );
	} elseif (function_exists ( 'iconv_substr' )) {
		$length = iconv_strlen ( $text, 'UTF-8' );
	} else {
		preg_match_all ( "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/", $text, $ar );
		$length = count ( $ar [0] );
	}
	return $length;
}
function subString($text, $start = 0, $limit = 12) {
	if (function_exists ( 'mb_substr' )) {
		$more = (mb_strlen ( $text, 'UTF-8' ) > $limit) ? TRUE : FALSE;
		$text = mb_substr ( $text, 0, $limit, 'UTF-8' );
		return $text;
	} elseif (function_exists ( 'iconv_substr' )) {
		$more = (iconv_strlen ( $text, 'UTF-8' ) > $limit) ? TRUE : FALSE;
		$text = iconv_substr ( $text, 0, $limit, 'UTF-8' );
		// return array($text, $more);
		return $text;
	} else {
		preg_match_all ( "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/", $text, $ar );
		if (func_num_args () >= 3) {
			if (count ( $ar [0] ) > $limit) {
				$more = TRUE;
				$text = join ( "", array_slice ( $ar [0], 0, $limit ) );
			} else {
				$more = FALSE;
				$text = join ( "", array_slice ( $ar [0], 0, $limit ) );
			}
		} else {
			$more = FALSE;
			$text = join ( "", array_slice ( $ar [0], 0 ) );
		}
		return $text;
	}
}



if (! function_exists ( 'order_trade_no' )) {
	/**
	 * 订单号
	 * 
	 * @return string
	 */
	function order_trade_no() {
		$yCode = array (
				'A',
				'B',
				'C',
				'D',
				'E',
				'F',
				'G',
				'H',
				'I',
				'J' 
		);
		return $yCode [intval ( date ( 'Y' ) ) - 2011] . strtoupper ( dechex ( date ( 'm' ) ) ) . date ( 'd' ) . substr ( time (), - 5 ) . substr ( microtime (), 2, 5 ) . sprintf ( '%02d', rand ( 0, 99 ) );
	}
}

if (! function_exists ( 'admin_config_cache' )) {
	/**
	 * 后台配置文件
	 */
	function admin_config_cache($tkey = false) {
		$cache_data = get_Cache ( 'admin_config' );
		if (! $cache_data)
			showmessage ( "读取配置文件出错", 'error' );
		if ($tkey) {
			foreach ( $cache_data as $v ) {
				if ($v ['tkey'] == $tkey) {
					$new_data [$v ['key']] = $v ['val'];
				}
			}
		} else {
			foreach ( $cache_data as $v ) {
				$new_data [$v ['key']] = $v ['val'];
			}
		}
		return $new_data;
	}
}

if (! function_exists ( 'admin_btn' )) {
	/**
	 * 后台按钮统一管理
	 * 
	 * @param unknown $url        	
	 * @param string $class        	
	 * @param unknown $type
	 *        	find add edit del dels save exp
	 */
	function admin_btn($url, $type, $class = '', $data = '', $name = '',$verify = '',$shop_id='') {
		switch ($type) {
			case 'find' :
				$name = $name ? $name : '查询';
				$result = "<button class='layui-btn $class' lay-submit $data>$name</button>";
				break;
			case 'add'  :
				$name = $name ? $name : '添加';
				$result = "<a href='$url' class='layui-btn $class'><i class='layui-icon'>&#xe608;</i> $name</a>";
				break;
			case 'edit' :
				$name = $name ? $name : '编';
				$result = "<a href='$url' class='layui-btn layui-btn-normal $class'>$name</a>";
				break;
			case 'del' :
				$name = $name ? $name : '删';
				$result = "<a data-href='$url' class='layui-btn layui-btn-danger $class' $data>$name</a>";
				break;
			case 'dels' :
				$name = $name ? $name : '批量删除';
				$result = "<button class='layui-btn $class' lay-submit url='$url' $data >$name</button>";
				break;
			case 'save' :
				$name = $name ? $name : '提交保存';
				$result = "<button class='layui-btn $class' lay-submit url='$url' $data ><i class='fa fa-fw fa-save'></i> $name</button>";
				break;
			case 'exp' :
				$name = $name ? $name : '全部导出';
				$result = "<a href='$url' class='layui-btn $class'>$name</a>";
				break;
			case 'file' :
				$result = "<button type='button' class='layui-btn $class' $data lay-data={url:'" . $url . "'} ><svg class='icon' aria-hidden='true'><use xlink:href='#icon-wenjian'></use></svg>选择文件</button>";
				break;
			case 'file_sub' :
				$result = "<button type='button' class='layui-btn $class' $data ><svg class='icon' aria-hidden='true'><use xlink:href='#icon-shangchuan'></use></svg>上传文件</button>";
				break;
			case 'btn' :
				$result = "<button type='button' class='layui-btn $class' url='$url' $data >$name</button>";
				break;
			case 'upload':
			    $shop_url = $shop_id?'-s-'.$shop_id:'1';
			    $dataurl = site_url('adminct/widget/images/index');
				$class = $class?$class:1;$verify = $verify?'':'thumb';//默认必填
				$result = '<div class="'.$class.'"><div class="fc-upload fc-frame" >'
				.'<div class="fc-upload-btn fq_iframe" data-url="'.$dataurl.'" data-shop="'.$shop_url.'" data-class="'.$class.'" data-title="添加图片" data-num="'.$name.'" data-wh="850px,550px">'
					.'<i class="layui-icon layui-icon-camera" style="font-size: 20px;"></i>'
				.'</div>'
				.'<input name="'.$url.'" class="thumb" type="hidden" lay-verify="'.$verify.'" value="'.$data.'"></div></div>';
				break;
			default :
				$result = "<a href='$url' class='layui-btn $class' $data>$name</a>";
				break;
		}
		return $result;
	}
}

if (! function_exists ( 'admin_btns' )) {
	/**
	 * 后台按钮统一管理 弹框处理
	 *
	 * @param unknown $url
	 * @param string $class
	 * @param unknown $type
	 *        	find add edit del dels save exp
	 */
	function admin_btns($url, $type, $class = '', $data = '', $name = '') {
		switch ($type) {
			case 'add' :
				$name = $name ? $name : '添加';
				$result = "<button type='button' data-url='$url' data-title='$name' class='layui-btn $class' $data><i class='layui-icon'>&#xe608;</i> $name</button>";
				break;
			case 'edit' :
				$name = $name ? $name : '编';
				$result = "<button type='button' data-url='$url' data-title='$name' class='layui-btn layui-btn-normal $class' $data>$name</button>";
				break;
			default :
                $result = "<button type='button' data-url='$url' data-title='$name' class='layui-btn $class' $data>$name</button>";
                break;
		}
		return $result;
	}
}

if (! function_exists ( 'get_CI' )) {
	/**
	 * 实例化CI
	 */
	function get_CI() {
		global $CI;
		if (! $CI)
			$CI = & get_instance ();
		return $CI;
	}
}

