<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title><?php echo SYSTEM_NAME?></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="author" content="chaituan@126.com">
<link rel="stylesheet" href="<?php echo LAYUI."css/layui.css";?>" type="text/css" />
<link rel="stylesheet" href="<?php echo CSS_PATH."admin/login.css";?>" type="text/css" />
<link rel="stylesheet" href="<?php echo CSS_PATH."animate.css";?>" type="text/css" />
</head>
<body>
	<div class="fanqie-main layui-layout animated shake fanqie-delay2" id="fanqie_login">
		<div class="avatar">
			<img src="<?php echo IMG_PATH.'admin/adminloginlogo.png'?>" class="logo-img">
		</div>
		<p class="info">管理员后台登录中心</p>
		<div class="user-info">
			<form class="layui-form" id="fanqie_form" method="post">
				<div class="layui-form-item">
					<input type="text" name="username" class="layui-input fanqie-input" lay-verify='required|username' maxlength="10" placeholder="请输入帐号">
				</div>
				<div class="layui-form-item" id="password">
					<input type="password" name="password" class="layui-input fanqie-input" lay-verify='required|pass' maxlength="16" placeholder="请输入密码">
				</div>
				<div class="layui-form-item">
					<button class="layui-btn fanqie-btn layui-btn-radius f_ajax" lay-submit lay-filter='sub' url="<?php echo site_url("adminct/login/add")?>" location="<?php echo site_url("adminct/manager/index")?>">立即登录</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="<?php echo JS_PATH.'jquery.min.js'?>"></script>
	<script type="text/javascript" src="<?php echo JS_PATH.'admin/jquery.supersized.min.js'?>"></script>
	<script type="text/javascript" src="<?php echo LAYUI.'layui.all.js'?>"></script>
	<script type="text/javascript" src="<?php echo JS_PATH.'f_ajax.js'?>"></script>
	<script type="text/javascript" src="<?php echo LAYUI.'form_verify.js'?>"></script>

	<script type="text/javascript">
$(function(){
    $.supersized({
        // Functionality
        slide_interval     : 2000,    // Length between transitions
        transition         : 1,    // 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
        transition_speed   : 3000,    // Speed of transition
        performance        : 1,    // 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)
        // Size & Position
        min_width          : 0,    // Min width allowed (in pixels)
        min_height         : 0,    // Min height allowed (in pixels)
        vertical_center    : 1,    // Vertically center background
        horizontal_center  : 1,    // Horizontally center background
        fit_always         : 0,    // Image will never exceed browser width or height (Ignores min. dimensions)
        fit_portrait       : 1,    // Portrait images will not exceed browser height
        fit_landscape      : 0,    // Landscape images will not exceed browser width
        // Components
        slide_links        : 'blank',    // Individual links for each slide (Options: false, 'num', 'name', 'blank')
        slides             : [    // Slideshow Images
                                 {image : '<?php echo IMG_PATH.'admin/2.jpg'?>'},
                                 {image : '<?php echo IMG_PATH.'admin/3.jpg'?>'},
                                 {image : '<?php echo IMG_PATH.'admin/1.jpg'?>'}
                             ]
    });
	
});
</script>
</body>
</html>