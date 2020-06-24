<?php echo template('admin/headers');?>
		<div class="layui-card">
			<div class="layui-card-body">
				<table  id="user" lay-filter="common"  ></table>
			</div>
		</div>
<?php echo template('admin/script');?>

<script type="text/html" id="operation">
<?php echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"','隐藏');?>
</script>
    <script type="text/html" id="sth">
        <input type="checkbox" lay-text='显示|隐藏' lay-skin="switch" lay-filter='open' {{# if(d.status==1){ }} checked {{#  } }}   data-url="<?php echo ($dr_url.'/lock/id-{{d.id}}')?>" >
    </script>
<script>
//执行渲染
layui.table.render({
	elem: '#user', //指定原始表格元素选择器（推荐id选择器）
	id:'common',//给事件用的
	height: 'full-250', //容器高度
	url:'<?php echo ("$dr_url/lists/pid-".$pid."-type-".$type)?>',
	cols: [[
	        {field: 'id', title: 'ID', width: 80},
            {field: 'nickname', title: '姓名', width: 80},
            {field: 'score', title: '评分（星）', width: 120},
	        {field: 'comment', title: '评价内容'},
            {field: 'reply_content', title: '管理员回复',edit:'text'},
            {field: 'status', title: '状态', width: 120,toolbar: '#sth'},
            {field: 'add_time', title: '时间',toolbar:'<div>{{Time(d.add_time, "%y-%M-%d %h:%m:%s")}}</div>',width: 200},
	       ]],
	limit: 20,
	page:true,
	response:{msgName:'message'},
	done:function(res, curr, count){
		this.where.total = count;
	}
});
layui.table.on('edit(common)', function(obj){
	var data = {id:obj.data.id},key = "data["+obj.field+"]";
	data[key] = obj.value;
	$.post('<?php echo ("$dr_url/edits")?>',data,function(d){layer.msg(d.message)},'json');
});
</script>
<?php echo template('admin/footers');?>