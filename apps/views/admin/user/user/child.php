<?php echo template('admin/headers');?>
    <div class="layui-card">
        <div class="layui-card-body">
            <table  id="user" lay-filter="common"  ></table>
        </div>
    </div>
<?php echo template('admin/script');?>

<script>
//执行渲染
var tab = layui.table.render({
	elem: '#user', //指定原始表格元素选择器（推荐id选择器）
	id:'common',//给事件用的
	height: 'full-250', //容器高度
	url:'<?php echo ("$dr_url/child_lists/".$url)?>',
	cols: [[
	       {field: 'id', title: 'ID', width: 80,sort:true},
	       {field: 'nickname', title: '昵称'},
           {field: 'mobile', title: '手机号'},
	       {field:'avatar',title:'头像',toolbar:'<div><div class="img_view"><img src="{{d.avatar}}"></div></div>'},
	       {field: 'add_time', title: '注册时间',toolbar:'<div>{{Time(d.add_time, "%y-%M-%d %h:%m:%s")}}</div>',width: 180},
	       ]],
	limit: 15,
	page:true,
	response:{msgName:'message'},
	done:function(res, curr, count){
		this.where.total = count;
		layer.photos({photos:'.img_view'});//添加预览
	}
});


</script>
<?php echo template('admin/footers');?>