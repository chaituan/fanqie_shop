<?php echo template('admin/headers');?>
<form class="layui-form layui-card-body" method="post">
	<div class="layui-form-item">
		<label class="layui-form-label">分类名称</label>
		<div class="layui-input-block">
			<input type="text" name="data[title]" class="layui-input"  lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">分类字段</label>
		<div class="layui-input-block">
			<input type="text" name="data[eng_title]" value="" class="layui-input" lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">类型</label>
		<div class="layui-input-block">
			<?php foreach ($types as $k=>$v){?>
				<input type="radio" name="data[type]" value="<?php echo $k;?>" title="<?php echo $v;?>" <?php echo $k==0?'checked':''?>>
			<?php }?>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">是否显示</label>
		<div class="layui-input-block">
			<input type="hidden" name="data[status]" value="0" >
			<input type="checkbox" name="data[status]" value="1"  lay-skin="switch" checked>
		</div>
	</div>
	<div>
		<?php echo admin_btn($add_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
	</div>
</form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>