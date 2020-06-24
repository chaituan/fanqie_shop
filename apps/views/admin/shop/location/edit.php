<?php echo template('admin/headers');?>
    <form class="layui-form layui-card-body" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">地图选择</label>
            <button type='button' class='layui-btn open' >打开地图</button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">区域名称</label>
            <div class="layui-input-block">
                <input type="text" id="title" name="data[title]" value="<?php echo $item['title'];?>" class="layui-input"   lay-verify='required' >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">区域地址</label>
            <div class="layui-input-block">
                <input type="text"  id="address" name="data[address]" value="<?php echo $item['address'];?>" class="layui-input" readonly placeholder="点击打开地图,选择后自动填写" lay-verify='required'>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">区域坐标</label>
            <div class="layui-input-block">
                <input type="text" name="data[point]" id="point" value="<?php echo $item['latitude'].','.$item['longitude'];?>"  class="layui-input" readonly placeholder="点击打开地图,选择后自动填写" lay-verify='required'>
            </div>
        </div>
        <div>
            <input type="hidden" name="data[province]" id="province" value="<?php echo $item['province']; ?>" lay-verify='required'>
            <input type="hidden"  name="data[city]" class="city" value="<?php echo $item['city']; ?>" lay-verify='required'>
            <input type="hidden" name="data[district]" id="district" value="<?php echo $item['district']; ?>" lay-verify='required'>
            <input type="hidden" name="id" value="<?php echo $item['id'];?>" lay-verify='required'>
            <?php echo admin_btn($edit_url,'save','layui-btn-fluid',"lay-filter='sub' location='close_iframe'")?>
        </div>
    </form>
<?php echo template('admin/script');?>
    <script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=<?php echo $qqmap_key; ?>"></script>
    <script>
    layui.config({
        base: base_url_js+'res/layui/module/TMap/'
    }).use('TMap');

    // 加载并使用模块
    layui.use(['layer', 'TMap'], function(){
        var layer = layui.layer;
        var $ = layui.jquery;
        var TMap = layui.TMap;
        $('.open').click(function () {
            TMap.open({
                key: "<?php echo $qqmap_key; ?>",
                dialog: {title: '番茄地图坐标拾取器'},
                onChoose: function (point, adress,address_component, myIndex) {
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
<?php echo template('admin/footers');?>

