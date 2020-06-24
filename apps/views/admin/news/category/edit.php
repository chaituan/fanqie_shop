<?php echo template('admin/headers');?>
<form class="layui-form layui-card-body" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label"> 上级</label>
        <div class="layui-input-block">
            <select name="data[parent_id]" >
                <option value="0">顶级</option>
                <?php foreach($parent as $v){?>
                    <option value="<?php echo $v['id'];?>" <?php if($v['id']==$item['parent_id']) echo "selected";?>>  <?php echo str_repeat('├',$v['level']).' '.$v['gname'];?></option>
                <?php }?>
            </select>
        </div>
    </div>
	<div class="layui-form-item">
		<label class="layui-form-label">分类名称</label>
		<div class="layui-input-block">
			<input type="text" name="data[gname]" class="layui-input" value="<?php echo $item['gname']?>" lay-verify='required'>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">分类图片</label>
		<div class="layui-input-block">
			<?php echo admin_btn("data[icon]",'upload','pic',$item['icon'],1,1);?>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">排序数字</label>
		<div class="layui-input-block">
			<input type="text" name="data[sort]" value="<?php echo $item['sort']?>" class="layui-input" placeholder="排序数字" lay-verify='required|number'>
		</div>
	</div>
	<div>
		<input type="hidden" name="id" value="<?php echo $item['id']?>" lay-verify='required'>
		<?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
	</div>
</form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>