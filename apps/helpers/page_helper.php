<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );

if (! function_exists ( 'pages' )) {
	/**
	 * 分页函数
	 * $total_rows 总数
	 * $per_page 每页显示多少个
	 */
	function pages($total_rows, $per_page = 20) {
		get_CI ()->load->library ( 'pagination' );
		$config ['base_url'] = get_url ();
		$config ['total_rows'] = intval ( $total_rows ); // 总数
		$config ['per_page'] = intval ( $per_page ); // 每页显示多少个
		
		$config ['use_page_numbers'] = TRUE;
		$config ['page_query_string'] = TRUE;
		// 包含
		$config ['full_tag_open'] = "<a>总：{$config['total_rows']} 条</a>";
		$config ['full_tag_close'] = '';
		// 自定义第一个链接
		$config ['first_link'] = '首页';
		$config ['first_tag_open'] = '';
		$config ['first_tag_close'] = '';
		// 最后一页
		$config ['last_link'] = "尾页";
		$config ['last_tag_open'] = '';
		$config ['last_tag_close'] = "";
		
		// 自定义下一页链接
		$config ['next_link'] = "下一页";
		$config ['next_tag_open'] = "";
		$config ['next_tag_close'] = "";
		
		// 自定义上一页链接
		$config ['prev_link'] = "上一页";
		$config ['prev_tag_open'] = "";
		$config ['prev_tag_close'] = "";
		
		// 当前选中页面样式
		$config ['cur_tag_open'] = "<span class='layui-laypage-curr'> <em class='layui-laypage-em'></em><em>";
		$config ['cur_tag_close'] = '</em></span>';
		// 自定义数字链接
		$config ['num_tag_open'] = '';
		$config ['num_tag_close'] = '';
		get_CI ()->pagination->initialize ( $config );
		return get_CI ()->pagination->create_links ();
	}
}
if (! function_exists ( 'get_url' )) {
	/**
	 * 获取当前页面完整URL地址
	 */
	function get_url() {
		$C = get_CI ();
		$q = $_SERVER['PHP_SELF'];
//		var_dump($q);exit;
		$sys_protocal = base_url ( $q );
		return $sys_protocal;
	}
}


