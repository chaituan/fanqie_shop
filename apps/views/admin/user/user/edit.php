<?php echo template('admin/headers');?>
    <form class="layui-form layui-card-body" method="post">



        <div class="layui-form-item">
            <label class="layui-form-label">用户昵称</label>
            <div class="layui-input-block">
                <input type="text" name="data[nickname]" class="layui-input" value="<?php echo $item['nickname'];?>"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">余额修改</label>
            <div class="layui-input-block">
                <input type="radio" name="data[now_money_ands]" value="+" title="增加" checked>
                <input type="radio" name="data[now_money_ands]" value="-" title="减少" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">加减余额</label>
            <div class="layui-input-block">
                <input type="text" name="data[now_money]" class="layui-input" value="0"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">积分修改</label>
            <div class="layui-input-block">
                <input type="radio" name="data[integral_ands]" value="+" title="增加" checked>
                <input type="radio" name="data[integral_ands]" value="-" title="减少" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">加减积分</label>
            <div class="layui-input-block">
                <input type="text" name="data[integral]" class="layui-input" value="0"  lay-verify='required'>
            </div>
        </div>
        <div>
            <input type="hidden" name="id" value="<?php echo $item['id'];?>" lay-verify='required'>
            <?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
        </div>
    </form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>

