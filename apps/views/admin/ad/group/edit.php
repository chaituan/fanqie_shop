<?php echo template('admin/headers');?>
    <form class="layui-form layui-card-body" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">分组名称</label>
            <div class="layui-input-block">
                <input type="text" name="data[aname]" class="layui-input" value="<?php echo $item['aname']; ?>"  lay-verify='required'>
            </div>
        </div>

        <div>
            <input type="hidden" name="id" value="<?php echo $item['id'];?>" lay-verify='required'>
            <?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
        </div>
    </form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>