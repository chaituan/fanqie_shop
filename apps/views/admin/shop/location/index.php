<?php echo template('admin/header');echo template('admin/sider');?>
<div class="layui-body">
	<div class="childrenBody childrenBody_show">
		<div class="layui-card">
			<div class="layui-card-header pt15 pb15">
                <form class="layui-form">
                    <div class="layui-input-inline">
                        <select name="cid" id="cid">
                            <option value="0">区域列表</option>
                            <?php foreach ($group as $v){ ?>
                                <option value="<?php echo $v['id'] ?>"><?php echo $v['cname'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <input type="text"  id="srk" name="srk" placeholder="请输入标题" class="layui-input" >
                    </div>
                    <?php echo admin_btn('', 'find',"",'lay-filter="order-find"')?>


                </form>
			</div>

			<div class="layui-card-body">
                <div class="text-orange">默认说明：当用户拒绝获取地里位置或者当前用户所在地区没有开通区域的时候，则默认显示设置为默认的区域。默认点开后，其他默认则会自动取消，无需操作。</div>
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
    <?php echo admin_btns(($edit_url.'/id-{{d.id}}'),'edit','layui-btn-xs fq_iframe');?>
    <?php echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"');?>
</script>
<script type="text/html" id="sth">
    <input type="checkbox" lay-text='开|关' lay-skin="switch" lay-filter='open' {{# if(d.status==1){ }} checked {{#  } }}   data-url="<?php echo ($dr_url.'/lock/id-{{d.id}}')?>" >
</script>
    <script type="text/html" id="sths">
        <input type="checkbox" lay-text='开|关' lay-skin="switch" lay-filter='open' {{# if(d.default==1){ }} checked {{#  } }}   data-url="<?php echo ($dr_url.'/defaults/id-{{d.id}}')?>" >
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
            {field: 'title', title: '区域',edit:'text'},
            {field: 'point', title: '坐标',edit:'text',toolbar:"<div>{{d.latitude}},{{d.longitude}}</div>"},
            {field: 'address', title: '地址',edit:'text'},
            {field: 'cname', title: '状态',width: 150,toolbar:"#sth"},
            {field: 'cname', title: '默认',width: 150,toolbar:"#sths"},
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