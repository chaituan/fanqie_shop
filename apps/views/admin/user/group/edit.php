<?php echo template('admin/headers');?>
    <form class="layui-form layui-card-body" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-block">
                <input type="text" name="data[name]" class="layui-input" value="<?php echo $item['name']; ?>"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">等级</label>
            <div class="layui-input-block">
                <input type="text" name="data[grade]" class="layui-input" value="<?php echo $item['grade']; ?>"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">折扣</label>
            <div class="layui-input-block">
                <input type="text" name="data[discount]" class="layui-input" value="<?php echo $item['discount']; ?>"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标</label>
            <div class="layui-input-block">
                <?php echo admin_btn("data[icon]",'upload','icons',$item['icon'],1);?>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">背景图片</label>
            <div class="layui-input-block">
                <?php echo admin_btn("data[image]",'upload','image',$item['image'],1);?>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">说明</label>
            <div class="layui-input-block">
                <input type="text" name="data[explain]" class="layui-input"  value="<?php echo $item['explain']; ?>"  lay-verify='required'>
            </div>
        </div>

        <div>
            <input type="hidden" name="id" value="<?php echo $item['id'];?>" lay-verify='required'>
            <?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
        </div>
    </form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>