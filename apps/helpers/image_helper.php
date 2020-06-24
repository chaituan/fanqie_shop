<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );
/**
 * 常用函数
 *
 * @author chaituan@126.com
 */
if (! function_exists ( 'save_img_by_url' )) {
	function save_img_by_url($url, $savePath = '', $keepFileName = false, $forceExtnsion = '', $overWrite = false, $enabledWatermark = false, $watermark = 'nophoto.gif') {
		$filePathInfo = pathinfo ( $url );
		
		$suffix = (trim ( $forceExtnsion ) == "") ? $filePathInfo ['extension'] : trim ( $forceExtnsion );
		$extension = get_mime_by_extension ( $url );
		echo $extension;
		
		if (! defined ( "SKIP_CHECK_EXTENSION" ))
			if (! in_array ( $extension, array (
					'image/png',
					'image/jpeg',
					'image/gif',
					'image/pjpeg' 
			) ))
				return NULL;
		
		if (trim ( $savePath ) == "")
			$savePath = UPLOAD_TEMP_PATH . date ( 'Y/md' ) . '/';
		dir_create ( $savePath );
		
		$imgSavePath = $savePath . $filePathInfo ['filename'] . "." . $suffix;
		if (! $keepFileName)
			$imgSavePath = $savePath . random_string ( 'alnum', 6 ) . date ( "Hi" ) . $suffix;
		
		if (is_file ( $imgSavePath ) && $overWrite) {
			unlink ( $imgSavePath );
		} else {
			// $data = file_get_contents($url);
			
			// 1. 初始化
			$ch = curl_init ();
			// 2. 设置选项，包括URL
			curl_setopt ( $ch, CURLOPT_URL, $url );
			curl_setopt ( $ch, CURLOPT_TIMEOUT, 30 );
			curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
			curl_setopt ( $ch, CURLOPT_HEADER, 0 );
			// 3. 执行并获取HTML文档内容
			$data = curl_exec ( $ch );
			// 4. 释放curl句柄
			curl_close ( $ch );
			
			if (! write_file ( $imgSavePath, $data )) {
				return NULL;
			}
		}
		
		if ($enabledWatermark) {
			get_CI ()->load->library ( 'image_lib' );
			
			$config = array ();
			$config ['image_library'] = 'gd2'; // (必须)设置图像库
			$config ['source_image'] = $imgSavePath; // (必须)设置原始图像的名字/路径
			$config ['dynamic_output'] = FALSE; // 决定新图像的生成是要写入硬盘还是动态的存在
			$config ['quality'] = '100%'; // 设置图像的品质。品质越高，图像文件越大
			$config ['new_image'] = $imgSavePath; // 设置图像的目标名/路径。
			$config ['width'] = $width; // (必须)设置你想要得图像宽度。
			$config ['height'] = $height; // (必须)设置你想要得图像高度
			$config ['create_thumb'] = FALSE; // 让图像处理函数产生一个预览图像(将_thumb插入文件扩展名之前)
			                                  // $config['thumb_marker'] = '_thumb';//指定预览图像的标示。它将在被插入文件扩展名之前。例如，mypic.jpg 将会变成 mypic_thumb.jpg
			$config ['maintain_ratio'] = TRUE; // 维持比例
			$config ['master_dim'] = 'auto'; // auto, width, height 指定主轴线
			
			get_CI ()->image_lib->initialize ( $config );
			if (! get_CI ()->image_lib->resize ()) {
				return UPLOAD_TEMP_URL . date ( 'Y/md' ) . '/' . random_string ( 'alnum', 6 ) . date ( "Hi" ) . "." . $suffix;
			} else {
				return UPLOAD_TEMP_URL . date ( 'Y/md' ) . '/w' . random_string ( 'alnum', 6 ) . date ( "Hi" ) . "." . $suffix;
			}
		}
		return str_replace ( UPLOAD_TEMP_PATH, UPLOAD_TEMP_URL, $imgSavePath );
	}
}

if (! function_exists ( 'thumb' )) {
	/**
	 * 生成缩略图函数
	 *
	 * @param $imgurl 图片路径        	
	 * @param $width 缩略图宽度        	
	 * @param $height 缩略图高度        	
	 * @param $autocut 是否自动裁剪
	 *        	默认裁剪，当高度或宽度有一个数值为0是，自动关闭
	 * @param $smallpic 无图片是默认图片路径        	
	 */
	function thumb($imgurl, $width = 100, $height = 100, $autocut = 1, $smallpic = 'nophoto.gif') {
		if (empty ( $imgurl ) || $imgurl == UPLOAD_URL || "/" . $imgurl == UPLOAD_URL || trim ( $imgurl ) == "")
			return IMG_PATH . $smallpic;
		if (strpos ( $imgurl, "/" ) == 1)
			$imgurl_replace = str_replace ( UPLOAD_URL, '', $imgurl );
		else
			$imgurl_replace = str_replace ( UPLOAD_URL, '', "/" . $imgurl );
		
		if (strpos ( $imgurl_replace, '://' ))
			return $imgurl;
		
		$disk_path = str_replace ( '//', '/', UPLOAD_PATH . $imgurl_replace );
		// cho $disk_path."<br/>";
		if (! file_exists ( $disk_path ))
			return IMG_PATH . $smallpic;
			// cho $disk_path."<br/>";
		$pt = strrpos ( $imgurl_replace, "." );
		
		$newimgurl = dirname ( $imgurl_replace ) . '/thumb_' . $width . '_' . $height . '_' . basename ( $imgurl_replace );
		if (file_exists ( UPLOAD_PATH . $newimgurl )) {
			return UPLOAD_URL . $newimgurl;
		}
		
		if ($pt) {
			get_CI ()->load->library ( 'image_lib' );
			
			$config = array ();
			$config ['image_library'] = 'gd2'; // (必须)设置图像库
			$config ['source_image'] = UPLOAD_PATH . $imgurl_replace; // (必须)设置原始图像的名字/路径
			$config ['dynamic_output'] = FALSE; // 决定新图像的生成是要写入硬盘还是动态的存在
			$config ['quality'] = '100%'; // 设置图像的品质。品质越高，图像文件越大
			$config ['new_image'] = UPLOAD_PATH . $newimgurl; // 设置图像的目标名/路径。
			$config ['width'] = $width; // (必须)设置你想要得图像宽度。
			$config ['height'] = $height; // (必须)设置你想要得图像高度
			$config ['create_thumb'] = FALSE; // 让图像处理函数产生一个预览图像(将_thumb插入文件扩展名之前)
			                                  // $config['thumb_marker'] = '_thumb';//指定预览图像的标示。它将在被插入文件扩展名之前。例如，mypic.jpg 将会变成 mypic_thumb.jpg
			$config ['maintain_ratio'] = TRUE; // 维持比例
			$config ['master_dim'] = 'auto'; // auto, width, height 指定主轴线
			
			get_CI ()->image_lib->initialize ( $config );
			if (! get_CI ()->image_lib->resize ()) {
				return IMG_PATH . $smallpic;
			} else {
				return UPLOAD_URL . $newimgurl;
			}
		}
	}
}