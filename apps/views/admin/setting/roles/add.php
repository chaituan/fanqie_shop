<?php echo template('admin/headers');?>
<form class="layui-form layui-card-body" method="post">
	
	<div class="layui-form-item">
		<label class="layui-form-label">角色名称</label>
		<div class="layui-input-block">
			<input type="text" name="data[role_name]" class="layui-input"  lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">是否开启</label>
		<div class="layui-input-block">
			<input type="hidden" name="data[status]" value="0" >
			<input type="checkbox" name="data[status]" value="1" checked lay-skin="switch">
		</div>
	</div>
	<div class="layui-form-item">
        <label class="layui-form-label">选择权限</label>
        <div class="layui-input-block">
            <div id="LAY-auth-tree-index"></div>
        </div>
    </div>
	<div>
		<?php echo admin_btn($add_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
	</div>
</form>
<?php echo template('admin/script');?>
<script type="text/javascript">
layui.config({
	base: '<?php echo LAYUI.'extends/'; ?>',
}).extend({
	authtree: 'authtree',
});
layui.use(['jquery', 'authtree', 'form', 'layer'], function(){
	var $ = layui.jquery;
	var authtree = layui.authtree;
	$.ajax({
		url: '<?php echo site_url('adminct/setting/adminroles/getroles') ?>',
		type:'post',
        data:{rules:''},
		dataType: 'json',
		success: function(data){
			var trees = authtree.listConvert(data.data, {
			    primaryKey: 'id'
			    ,startPid: 0
			    ,parentKey: 'pid'
			    ,nameKey: 'name'
			    ,valueKey: 'id'
			    ,checkedKey: 0
			});
			authtree.render('#LAY-auth-tree-index', trees, {
				inputname: 'rules[]', 
				layfilter: 'lay-check-auth', 
				autowidth: true,
			});
		}
	});
	
}); 

</script>
<?php echo template('admin/footers');?>