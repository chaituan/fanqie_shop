<?php echo template('admin/header');echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show">
		<div class="layui-card">
            <div class="layui-card-header pt15 pb15">
                <form class="layui-form">
                    <div class="layui-input-inline">
                        <input type="text"  id="srk" name="srk" placeholder="请输入标题" class="layui-input" >
                    </div>
                    <?php echo admin_btn('', 'find',"",'lay-filter="order-find"')?>
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
    <?php echo admin_btns(($edit_url.'/id-{{d.id}}'),'edit','layui-btn-xs fq_iframe');?>
    <?php echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"');?>
</script>
<script type="text/html" id="sth">
    <input type="checkbox" lay-text='开|关' lay-skin="switch" lay-filter='open' {{# if(d.status==1){ }} checked {{#  } }}   data-url="<?php echo ($dr_url.'/lock/id-{{d.id}}')?>" >
</script>
<script type="text/html" id="images">
    <div class="img_view"><img src="{{d.avatar}}"></div>
</script>
    <script type="text/html" id="sexs">
        {{# if(d.sex==1){ }}
        男
        {{# }else if(d.sex==2){ }}
        女
        {{# }else{ }}
        未知
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
        {field: 'user_type', title: '来源',width: 140},
        {field: 'avatar', title: '头像',width: 140,toolbar:'#images'},
        {field: 'sex', title: '性别',toolbar:'#sexs',width: 90},
        {field: 'mobile', title: '手机号',edit:'text',width: 150},
        {field: 'add_time', title: '注册时间',width: 200,toolbar:'<div>{{Time(d.add_time, "%y-%M-%d %h:%m:%s")}}</div>'},
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
layui.form.on('submit(order-find)',function(){
    layui.table.reload('common',{//这里的find 是为了后台数据处理
        where:{srk:$('#srk').val(),find:'find',total:''},
        done:function(res, curr, count){
            this.where.total = count;
            this.where.find = '';
        }
    });
    return false;
});
</script>
<?php echo template('admin/footer');?>