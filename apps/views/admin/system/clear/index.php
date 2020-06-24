<?php echo template('admin/header');echo template('admin/sider');?>
    <div class="layui-body">
        <div class="childrenBody childrenBody_show">
            <div class="layui-card">
                <div class="layui-card-header">
                    清理缓存
                </div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <td>执行该操作后，所有的系统缓存都会被清理，请慎重操作</td>
                        </tr>
                        </tbody>
                    </table>
                    <form class="layui-form layui-card-body" method="post">
                        <div class="layui-form-item text-center">
                            <?php echo admin_btn(site_url('adminct/system/clear/start'),'save','layui-btn-lg',"lay-filter='sub' location='reload'",'开始清理')?>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php echo template('admin/script');?>
<?php echo template('admin/footer');?>