<?php echo template('admin/header',['definedcss'=>[CSS_PATH.'admin/diy']]);echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show">
		<div class="layui-card">
			<div class="layui-card-header">
				<form class="layui-form">
				<div class="layui-input-inline">
					首页设计
				</div>
				</form>
			</div>
			<div class="layui-card-body">
                <div class="widget-body am-cf">
                    <!--手机diy容器-->
                    <div class="diy-phone">
                        <!-- 手机顶部标题 -->
                        <div class="phone-top"></div>
                        <!-- 小程序内容区域 -->
                        <div id="phone-main" class="phone-main"></div>
                    </div>
                    <!-- 编辑器容器 -->
                    <div id="diy-editor" class="diy-editor form-horizontal">
                        <div class="editor-arrow"></div>
                        <div class="inner"></div>
                    </div>
                    <!-- 工具栏 -->
                    <div id="diy-menu" class="diy-menu">
                        <div class="navs">
                            <div id="">
                                <div class="title">组件</div>
                                <div id="components">
                                    <!--<nav class="special" data-type="search"> 搜索框</nav>-->
                                    <nav class="special" data-type="banner"> 图片轮播</nav>
                                    <nav class="special" data-type="adimg"> 图片魔方</nav>
                                    <nav class="special" data-type="nav"> 导航菜单</nav>
                                    <nav class="special" data-type="title"> 最新资讯</nav>
                                    <nav class="special" data-type="top_goods"> 销量榜单</nav>
                                    <nav class="special" data-type="hot_goods"> 爆品推荐</nav>
                                    <nav class="special" data-type="new_goods"> 最新商品</nav>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button id="submit" type="button" class="layui-btn layui-btn-sm">
                                保存页面
                            </button>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>
<script>

</script>
<?php echo template('admin/setting/tpl/tpl/diy');?>
<?php echo template('admin/setting/tpl/tpl/editor');?>
<?php echo template('admin/script');?>
    <script type="text/javascript" src="<?php echo JS_PATH.'admin/amazeui.min.js'?>" ></script>
    <script type="text/javascript" src="<?php echo JS_PATH.'admin/art-template.js'?>" ></script>
    <script type="text/javascript" src="<?php echo JS_PATH.'admin/ddsort.js'?>" ></script>
    <script type="text/javascript" src="<?php echo JS_PATH.'admin/diy.js'?>" ></script>
    <script>
        $(function () {
            // 渲染diy页面
            new diyPhone(<?php echo $page_data; ?>);
        });
    </script>
<?php echo template('admin/footer');?>