<?php echo template('admin/headers');?>
    <form class="layui-form layui-card-body" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">提现方式</label>
            <div class="layui-input-block">
                <input type="text"  class="layui-input" value="<?php echo $item['type_say']; ?>" readonly  lay-verify='required'>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">提现信息</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea"><?php echo $item['type_data']; ?></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">提现金额</label>
            <div class="layui-input-block">
                <input type="text"  name="data[money]" class="layui-input" value="<?php echo $item['money']; ?>"  lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手续费</label>
            <div class="layui-input-block">
                <input type="text"  class="layui-input" value="<?php echo $item['sxf']; ?>" readonly lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否通过</label>
            <div class="layui-input-block">
                <input type="radio" name="data[status]" value="1" title="通过" checked>
                <input type="radio" name="data[status]" value="2" title="拒绝" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="data[mark]" class="layui-input"  value="<?php echo $item['mark']; ?>"  >
            </div>
        </div>

        <div>
            <input type="hidden" name="id" value="<?php echo $item['id'];?>" lay-verify='required'>
            <?php echo admin_btn($edit_url.'/type-'.$type,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
        </div>
        <div class="layui-form-item">
            <div class="layui-form-mid layui-word-aux">
                1.通过后会直接打款到用户的零钱，一般新的商户需要连续三个月有交易，才能使用此接口<br>
                2.如果自动提现接口，还未开通，请尝试每天产生一笔交易，尽快联系微信商户客服开通。
            </div>
        </div>

    </form>
<?php echo template('admin/script');?>
<?php echo template('admin/footers');?>