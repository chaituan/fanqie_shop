<?php echo template('admin/headers');?>
<form class="layui-form layui-card-body" method="post">
	
	<div class="layui-form-item">
		<label class="layui-form-label">选择角色</label>
		<div class="layui-input-block">
			<select name="data[roles]"  >
			<?php foreach ($role as $val){?>
				<option value="<?php echo $val['id'];?>" <?php echo $item['roles']==$val['id']?'selected':''?> ><?php echo $val['role_name'];?></option>
			<?php }?>
		    </select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">管理员姓名</label>
		<div class="layui-input-block">
			<input type="text" name="data[real_name]" class="layui-input" value="<?php echo $item['real_name'];?>"  lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">是否开启</label>
		<div class="layui-input-block">
			<input type="hidden" name="data[status]" value="0" >
			<input type="checkbox" name="data[status]" value="1" <?php echo $item['status']?'checked':'';?> lay-skin="switch">
		</div>
	</div>
	<div>
		<input type="hidden" name="id" value="<?php echo $item['id'];?>" >
		<?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
	</div>
</form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>