<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<title><?php echo SYSTEM_NAME;?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="chaituan@126.com">
<link rel="stylesheet" href="<?php echo LAYUI."css/layui.css";?>" type="text/css" />
<link rel="stylesheet" href="<?php echo CSS_PATH."admin/main.css";?>" type="text/css" />
<style>
html {
	background-color: #fff;
}
</style>
</head>
<body>
	<div class="layui-container text-center">
		<div class="layui-row">
			<div class="layui-col-md12 msg-icon-style msg-icon-<?php echo $status;?>">    
    	<?php echo $tipsico;?>
    </div>
		</div>
		<div class="layui-row" style="margin: 10px 0;">
			<div class="layui-col-md12">
				<h2 class="msg-title"><?php echo $msg; ?></h2>
			</div>
		</div>
		<div class="layui-row msg-btn">
			<div class="layui-col-md12">
    	<?php if($url_forward=='goback' || $url_forward=='') { if($show_btn){ ?>
				<p>
					<button type="button" class="layui-btn" onclick="javascript:history.back();">返回上一步</button>
				</p>
				<p>
					<button type="button" class="layui-btn" onclick="window.location.href='<?php echo $index;?>'">返回首页</button>
				</p>
		<?php }} elseif($url_forward) {?>
				<p style="margin-top: 20px;"><?php echo ($ms/1000);?> 秒后自动返回，如没有跳转，请：<a href="<?php echo $url_forward?>" style="color: #777;">点击这里</a>
				</p>
				<script language="javascript">setTimeout(function(){window.location.href='<?php echo $url_forward?>';},<?php echo $ms?>);</script>
		<?php }?>
    </div>
		</div>
	</div>
	<div style="position: fixed; left: 0px; right: 0; bottom: 0; height: 44px; line-height: 44px; padding: 0 15px; background-color: #eee; text-align: center;">
		<p>© 2016 - <?php echo format_time(time(),'Y')?> &nbsp;&nbsp; <a href="http://www.chaituans.com/" target="_blank"><?php echo COMPANY;?> &nbsp;&nbsp;</a>
		</p>
	</div>


	<script type="text/javascript" src="<?php echo JS_PATH.'icon.js'?>"></script>
</body>
</html>