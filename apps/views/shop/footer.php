		<!-- 底部 -->
		<div class="layui-footer footer">
			  <p>© 2016 - <?php echo format_time(time(),'Y')?> &nbsp;&nbsp; 商家后台系统</p>
		</div>
</div>
	
<!-- 移动导航 -->
<div class="site-mobile-shade"></div>
<script>
$(function(){
	$(".line").slideUp();	
})

$(".hideMenu").click(function(){
	$(".layui-layout-admin").toggleClass("showMenu");
})
//手机设备的简单适配
var treeMobile = $('.site-tree-mobiles'),shadeMobile = $('.site-mobile-shade')
treeMobile.on('click', function(){
	if($('body').hasClass('site-mobile')){
		$('body').removeClass('site-mobile');
	}else{
		$('body').addClass('site-mobile');
	}
});

$('.layui-side a').on('click touchend', function(e) {
    var el = $(this);
    var link = el.attr('href');
    window.location = link;
});

shadeMobile.on('click', function(){
	$('body').removeClass('site-mobile');
});


$(".edit_pwd").on("click",function(){
	layer.open({
		type:1,
        title:'修改密码',
        content: '<form class="layui-form  open-form" method="post">'
                 +'<div class="layui-form-item"><input type="password" name="oldpass" class="layui-input" placeholder="登录密码"  lay-verify="required"></div>'
                 +'<div class="layui-form-item"><input type="password" name="password" class="layui-input" placeholder="输入新密码" id="pwd" lay-verify="pass|required"></div>'
                 +'<div class="layui-form-item"><input type="password" class="layui-input" placeholder="再次输入新密码" lay-verify="repass|required"></div>'
                 +'<div class="layui-form-item"><button class="layui-btn " lay-submit url="<?php echo site_url('shop/manager/password')?>" lay-filter="sub" location="" >确认提交</button></div>'
                 +'</form>'
    });
})


</script>
</body>
</html>