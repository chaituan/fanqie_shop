<?php echo template('admin/header');echo template('admin/sider');?>
    <div class="layui-body">
        <div class="childrenBody childrenBody_show">
            <div class="layui-card">
                <div class="layui-card-header">
                    数据备份
                </div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>文件名字</th>
                            <th>文件路径</th>
                            <th>备份时间</th>
                        </tr>
                        </thead>
                        <tbody>

                        <?php foreach ($items as $v){ ?>
                            <tr>
                                <td><?php echo $v['name'];?></td>
                                <td><?php echo $v['path'];?></td>
                                <td><?php echo format_time($v['time']);?></td>
                            </tr>
                        <?php }?>
                        </tbody>
                    </table>
                    <form class="layui-form layui-card-body" method="post">
                        <div class="layui-form-item text-center">
                            <?php echo admin_btn(site_url('adminct/system/back/start'),'save','layui-btn-lg',"lay-filter='sub' location='reload'",'开始备份')?>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php echo template('admin/script');?>
<?php echo template('admin/footer');?>