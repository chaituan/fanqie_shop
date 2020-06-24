<?php echo template('admin/header');echo template('admin/sider');?>

    <div class="layui-body">
        <div class="childrenBody childrenBody_show">
            <div class="layui-card">
                <div class="layui-tab layui-tab-brief">
                    <ul class="layui-tab-title">
                        <li class="<?php echo $type==1?'layui-this':''; ?>"><a href="<?php echo ($dr_url.'/index/t-1'); ?>">微信公众号</a></li>
                        <li class="<?php echo $type==2?'layui-this':''; ?>"><a href="<?php echo ($dr_url.'/index/t-2'); ?>">微信小程序</a></li>
                        <li class="<?php echo $type==3?'layui-this':''; ?>"><a href="<?php echo ($dr_url.'/index/t-3'); ?>">抖音小程序</a></li>
                        <li class="<?php echo $type==4?'layui-this':''; ?>"><a href="<?php echo ($dr_url.'/index/t-4'); ?>">支付宝小程序</a></li>
                        <li class="<?php echo $type==5?'layui-this':''; ?>"><a href="<?php echo ($dr_url.'/index/t-5'); ?>">腾讯小程序</a></li>
                    </ul>
                </div>
                <div class="layui-card-body">
                    <table  id="user" lay-filter="common"  ></table>
                </div>
            </div>
        </div>
    </div>
    <?php echo template('admin/script');?>
    <script type="text/html" id="sths">
        <input type="checkbox" lay-text='开启|关闭' lay-skin="switch" lay-filter='open' {{# if(d.status==1){ }} checked {{#  } }}   data-url="<?php echo ($dr_url.'/lock/id-{{d.id}}')?>" >
    </script>
    <script>
        var t = <?php echo $type; ?>;
        $(function () {
            $('#get').click(function () {
                $.post(site_url_js+'/adminct/setting/template/add',{t:t},res=>{
                    layer.msg(res.message);
                    if(res.state==1){
                        setTimeout(function () {
                                window.location.reload();
                        },1500)
                    }
                },'json');
            });
        });
        //执行渲染
        layui.table.render({
            elem: '#user', //指定原始表格元素选择器（推荐id选择器）
            id:'common',//给事件用的
            height: 'full-250', //容器高度
            url:'<?php echo ("$dr_url/lists/t-$type")?>',
            cols: [[
                {field: 'id', title: 'ID', width: 80},
                {field: 'name', title: '名称',edit:'text',width: 150},
                {field: 'tmpid', title: '模版ID',edit:'text'},
                {field: 'mark', title: '备注',edit:'text',width: 250},
                {field: 'status', title: '状态',toolbar: '#sths',width: 100},
            ]],
            limit: 20,
            page:true,
            response:{msgName:'message'},
            done:function(res, curr, count){
                this.where.total = count;
            }
        });

        layui.table.on('edit(common)', function(obj){
            var data = {id:obj.data.id},key = "data["+obj.field+"]";
            data[key] = obj.value;
            $.post('<?php echo ("$dr_url/edits")?>',data,function(d){layer.msg(d.message)},'json');
        });
    </script>
<?php echo template('admin/footer');?>