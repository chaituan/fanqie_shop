
<!-- 底部 -->
<div class="layui-footer footer">
	<div class="copyright">
        <?php if($footer){ ?>
            Powered by <b><?php echo $footer ?></b> © 2014-<?php echo format_time(time(),'Y'); ?>
        <?php }else{ ?>
            <p>© 2016 - <?php echo format_time(time(),'Y')?> &nbsp;&nbsp; <a href="http://www.chaituans.com/" target="_blank"><?php echo COMPANY;?> &nbsp;&nbsp;</a> 版权所有 V3.0 </p>
        <?php } ?>
	</div>
</div>
</div>

<!-- 移动导航 -->
<div class="site-tree-mobile layui-hide">
	<i class="fa fa-lg fa-angle-right"></i>
</div>
<div class="site-mobile-shade"></div>
<script>
$(".hideMenu").click(function(){
	$(".layui-layout-admin").toggleClass("showMenu");
})
//手机设备的简单适配
var treeMobile = $('.site-tree-mobile'),shadeMobile = $('.site-mobile-shade')
treeMobile.on('click', function(){
	$('body').addClass('site-mobile');
});
shadeMobile.on('click', function(){
	$('body').removeClass('site-mobile');
});
//锁屏
function lockPage(){
	layer.open({
		type:1,
		title : false,
		content : '<div class="admin-header-lock" id="lock-box">'
						+'<div class="input_btn">'
						+	'<input type="password" class="admin-header-lock-input layui-input" autocomplete="off" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" autocomplete="off"/>'
						+	'<br><button class="layui-btn" id="unlock">解锁</button>'
						+'</div>'
					+'</div>',
		closeBtn : 0,
		shade : 0.9,
	})
	$(".admin-header-lock-input").focus();
}
$(".lockcms").on("click",function(){
	window.sessionStorage.setItem("lockcms",true);
	lockPage();
})
// 判断是否显示锁屏
if(window.sessionStorage.getItem("lockcms") == "true"){
	lockPage();
}
// 解锁
$("body").on("click","#unlock",function(){
	if($(this).siblings(".admin-header-lock-input").val() == ''){
		layer.msg("请输入解锁密码！");
	}else{
		if($(this).siblings(".admin-header-lock-input").val() == "123456"){
			window.sessionStorage.setItem("lockcms",false);
			$(this).siblings(".admin-header-lock-input").val('');
			layer.closeAll("page");
		}else{
			layer.msg("密码错误，请重新输入！");
		}
	}
});
$(document).on('keydown', function() {
	if(event.keyCode == 13) {
		$("#unlock").click();
	}
});

$(".changeCreat").on("click",function(){
    layer.confirm('每次更新版本，需要生成一次，其他时间不需要生成', {
        btn: ['开始生成','取消'] //按钮
    }, function(){
        var index = layer.load();
        $.post(site_url_js+'/adminct/manager/creat','',function (res) {
            layer.msg(res.message);
            layer.close(index);
        },'json');
    }, function(){

    });
})
$(".edit_pwd").on("click",function(){
	layer.open({
		type:1,
        title:'修改密码',
        content: '<form class="layui-form  open-form" method="post">'
                 +'<div class="layui-form-item"><input type="password" name="oldpass" class="layui-input" placeholder="登录密码"  lay-verify="required"></div>'
                 +'<div class="layui-form-item"><input type="password" name="password" class="layui-input" placeholder="输入新密码" id="pwd" lay-verify="pass|required"></div>'
                 +'<div class="layui-form-item"><input type="password" class="layui-input" placeholder="再次输入新密码" lay-verify="repass|required"></div>'
                 +'<div class="layui-form-item"><button class="layui-btn " lay-submit url="<?php echo site_url('adminct/manager/password')?>" lay-filter="sub" location="" >确认提交</button></div>'
                 +'</form>'
    });
})

//更换皮肤
	function skins(){
		var skin = window.sessionStorage.getItem("skin");
		if(skin){  //如果更换过皮肤
			if(window.sessionStorage.getItem("skinValue") != "自定义"){
				$("body").addClass(window.sessionStorage.getItem("skin"));
			}else{
				$(".layui-layout-admin .layui-header").css("background-color",skin.split(',')[0]);
				$(".layui-bg-black").css("background-color",skin.split(',')[1]);
				$(".hideMenu").css("background-color",skin.split(',')[2]);
			}
		}
	}
	skins();
	$(".changeSkin").click(function(){
		layer.open({
			title : "更换皮肤",
			type : "1",
			content : '<div class="skins_box">'+
						'<form class="layui-form">'+
							'<div class="layui-form-item">'+
								'<input type="radio" name="skin" value="默认" title="默认" lay-filter="default" checked="">'+
								'<input type="radio" name="skin" value="橙色" title="橙色" lay-filter="orange">'+
								'<input type="radio" name="skin" value="蓝色" title="蓝色" lay-filter="blue">'+
								'<input type="radio" name="skin" value="自定义" title="自定义" lay-filter="custom">'+
								'<div class="skinCustom">'+
									'<input type="text" class="layui-input topColor" name="topSkin" placeholder="顶部颜色" />'+
									'<input type="text" class="layui-input leftColor" name="leftSkin" placeholder="左侧颜色" />'+
									'<input type="text" class="layui-input menuColor" name="btnSkin" placeholder="顶部菜单按钮" />'+
								'</div>'+
							'</div>'+
							'<div class="layui-form-item skinBtn">'+
								'<a href="javascript:;" class="layui-btn layui-btn-small layui-btn-normal" lay-submit="" lay-filter="changeSkin">确定更换</a>'+
								'<a href="javascript:;" class="layui-btn layui-btn-small layui-btn-primary" lay-submit="" lay-filter="noChangeSkin">我再想想</a>'+
							'</div>'+
						'</form>'+
					'</div>',
			success : function(index, layero){
				var skin = window.sessionStorage.getItem("skin");
				if(window.sessionStorage.getItem("skinValue")){
					$(".skins_box input[value="+window.sessionStorage.getItem("skinValue")+"]").attr("checked","checked");
				};
				if($(".skins_box input[value=自定义]").attr("checked")){
					$(".skinCustom").css("visibility","inherit");
					$(".topColor").val(skin.split(',')[0]);
					$(".leftColor").val(skin.split(',')[1]);
					$(".menuColor").val(skin.split(',')[2]);
				};
				layui.form.render();
				$(".skins_box").removeClass("layui-hide");
				$(".skins_box .layui-form-radio").on("click",function(){
					var skinColor;
					if($(this).find("div").text() == "橙色"){
						skinColor = "orange";
					}else if($(this).find("div").text() == "蓝色"){
						skinColor = "blue";
					}else if($(this).find("div").text() == "默认"){
						skinColor = "";
					}
					if($(this).find("div").text() != "自定义"){
						$(".topColor,.leftColor,.menuColor").val('');
						$("body").removeAttr("class").addClass("main_body "+skinColor+"");
						$(".skinCustom").removeAttr("style");
						$(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
					}else{
						$(".skinCustom").css("visibility","inherit");
					}
				})
				var skinStr,skinColor;
				$(".topColor").blur(function(){
					$(".layui-layout-admin .layui-header").css("background-color",$(this).val());
				})
				$(".leftColor").blur(function(){
					$(".layui-bg-black").css("background-color",$(this).val());
				})
				$(".menuColor").blur(function(){
					$(".hideMenu").css("background-color",$(this).val());
				})

				layui.form.on("submit(changeSkin)",function(data){
					if(data.field.skin != "自定义"){
						if(data.field.skin == "橙色"){
							skinColor = "orange";
						}else if(data.field.skin == "蓝色"){
							skinColor = "blue";
						}else if(data.field.skin == "默认"){
							skinColor = "";
						}
						window.sessionStorage.setItem("skin",skinColor);
					}else{
						skinStr = $(".topColor").val()+','+$(".leftColor").val()+','+$(".menuColor").val();
						window.sessionStorage.setItem("skin",skinStr);
						$("body").removeAttr("class").addClass("main_body");
					}
					window.sessionStorage.setItem("skinValue",data.field.skin);
					layer.closeAll("page");
				});
				layui.form.on("submit(noChangeSkin)",function(){
					$("body").removeAttr("class").addClass("main_body "+window.sessionStorage.getItem("skin")+"");
					$(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
					skins();
					layer.closeAll("page");
				});
			},
			cancel : function(){
				$("body").removeAttr("class").addClass("main_body "+window.sessionStorage.getItem("skin")+"");
				$(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
				skins();
			}
		})
	})
</script>
</body>
</html>