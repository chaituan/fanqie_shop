<?php echo template('admin/headers');?>
<form class="layui-form layui-card-body" method="post">
	<div class="layui-form-item">
		<label class="layui-form-label">上级菜单</label>
		<div class="layui-input-block">
			<select name="data[pid]">
		        <?php foreach ($items as $value){?>
		        <option value="<?php echo $value['id'];?>"><?php echo $value['name'];?></option>
		        <?php }?>
	        </select>
		</div>
		<input type="hidden" name="images" value="<?php echo $images;?>">
	</div>
	<div>
		<?php echo admin_btn(site_url('adminct/widget/images/moveimg'),'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe_r'")?>
	</div>
</form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>