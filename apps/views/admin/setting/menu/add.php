<?php echo template('admin/headers');?>
<form class="layui-form layui-card-body" method="post">
	<div class="layui-form-item">
		<label class="layui-form-label">上级菜单</label>
		<div class="layui-input-block">
			<select name="data[pid]"  >
				<option value="0">顶级菜单</option>
                <?php foreach ($menuData as $value){?>
                <option value="<?php echo $value['id'];?>" <?php if ($value['id']==$pid)echo 'selected';?>><?php echo $value['fh'].$value['menu_name'];?></option>
                <?php }?>
            </select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">菜单名称</label>
		<div class="layui-input-block">
			<input type="text" name="data[menu_name]" class="layui-input"  lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">模块名</label>
		<div class="layui-input-block">
			<input type="text" name="data[module]" value="adminct" class="layui-input" lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">控制器</label>
		<div class="layui-input-block">
			<input type="text" name="data[controller]" class="layui-input" >
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">方法名</label>
		<div class="layui-input-block">
			<input type="text" name="data[action]"  class="layui-input" >
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">参数名</label>
		<div class="layui-input-block">
			<input type="text" name="data[params]"  class="layui-input" >
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">图标</label>
		<div class="layui-input-block">
			<input type="text" name="data[icon]"  class="layui-input" >
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">排序数字</label>
		<div class="layui-input-block">
			<input type="text" name="data[sort]" value="0" class="layui-input" placeholder="排序数字" lay-verify='required|number'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">是否显示</label>
		<div class="layui-input-block">
			<input type="hidden" name="data[is_show]" value="0" >
			<input type="checkbox" name="data[is_show]" value="1"  lay-skin="switch">
		</div>
	</div>
	<div>
		<?php echo admin_btn($add_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
	</div>
</form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>