<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title><?php echo SYSTEM_NAME;?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="author" content="chaituan@126.com">
<link rel="stylesheet" href="<?php echo LAYUI."css/layui.css";?>" type="text/css" />
    <link rel="stylesheet" href="<?php echo CSS_PATH."admin/mains.css";?>" type="text/css" />
<link rel="stylesheet" href="<?php echo CSS_PATH."admin/main.css";?>" type="text/css" />
<link rel="stylesheet" href="<?php echo CSS_PATH."font-awesome.min.css";?>" type="text/css" />
<?php  if(isset($definedcss)){   foreach ($definedcss as $v){?>
	<link type="text/css" href="<?php echo $v.'.css'?>" rel="stylesheet" />
<?php }}?>
</head>
<script type="text/javascript">
    const site_url_js = '<?php echo site_url(); ?>';
    const base_url_js = '<?php echo base_url(); ?>';
</script>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main">
				<a href="<?php echo site_url('adminct/manager/index')?>" class="logo"><?php echo SYSTEM_NAME;?></a>
				<!-- 显示/隐藏菜单 -->
				<a href="javascript:;" class="iconfont hideMenu icon-menu1"><i class="fa fa-bars"></i></a>


				<!-- 顶部右侧菜单 -->
				<ul class="layui-nav top_menu">

					<li class="layui-nav-item" mobile><a href="<?php echo site_url('adminct/login/logout')?>" class="signOut"><i class="iconfont icon-loginout"></i> 退出</a></li>
					<li class="layui-nav-item lockcms" pc><a href="javascript:;"><i class="fa fa-fw fa-lock"></i><cite>锁屏</cite></a></li>
					<li class="layui-nav-item" pc><a href="javascript:;"> <i class="fa fa-fw fa-address-card"></i> <cite><?php echo $_admin['account']?></cite>
					</a>
						<dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" class="edit_pwd"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a>
                            </dd>
							<dd>
								<a href="javascript:;" class="changeSkin"><i class="iconfont icon-huanfu"></i><cite>更换皮肤</cite></a>
							</dd>
							<dd>
								<a href="<?php echo site_url('adminct/login/logout')?>" class="signOut"><i class="iconfont icon-loginout"></i><cite>退出系统</cite></a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>