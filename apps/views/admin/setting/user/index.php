<?php echo template('admin/header');echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show">
		<div class="layui-card">
			<div class="layui-card-header pt15 pb15">
				<form class="layui-form">
				<div class="layui-input-inline">
					<input type="text"  id="table-find-val" placeholder="请输入标题" class="layui-input" lay-verify='required'>
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
<script type="text/html" id="add">
<?php echo admin_btns($add_url,'add','layui-btn-normal fq_iframe');?>
</script>
<script type="text/html" id="operation">
<?php echo admin_btns(($dr_url.'/edit/id-{{d.id}}'),'edit','layui-btn-xs fq_iframe');?>
<?php echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"');?>
</script>
<script type="text/html" id="sth">
<input type="checkbox" lay-text='是|否' lay-skin="switch" lay-filter='open' {{# if(d.status==1){ }} checked {{#  } }}   data-url="<?php echo ($dr_url.'/lock/id-{{d.id}}')?>" >
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
	       {field: 'account', title: '帐号'},
	       {field: 'pwd', title: '密码',edit:'text'},
	       {field: 'real_name', title: '姓名',edit:'text'},
	       {field: 'role_name', title: '角色名'},
	       {field: 'last_time', title: '最后登录',toolbar:'<div>{{Time(d.last_time, "%y-%M-%d %h:%m:%s")}}</div>'},
	       {field: 'last_ip', title: '登录IP'},
	       {field: 'status', title: '显示',toolbar: '#sth', width: 90},
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