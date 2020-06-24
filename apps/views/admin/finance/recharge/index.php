<?php echo template('admin/header');echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show">
		<div class="layui-card">
            <div class="layui-card-header pt15 pb15">
                <form class="layui-form">
                    <div class="layui-input-inline">
                        <input type="text"  id="table-find-val"  placeholder="请输入昵称" class="layui-input" >
                    </div>
                    <?php echo admin_btn('', 'find',"",'lay-filter="table-find"')?>
                </form>
            </div>
			<div class="layui-card-body">
				<table  id="user" lay-filter="common"  ></table>
			</div>
		</div>
	</div>
</div>
<?php echo template('admin/script');?>
<script type="text/html" id="operation">
    <?php echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"');?>
</script>
<script type="text/html" id="images">
    <div class="img_view"><img src="{{d.avatar}}"></div>
</script>
    <script type="text/html" id="status">
        {{# if(d.status==0){ }}
        <span class="text-red">等待支付</span>
        {{# }else if(d.status==1){ }}
        <span class="text-green">支付成功</span>
        {{# } }}
    </script>
<script>
//执行渲染
layui.table.render({
	elem: '#user', //指定原始表格元素选择器（推荐id选择器）
	id:'common',//给事件用的
	height: 'full-250', //容器高度
	url:'<?php echo ("$dr_url/lists")?>',toolbar: '#add',
	cols: [[
        {field: 'id', title: 'ID', width: 80},
        {field: 'nickname', title: '昵称'},
        {field: 'order_no', title: '订单号'},
        {field: 'money', title: '金额'},
        {field: 'status', title: '支付状态',toolbar:'#status',width: 200},
        {field: 'add_time', title: '添加时间',width: 200,toolbar:'<div>{{Time(d.add_time, "%y-%M-%d %h:%m:%s")}}</div>'},
        {field: 'right', title: '操作',toolbar: '#operation',width: 90}
	       ]],
	limit: 20,
	page:true,
	response:{msgName:'message'},
	done:function(res, curr, count){
		this.where.total = count;
        layer.photos({photos:'.img_view'});//添加预览
	}
});

layui.table.on('edit(common)', function(obj){
	var data = {id:obj.data.id},key = "data["+obj.field+"]";
	data[key] = obj.value;
	$.post('<?php echo ("$dr_url/edits")?>',data,function(d){layer.msg(d.message)},'json');
});
</script>
<?php echo template('admin/footer');?>