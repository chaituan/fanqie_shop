<?php echo template('admin/headers');?>
<form class="layui-form layui-card-body" method="post">
	<input type="hidden" name="data[type]" class="layui-input" value="<?php echo $typeval;?>" lay-verify='required'>
	<input type="hidden" name="data[config_tab_id]" class="layui-input" value="<?php echo $config_tab_id;?>" lay-verify='required'>
	
	<div class="layui-form-item">
		<label class="layui-form-label">配置名称</label>
		<div class="layui-input-block">
			<input type="text" name="data[info]" class="layui-input"  lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">字段变量</label>
		<div class="layui-input-block">
			<input type="text" name="data[menu_name]"  class="layui-input" lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">配置简介</label>
		<div class="layui-input-block">
			<input type="text" name="data[desc]" class="layui-input" >
		</div>
	</div>
	<?php if($type==0){?>
	<div class="layui-form-item">
		<label class="layui-form-label">默认值</label>
		<div class="layui-input-block">
			<input type="text" name="data[value]" class="layui-input" >
		</div>
	</div>
	<?php }elseif($type==1){ ?>
	<div class="layui-form-item">
		<label class="layui-form-label">默认值</label>
		<div class="layui-input-block">
			<textarea rows="3" class="layui-textarea" name="data[value]"></textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">文本框行高</label>
		<div class="layui-input-block">
			<input type="text" name="data[high]" class="layui-input" >
		</div>
	</div>
	<?php }elseif($type==2){ ?>
	<div class="layui-form-item">
		<label class="layui-form-label">配置参数</label>
		<div class="layui-input-block">
			<textarea rows="3" class="layui-textarea" name="data[parameter]" placeholder="参数方式例如:1|男 回车 2|女"></textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">默认值</label>
		<div class="layui-input-block">
			<input type="text" name="data[value]" class="layui-input" >
		</div>
	</div>
	<?php }elseif($type==3){ ?>
	<div class="layui-form-item">
	    <label class="layui-form-label">文件类型</label>
	    <div class="layui-input-block">
	      <input type="radio" name="data[upload_type]" value="1" title="单图" checked>
	      <input type="radio" name="data[upload_type]" value="2" title="多图" >
	      <input type="radio" name="data[upload_type]" value="3" title="文件" >
	    </div>
	</div>
	<?php }elseif($type==4){ ?>
	<div class="layui-form-item">
		<label class="layui-form-label">配置参数</label>
		<div class="layui-input-block">
			<textarea rows="3" class="layui-textarea" name="data[parameter]" placeholder="参数方式例如:1|白色 回车 2|红色 回车 3|黑色"></textarea>
		</div>
	</div>
	<?php }?>
	<div class="layui-form-item">
		<label class="layui-form-label">验证规则</label>
		<div class="layui-input-block">
			<input type="text" name="data[required]" class="layui-input" value="required">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">排序</label>
		<div class="layui-input-block">
			<input type="text" name="data[sort]" class="layui-input" value="0">
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