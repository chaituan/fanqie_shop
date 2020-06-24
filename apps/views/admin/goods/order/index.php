<?php echo template('admin/header');echo template('admin/sider');?>

    <div class="layui-body">
        <div class="childrenBody childrenBody_show">
            <div class="layui-card">
                <div class="layui-card-header  pt15 pb15">
                    <form class="layui-form" id="order" method="get">
                        <div class="layui-input-inline">
                            <select  id="status" name="status">
                                <option value="0">订单状态</option>
                                <option value="1">待付款</option>
                                <option value="2">待配货</option>
                                <option value="3">配送中</option>
                                <option value="4">待评价</option>
                                <option value="6">交易结束</option>
                                <option value="5">退款中</option>
                                <option value="7">已退款</option>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text"  id="time" name="time" placeholder="时间范围" class="layui-input time" >
                        </div>
                        <div class="layui-input-inline">
                            <input type="text"  id="srk" name="srk" placeholder="请输入订单号" class="layui-input" >
                        </div>
                        <?php echo admin_btn('', 'find',"",'lay-filter="order-find"')?>
                        <?php echo admin_btn(("$dr_url/export?"),'btn','layui-btn-normal',"id='exp'",'导出');?>
                    </form>
                </div>
                <div class="layui-card-body">
                    <table  id="user" lay-filter="common"  ></table>
                </div>
            </div>
        </div>
    </div>
<?php echo template('admin/script');?>
    <script type="text/html" id="operation">
        <?php  echo admin_btns(($edit_url.'/id-{{d.id}}'),'edit','layui-btn-xs fq_iframe','','详');?>
        <?php  echo admin_btn(($dr_url.'/del/id-{{d.id}}'),'del','layui-btn-xs f_del_d','lay-event="del"');?>
    </script>
    <script type="text/html" id="print">
        <a href="{{site_url_js}}/adminct/goods/order/prints/id-{{d.id}}" target="_blank" style="color: #01AAED;">打印</a>
    </script>
    <script type="text/html" id="p_status">
        {{# if(d.paid==1){ }}
        <span class="layui-badge layui-bg-green">已支付</span>
        {{#  }else{ }}
        <span class="layui-badge layui-bg-gray">未支付</span>
        {{# } }}
    </script>
    <script type="text/html" id="order_status">
        {{# if(d.status==1){ }}
        <span class="layui-badge layui-bg-orange">待付款</span>
        {{#  }else if(d.status==2){ }}
        <span class="layui-badge layui-bg-green">等待拣货</span>
        {{#  }else if(d.status==3){ }}
        <span class="layui-badge layui-bg-cyan">派送中</span>
        {{#  }else if(d.status==33){ }}
        <span class="layui-badge layui-bg-cyan">上门取货</span>
        {{#  }else if(d.status==4){ }}
        <span class="layui-badge layui-bg-blue">待评价</span>
        {{#  }else if(d.status==6){ }}
        <span class="layui-badge layui-bg-black">交易结束</span>
        {{#  }else if(d.status==5&&d.refund_status==1){ }}
        <span class="layui-badge">申请退款</span>
        {{#  }else if(d.status==5&&d.refund_status==2){ }}
        <span class="layui-badge layui-bg-gray">退款成功</span>
        {{# } }}
    </script>
    <script>
        //执行渲染
        layui.table.render({
            elem: '#user', //指定原始表格元素选择器（推荐id选择器）
            id:'common',//给事件用的
            height: 'full-250', //容器高度
            url:'<?php echo ("$dr_url/lists")?>',toolbar: 'true',
            cols: [[
                {field: 'id', title: 'ID', width: 80},
                {field: 'order_no', title: '订单号'},
                {field: 'a_name', title: '下单人',width: 150},
                {field: 'pay_price', title: '实际支付',width: 90},
                {field: 'status', title: '订单状态',toolbar: '#order_status',width: 150},
                {field: 'add_time', title: '下单时间',width: 200,toolbar:'<div>{{Time(d.add_time, "%y-%M-%d %h:%m:%s")}}</div>'},
                {field: 'print', title: '打印',width: 90,toolbar: '#print'},
                {field: 'right', title: '操作',toolbar: '#operation',width: 90}
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

        layui.form.on('submit(order-find)',function(){
            layui.table.reload('common',{//这里的find 是为了后台数据处理
                where:{status:$('#status').val(),type:$('#type').val(),time:$('#time').val(),srk:$('#srk').val(),find:'find',total:''},
                done:function(res, curr, count){
                    this.where.total = count;
                    this.where.find = '';
                }
            });
            return false;
        });
        $('.time').each(function () {
            layui.laydate.render({
                elem: this,
                type: 'datetime',
                range: '到'
            });
        });
        $('#exp').click(function(){
            var url = $(this).attr('url');
            location.href = url + $('#order').serialize();

        });
    </script>
<?php echo template('admin/footer');?>