<?php echo template('shop/header');echo template('shop/sider');?>

    <div class="layui-body">
        <div class="childrenBody childrenBody_show">
            <div class="layui-card">
                <div class="layui-tab layui-tab-brief">
                    <ul class="layui-tab-title">
                        <li class="<?php echo $gid==1?'layui-this':''; ?>"><a href="<?php echo ($dr_url.'/index/gid-1'); ?>">出售中的产品</a></li>
                        <li class="<?php echo $gid==2?'layui-this':''; ?>"><a href="<?php echo ($dr_url.'/index/gid-2'); ?>">待上架产品</a></li>
                    </ul>
                </div>
                <div class="layui-card-header  pt15 pb15">
                    <form class="layui-form">
                        <div class="layui-input-inline">
                            <select name="cate_id" id="cate_id">
                                <option value="0">产品分类</option>
                                <?php foreach ($group as $v){ ?>
                                    <option value="<?php echo $v['id'] ?>"><?php echo $v['fh'].$v['title'] ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text"  id="srk" name="srk" placeholder="请输入产品名称" class="layui-input" >
                        </div>
                        <?php echo admin_btn('', 'find',"",'lay-filter="order-find"')?>
                    </form>
                </div>
                <div class="layui-card-body">
                    <table  id="user" lay-filter="common"  ></table>
                </div>
            </div>
        </div>
    </div>
    <?php echo template('shop/script');?>
    <script type="text/html" id="add">
        <?php echo admin_btns($add_url,'add','layui-btn-normal fq_iframe');?>
    </script>
    <script type="text/html" id="operation">
        <?php if($gid!=6) echo admin_btns(site_url('shop/reply/index/'.'/pid-{{d.id}}-type-1'),'','layui-btn-xs  layui-btn-primary fq_iframe','','评');?>
        <?php if($gid!=6) echo admin_btns(($edit_url.'/id-{{d.id}}'),'edit','layui-btn-xs fq_iframe');?>
        <?php if($gid!=6) echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"');?>
    </script>
    <script type="text/html" id="sth">
        <input type="checkbox" lay-text='上架|下架' lay-skin="switch" lay-filter='open' {{# if(d.status==1){ }} checked {{#  } }}   data-url="<?php echo ($dr_url.'/lock/id-{{d.id}}')?>" >
    </script>
    <script type="text/html" id="images">
        <div class="img_view"><img src="{{d.thumb}}"></div>
    </script>

    <script>
        //执行渲染
        layui.table.render({
            elem: '#user', //指定原始表格元素选择器（推荐id选择器）
            id:'common',//给事件用的
            height: 'full-250', //容器高度
            url:'<?php echo ("$dr_url/lists/gid-$gid")?>',toolbar: '#add',
            cols: [[
                {field: 'id', title: 'ID', width: 80},
                {field: 'title', title: '名称',edit:'text'},
                {field: 'thumb', title: '图片',toolbar: '#images',width: 150},
                {field: 'price', title: '价格',edit:'text',width: 90},
                {field: 'stock', title: '库存',width: 90},
                {field: 'yj_money', title: '购返',edit:'text',width: 90},
                {field: 'p_1', title: '一返',edit:'text',width: 90},
                {field: 'p_2', title: '二返',edit:'text',width: 90},
                {field: 'sort', title: '排序',edit:'text',width: 90},
                {field: 'is_show', title: '上架',toolbar: '#sth',width: 100},
                {field: 'right', title: '操作',toolbar: '#operation',width: 150}
            ]],
            limit: 20,
            page:true,
            response:{msgName:'message'},
            done:function(res, curr, count){
                this.where.total = count;
                layer.photos({photos:'.img_view'});//添加预览
            }
        });

        layui.table.on('edit(common)', function(obj){
            var data = {id:obj.data.id},key = "data["+obj.field+"]";
            data[key] = obj.value;
            $.post('<?php echo ("$dr_url/edits")?>',data,function(d){layer.msg(d.message)},'json');
        });

        layui.form.on('submit(order-find)',function(){
            layui.table.reload('common',{//这里的find 是为了后台数据处理
                where:{cate_id:$('#cate_id').val(),srk:$('#srk').val(),find:'find',total:''},
                done:function(res, curr, count){
                    this.where.total = count;
                    this.where.find = '';
                }
            });
            return false;
        });
    </script>
<?php echo template('shop/footer');?>