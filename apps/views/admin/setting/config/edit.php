<?php echo template('admin/headers');?>
<form class="layui-form layui-card-body" method="post">
	<div class="layui-form-item">
		<label class="layui-form-label">配置名称</label>
		<div class="layui-input-block">
			<input type="text" name="data[info]" class="layui-input" value="<?php echo $item['info']?>" lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">配置简介</label>
		<div class="layui-input-block">
			<input type="text" name="data[desc]" class="layui-input" value="<?php echo $item['desc']?>">
		</div>
	</div>
	<?php if($item['type']=='text'){?>
	<div class="layui-form-item">
		<label class="layui-form-label">默认值</label>
		<div class="layui-input-block">
			<input type="text" name="data[value]" value="<?php echo $item['value'];?>" class="layui-input" >
		</div>
	</div>
	<?php }elseif($item['type']=='textarea'){ ?>
	<div class="layui-form-item">
		<label class="layui-form-label">默认值</label>
		<div class="layui-input-block">
			<textarea rows="3" class="layui-textarea" name="data[value]" ><?php echo $item['value']?></textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">文本框行高</label>
		<div class="layui-input-block">
			<input type="text" name="data[high]" class="layui-input" value="<?php echo $item['high']?>" >
		</div>
	</div>
	<?php }elseif($item['type']=='radio'){ ?>
	<div class="layui-form-item">
		<label class="layui-form-label">配置参数</label>
		<div class="layui-input-block">
			<textarea rows="3" class="layui-textarea" name="data[parameter]" placeholder="参数方式例如:\n1=>男\n2=>女\n3=>保密"><?php echo $item['parameter']?></textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">默认值</label>
		<div class="layui-input-block">
			<input type="text" name="data[value]" class="layui-input" value="<?php echo $item['value'];?>">
		</div>
	</div>
	<?php }elseif($item['type']=='upload'){ ?>
	<div class="layui-form-item">
	    <label class="layui-form-label">文件类型</label>
	    <div class="layui-input-block">
	      <input type="radio" name="data[upload_type]" value="1" title="单图" <?php echo $item['upload_type']==1?'checked':''?>>
	      <input type="radio" name="data[upload_type]" value="2" title="多图" <?php echo $item['upload_type']==2?'checked':''?>>
	      <input type="radio" name="data[upload_type]" value="3" title="文件" <?php echo $item['upload_type']==3?'checked':''?>>
	    </div>
	</div>
	<?php }elseif($item['type']=='checkbox'){ ?>
	<div class="layui-form-item">
		<label class="layui-form-label">配置参数</label>
		<div class="layui-input-block">
			<textarea rows="3" class="layui-textarea" name="data[parameter]"  placeholder="参数方式例如:\n1=>白色\n2=>红色\n3=>黑色"><?php echo $item['parameter']?></textarea>
		</div>
	</div>
	<?php }?>
	<div class="layui-form-item">
		<label class="layui-form-label">验证规则</label>
		<div class="layui-input-block">
			<input type="text" name="data[required]" class="layui-input" value="<?php echo $item['required']?>">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">排序</label>
		<div class="layui-input-block">
			<input type="text" name="data[sort]" class="layui-input" value="<?php echo $item['sort']?>">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">是否显示</label>
		<div class="layui-input-block">
			<input type="hidden" name="data[status]" value="0" >
			<input type="checkbox" name="data[status]" value="1"  lay-skin="switch" <?php echo $item['status']?'checked':''?> >
		</div>
	</div>
	<div>
		<input type="hidden" name="id" value="<?php echo $item['id']?>" lay-verify='required'>
		<?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
	</div>
</form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>