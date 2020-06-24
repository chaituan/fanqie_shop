<?php echo template('admin/header');echo template('admin/sider');?>
    <div class="layui-body">
        <div class="childrenBody childrenBody_show layui-form ">
            <form  id="form1">
                <div class="layui-card">
                    <div class="layui-tab layui-tab-brief">
                        <ul class="layui-tab-title">
                            <?php foreach ($items as $key=>$val){?>
                                <li class="<?php if($key==0)echo 'layui-this';?>">
                                    <?php echo $val['menu_name'];?>
                                </li>
                            <?php }?>
                        </ul>

                        <div class="layui-tab-content">
                            <?php foreach ($items as $key=>$gval){  ?>
                                <div class="layui-tab-item <?php if($gval['id']==23)echo 'layui-show';?>" >
                                    <table class="layui-table">
                                        <thead>
                                        <tr>
                                            <th width="30"><button type="button" class='layui-btn layui-btn-danger layui-btn-xs sub' >删除</button></th>
                                            <th>ID</th>
                                            <th>菜单名称</th>
                                            <th>模块名</th>
                                            <th>控制器</th>
                                            <th>方法名</th>
                                            <th>是否显示</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <?php if (!isset($gval['children'])){?>
                                            <tr>
                                                <td class="empty-table-td">没有数据o(∩_∩)o </td>
                                            </tr>
                                        <?php }else{?>
                                            <?php foreach ($gval['children'] as $value){ ?>
                                                <tr >
                                                    <td><input type="checkbox" name="del[]" lay-skin="primary" value="<?php echo $value['id']?>"></td>
                                                    <td><?php echo $value['id']; ?></td>
                                                    <td><?php echo $value['menu_name']; ?></td>
                                                    <td><?php echo $value['module']; ?></td>
                                                    <td><?php echo $value['controller']; ?></td>
                                                    <td><?php echo $value['action']; ?></td>
                                                    <td><input type="checkbox" lay-skin="switch" lay-filter="open" lay-text="是|否" <?php echo $value['is_show']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$value['id'])?>"  ></td>
                                                    <td>
                                                        <div class="layui-btn-group">
                                                            <?php echo admin_btns(($add_url.'/pid-'.$value['id']),'add','layui-btn-xs fq_iframe');?>
                                                            <?php echo admin_btns(($edit_url.'/id-'.$value['id']),'edit','layui-btn-xs fq_iframe');?>
                                                            <?php echo admin_btn(($dr_url.'/del/id-'.$value['id']),'del','layui-btn-xs f_del');?>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <?php if(isset($value['children'])){foreach ($value['children'] as $v){?>
                                                    <tr >
                                                        <td><input type="checkbox" name="del[]" lay-skin="primary" value="<?php echo $v['id']?>"></td>
                                                        <td><?php echo $v['id']; ?></td>
                                                        <td style="padding-left: 30px;"><?php echo $v['menu_name']; ?></td>
                                                        <td><?php echo $v['module']; ?></td>
                                                        <td><?php echo $v['controller']; ?></td>
                                                        <td><?php echo $v['action']; ?></td>
                                                        <td><input type="checkbox" lay-text="是|否" lay-skin="switch" lay-filter="open" <?php echo $v['is_show']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$v['id'])?>"></td>
                                                        <td>
                                                            <div class="layui-btn-group">
                                                                <?php echo admin_btns(($add_url.'/pid-'.$v['id']),'add','layui-btn-xs fq_iframe');?>
                                                                <?php echo admin_btns(($edit_url.'/id-'.$v['id']),'edit','layui-btn-xs fq_iframe');?>
                                                                <?php echo admin_btn(($dr_url.'/del/id-'.$v['id']),'del','layui-btn-xs f_del');?>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <?php if(isset($v['children'])){foreach ($v['children'] as $vs){?>
                                                        <tr >
                                                            <td><input type="checkbox" name="del[]" lay-skin="primary" value="<?php echo $vs['id']?>"></td>
                                                            <td><?php echo $vs['id']; ?></td>
                                                            <td style="padding-left: 60px;"><?php echo $vs['menu_name']; ?></td>
                                                            <td><?php echo $vs['module']; ?></td>
                                                            <td><?php echo $vs['controller']; ?></td>
                                                            <td><?php echo $vs['action']; ?></td>
                                                            <td><input type="checkbox" lay-text="是|否" lay-skin="switch" lay-filter="open" <?php echo $vs['is_show']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$vs['id'])?>" ></td>
                                                            <td>
                                                                <div class="layui-btn-group">
                                                                    <?php echo admin_btns(($add_url.'/pid-'.$vs['id']),'add','layui-btn-xs fq_iframe');?>
                                                                    <?php echo admin_btns(($edit_url.'/id-'.$vs['id']),'edit','layui-btn-xs fq_iframe');?>
                                                                    <?php echo admin_btn(($dr_url.'/del/id-'.$vs['id']),'del','layui-btn-xs f_del');?>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <?php if(isset($vs['children'])){foreach ($vs['children'] as $vss){?>
                                                            <tr >
                                                                <td><input type="checkbox" name="del[]" lay-skin="primary" value="<?php echo $vss['id']?>"></td>
                                                                <td><?php echo $vss['id']; ?></td>
                                                                <td style="padding-left: 90px;"><?php echo $vss['menu_name']; ?></td>
                                                                <td><?php echo $vss['module']; ?></td>
                                                                <td><?php echo $vss['controller']; ?></td>
                                                                <td><?php echo $vss['action']; ?></td>
                                                                <td><input type="checkbox" lay-text="是|否" lay-filter="open" lay-skin="switch" <?php echo $vss['is_show']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$vss['id'])?>" ></td>
                                                                <td>
                                                                    <div class="layui-btn-group">
                                                                        <?php echo admin_btns(($edit_url.'/id-'.$vss['id']),'edit','layui-btn-xs fq_iframe');?>
                                                                        <?php echo admin_btn(($dr_url.'/del/id-'.$vss['id']),'del','layui-btn-xs f_del');?>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <?php }}?>
                                                    <?php }}?>
                                                <?php }}}}?>

                                        </tbody>
                                    </table>
                                </div>
                            <?php }?>
                        </div>

                    </div>
                </div>
                <!-- form END -->

                <div class="layui-card">
                    <div class="layui-card-header">
                        顶部菜单列表
                    </div>
                    <div class="layui-card-body">
                        <div class="layui-row">
                            <div class="layui-col-xs12">
                                <div class="layui-inline">
                                    <?php echo admin_btns($add_url,'add','layui-btn-normal fq_iframe','','添加');?>
                                </div>
                            </div>
                        </div>
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>菜单名称</th>
                                <th>模块名</th>
                                <th>控制器</th>
                                <th>方法名</th>
                                <th>排序</th>
                                <th>是否显示</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($items as $vall){ ?>
                                <tr>
                                    <td><?php echo $vall['id']; ?></td>
                                    <td><?php echo $vall['menu_name']; ?></td>
                                    <td><?php echo $vall['module']; ?></td>
                                    <td><?php echo $vall['controller']; ?></td>
                                    <td><?php echo $vall['action']; ?></td>
                                    <td><?php echo $vall['sort']; ?></td>
                                    <td><input type="checkbox" lay-skin="switch" lay-filter="open" lay-text="是|否" <?php echo $vall['is_show']?'checked':'';?>  data-url="<?php echo ($dr_url.'/lock/id-'.$vall['id'])?>"  ></td>
                                    <td>
                                        <div class="layui-btn-group">
                                            <?php echo admin_btns(($add_url.'/pid-'.$vall['id']),'add','layui-btn-xs fq_iframe');?>
                                            <?php echo admin_btns(($edit_url.'/id-'.$vall['id']),'edit','layui-btn-xs fq_iframe');?>
                                            <?php echo admin_btn(($dr_url.'/del/id-'.$vall['id']),'del','layui-btn-xs f_del');?>
                                        </div>
                                    </td>
                                </tr>
                            <?php }?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
<?php echo template('admin/script');?>
    <script type="text/javascript">
        $(function () {
            $('.sub').click(function () {
                var url = '<?php echo ($dr_url.'/dels')?>';
                $.post(url,$('#form1').serialize(),function (res) {
                    if(res.state==1){
                        location.reload();
                    }
                    layer.msg(res.message);
                },'json');
            });
        });

    </script>
<?php echo template('admin/footer');?>