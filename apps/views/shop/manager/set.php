<?php echo template('shop/header');
echo template('shop/sider'); ?>
<div class="layui-body">
    <div class="childrenBody childrenBody_show">
        <div class="layui-card">
            <div class="layui-card-header ">
                店铺资料
            </div>
            <div class="layui-card-body">
                <form class="layui-form layui-card-body" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属区域</label>
                        <div class="layui-input-block">
                            <select disabled>
                                <?php foreach ($location as $val) { ?>
                                    <option  <?php echo $val['id'] == $item['location_id'] ? 'selected' : '' ?> ><?php echo $val['title']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">绑定用户</label>
                        <div class="layui-input-block">
                            <input type="text" id="title" value="<?php echo $user['nickname']; ?>" disabled  class="layui-input" lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">店铺LOGO</label>
                        <div class="layui-input-block">
                            <?php echo admin_btn("data[logo]", 'upload', 'logos', $item['logo'], 1,'',$shop_id); ?>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">店铺名称</label>
                        <div class="layui-input-block">
                            <input type="text" value="<?php echo $item['title']; ?>"
                                   class="layui-input" disabled lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">店铺简介</label>
                        <div class="layui-input-block">
                            <input type="text" id="title" name="data[info]" value="<?php echo $item['info']; ?>"
                                   class="layui-input" lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">联系电话</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[mobile]" value="<?php echo $item['mobile'] ?>" class="layui-input" lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">联系人</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[username]" class="layui-input"
                                   value="<?php echo $item['username'] ?>" lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">地图选择</label>
                        <button type='button' class='layui-btn open'>打开地图</button>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">商家地址</label>
                        <div class="layui-input-block">
                            <input type="text" id="address" name="data[address]" value="<?php echo $item['address'] ?>"
                                   class="layui-input"  placeholder="点击打开地图,选择后自动填写" lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">地址坐标</label>
                        <div class="layui-input-block">
                            <input type="text" name="data[point]" id="point"  value="<?php echo $item['latitude'] . ',' . $item['longitude']; ?>"
                                   class="layui-input" readonly placeholder="点击打开地图,选择后自动填写" lay-verify='required'>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">工商资质</label>
                        <div class="layui-input-block">
                            <?php echo admin_btn("data[thumb]", 'upload', 'thumb', $item['thumb'], 1,'',$shop_id); ?>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">帐号</label>
                        <div class="layui-input-block">
                            <input type="text" disabled value="<?php echo $item['account'] ?>" class="layui-input" lay-verify='required'>
                        </div>
                    </div>
                    <div>
                        <input type="hidden" name="data[province]" id="province"  value="<?php echo $item['province']; ?>" lay-verify='required'>
                        <input type="hidden" name="data[city]" class="city" value="<?php echo $item['city']; ?>" lay-verify='required'>
                        <input type="hidden" name="data[district]" id="district"  value="<?php echo $item['district']; ?>" lay-verify='required'>
                        <?php echo admin_btn($dr_url.'/set', 'save', 'layui-btn-fluid', "lay-filter='sub' location='close_iframe'") ?>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo template('shop/script'); ?>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=<?php echo $qqmap_key; ?>"></script>
<script>
    layui.config({
        base: base_url_js + 'res/layui/module/TMap/'
    }).use('TMap');

    // 加载并使用模块
    layui.use(['layer', 'TMap'], function () {
        var layer = layui.layer;
        var $ = layui.jquery;
        var TMap = layui.TMap;
        $('.open').click(function () {
            TMap.open({
                key: "<?php echo $qqmap_key; ?>",
                dialog: {title: '番茄地图坐标拾取器'},
                onChoose: function (point, adress, address_component, myIndex) {
                    $('#province').val(address_component.province);
                    $('.city').val(address_component.city);
                    $('#district').val(address_component.district);
                    $('#address').val(adress);
                    $('#point').val(point);
                }
            });
        });
    });
</script>
<?php echo template('shop/footer'); ?>

