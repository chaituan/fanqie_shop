<?php echo template('admin/header');echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show">
		<div class="layui-card">
			<div class="layui-card-header">
                会员等级(<a href="http://www.chaituans.com/ndetail/id-293-mid-1.html" style="color:red" target="_blank">使用说明</a>)
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
    <?php echo admin_btns(site_url('/adminct/user/task/index/id-{{d.id}}'),'','layui-btn-xs fq_iframe','','任务');?>
    <?php echo admin_btns(($edit_url.'/id-{{d.id}}'),'edit','layui-btn-xs fq_iframe');?>
    <?php echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"');?>
</script>
<script type="text/html" id="sth">
<input type="checkbox" lay-text='开|关' lay-skin="switch" lay-filter='open' {{# if(d.status==1){ }} checked {{#  } }}   data-url="<?php echo ($dr_url.'/lock/id-{{d.id}}')?>" >
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
        {field: 'name', title: '名称',edit:'text'},
        {field: 'grade', title: '等级',edit:'text'},
        {field: 'discount', title: '折扣',edit:'text'},
        {field: 'explain', title: '说明',edit:'text'},
        {field: 'right', title: '操作',toolbar: '#operation',width: 150}
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