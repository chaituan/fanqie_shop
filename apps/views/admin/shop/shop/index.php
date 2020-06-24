<?php echo template('admin/header');echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show">
		<div class="layui-card">
			<div class="layui-card-header pt15 pb15">
                <form class="layui-form">
                    <div class="layui-input-inline">
                        <input type="text"  id="srk" name="srk" placeholder="请输入商家名称" class="layui-input" >
                    </div>
                    <?php echo admin_btn('', 'find',"",'lay-filter="order-find"')?>
                    <span class="layui-badge layui-bg-orange">商家后台网址：<?php echo site_url('shop/login/index'); ?></span>
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
    <?php echo admin_btn(($dr_url.'/sh_ok/id-{{d.id}}'),'del','layui-btn-xs layui-bg-green f_del_d','lay-event="del"','通过');?>
    <?php echo admin_btn(($dr_url.'/sh_no/id-{{d.id}}'),'del','layui-btn-xs layui-bg-orange f_del_d','lay-event="del"','拒绝');?>
    <?php echo admin_btns(($edit_url.'/id-{{d.id}}'),'edit','layui-btn-xs fq_iframe');?>
    <?php echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"');?>
</script>
<script type="text/html" id="sth">
    {{# if(d.status==1){ }}
    <span style="color:#5FB878">已通过</span>
    {{# }else if(d.status==2){ }}
    <span style="color:#FF5722">关闭</span>
    {{# }else if(d.status==3){ }}
    <span style="color:#FF5722">拒绝</span>
    {{# }else{ }}
    <span style="color:#FFB800">等待审核</span>
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
        {field: 'title', title: '店铺名字',edit:'text'},
        {field: 'info', title: '店铺简介',edit:'text'},
        {field: 'mobile', title: '联系电话',edit:'text',width: 120},
        {field: 'username', title: '联系人',edit:'text',width: 120},
        {field: 'address', title: '地址',edit:'text'},
        {field: 'technical', title: '服务费用',edit:'text'},
        {field: 'mark', title: '备注',edit:'text'},
        {field: 'add_time', title: '注册时间',width: 180,toolbar:'<div>{{Time(d.add_time, "%y-%M-%d %h:%m")}}</div>'},
        {field: 'cname', title: '状态',width: 100,toolbar:"#sth"},
        {field: 'right', title: '操作',toolbar: '#operation',width: 190}
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
layui.form.on('submit(order-find)',function(){
    layui.table.reload('common',{//这里的find 是为了后台数据处理
        where:{cid:$('#cid').val(),name:$('#srk').val(),find:'find',total:''},
        done:function(res, curr, count){
            this.where.total = count;
            this.where.find = '';
        }
    });
    return false;
});
</script>
<?php echo template('admin/footer');?>