<?php echo template('admin/header');echo template('admin/sider');?>
    <div class="layui-body">
        <div class="childrenBody childrenBody_show">
            <div class="layui-card">
                <div class="layui-card-header">
                    系统升级
                </div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <tbody>

                        <?php if($status==1){ ?>
                        <tr>
                            <td>当前版本：<?php echo $version;?>
                                <?php if($status==1){ ?><span class="layui-badge ml15">最新版本<?php echo $cur_version;?></span></td> <?php } ?>
                        </tr>
                        <tr>
                            <td>
                                <form class="layui-form" action="">
                                    <div class="layui-form-item">
                                        <input type="checkbox" id="sic" name="switch" lay-skin="switch" lay-text="同意协议|拒绝协议">
                                    </div>
                                </form>
                                <div class="layui-badge layui-bg-orange">我已经做好了相关文件及数据库的备份工作，并自愿承担更新所存在的风险！</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <?php echo $content;?>
                            </td>
                        </tr>
                        <?php } ?>
                        </tbody>
                    </table>

                    <?php if($status==1){ ?>
                    <div class="layui-progress layui-progress-big mt60" lay-showPercent="true" lay-filter="demo">
                        <div class="layui-progress-bar demo" lay-percent="0%"></div>
                    </div>
                    <form class="layui-form layui-card-body" method="post">
                        <div class="layui-form-item text-center">
                            <button class='layui-btn layui-btn-lg start' type="button"   id="sub"><i class='fa fa-fw fa-save'></i> 开始升级</button>
                        </div>
                    </form>
                    <?php }else{ ?>
                    <div class="text-center layui-badge"><?php echo $msg;?></div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
<?php echo template('admin/script');?>
<script>

    $(function () {
        var count = <?php echo isset($count)?$count:0;?>;
        $('.start').click(function () {
            if(!$('#sic').prop('checked')){
                layer.msg('您没有同意该协议，无法为您升级系统！');
                return ;
            }
            $('#sub').attr("disabled",true);
            $('#sub').addClass('layui-btn-disabled');
            up();
        });

        function up() {
            $.post('/adminct/system/upsystem/start','',function (res) {
                if(res.state == 1){
                    var bfb = parseInt((res.data/count) * 100);
                    layui.element.progress('demo', bfb+'%')
                    setTimeout(up,1000);
                }else if(res.state==4){
                    layer.open({
                        content: res.msg
                        ,btn: ['确认']
                        ,yes: function(index, layero){
                            layer.close(index)
                        }
                    });
                }else {
                    layer.open({
                        content: res.message
                        ,btn: ['确认']
                        ,yes: function(index, layero){
                            window.location.reload();
                        }
                    });
                }
            },'json');
        }
    });

</script>
<?php echo template('admin/footer');?>