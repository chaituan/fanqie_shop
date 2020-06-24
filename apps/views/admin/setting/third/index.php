<?php echo template('admin/header');echo template('admin/sider');?>
<link rel="stylesheet" href="" />
<link rel="stylesheet" href="<?php echo CSS_PATH."admin/formSelects-v4.css";?>" type="text/css" />
<style>
    html{background-color: #f2f2f2;}
    .w-d60{widt:60px !important;}
</style>
<div class="layui-body">
    <div class="childrenBody childrenBody_show">
    <div class="layui-card">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li class="layui-this">公众号配置</li>
                <li>小程序配置</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <form class="layui-form layui-card-body" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">Appid</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[appid]" class="layui-input" lay-verify="required" value="<?php echo $item1['appid'];?>">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">Appsecret</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[appsecret]" class="layui-input" lay-verify="required" value="<?php echo $item1['appsecret'];?>">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">商户号</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[mchid]" class="layui-input" lay-verify="required" value="<?php echo $item1['mchid'];?>">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">支付密钥</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[key]" class="layui-input" lay-verify="required" value="<?php echo $item1['key'];?>">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">apiclient_cert</label>
                            <div class="layui-input-block">
                                <textarea name="data[apiclient_cert]" class="layui-textarea" lay-verify="required"><?php echo file_get_contents($item1['certpem']);?></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">apiclient_key</label>
                            <div class="layui-input-block">
                                <textarea name="data[apiclient_key]" class="layui-textarea" lay-verify="required"><?php echo file_get_contents($item1['keypem']);?></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <?php echo admin_btn(site_url('adminct/manager/wechat'),'save','layui-btn-lg',"lay-filter='sub' location='close_iframe'")?>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="layui-tab-item">
                    <form class="layui-form layui-card-body" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">Appid</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[appid]" class="layui-input" lay-verify="required" value="<?php echo $item2['appid'];?>">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">Appsecret</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[appsecret]" class="layui-input" lay-verify="required" value="<?php echo $item2['appsecret'];?>">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">商户号</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[mchid]" class="layui-input" lay-verify="required" value="<?php echo $item2['mchid'];?>">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">支付密钥</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[key]" class="layui-input" lay-verify="required" value="<?php echo $item2['key'];?>">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">apiclient_cert</label>
                            <div class="layui-input-block">
                                <textarea name="data[apiclient_cert]" class="layui-textarea" lay-verify="required"><?php echo $item2['certpem']?file_get_contents($item2['certpem']):'';?></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">apiclient_key</label>
                            <div class="layui-input-block">
                                <textarea name="data[apiclient_key]" class="layui-textarea" lay-verify="required"><?php echo $item2['keypem']?file_get_contents($item2['keypem']):'';?></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <?php echo admin_btn(site_url('adminct/manager/wxapp'),'save','layui-btn-lg',"lay-filter='sub' location='close_iframe'")?>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


<?php echo template('admin/script');?>

<script>
    $(function () {


    });
</script>
<?php echo template('admin/footer');?>

