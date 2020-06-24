<?php echo template('shop/header',['definedcss'=>[CSS_PATH.'admin/index']]); echo template('shop/sider');?>


    <div class="layui-body">
        <div class="childrenBody childrenBody_show">
            <div class="layui-row layui-col-space15">
                <?php foreach ($items as $v){ ?>
                    <div class="layui-col-sm6 layui-col-md4">
                        <div class="layui-card">
                            <div class="layui-card-header"><?php echo $v['name']?><span class="layui-badge layui-bg-blue layuiadmin-badge"><?php echo $v['field']?></span></div>
                            <div class="layui-card-body layuiadmin-card-list">
                                <p class="layuiadmin-big-font"><?php echo $v['count']?></p>
                                <p>
                                    <?php echo $v['content']?>
                                    <span class="layuiadmin-span-color"><i class="<?php echo $v['class'] ?>"></i></span>
                                </p>
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <div class="layui-col-sm12 layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">七日订单统计</div>
                        <div class="layui-card-body p15 shortcut text-center">
                            <div id="main" style="width:100%;height:400px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php echo template('shop/script');?>
    <script type="text/javascript" src="<?php echo JS_PATH.'echarts.common.min.js'?>"></script>
    <script type="text/javascript">
        $.post(site_url_js + '/shop/chart/order','',res=>{
            var data = res.data;
            var myChart = echarts.init(document.getElementById('main'));
            var option = {
                tooltip: {trigger: 'axis',axisPointer: {lineStyle: {color: '#57617B'}}},
                grid: {left: '0%',right: '4%',bottom: '3%',containLabel: true},
                xAxis: [{type: 'category',data: data.xdata  }],
                yAxis: [{type:'value'}],
                legend:data.legend,
                series:data.seriesdata
            };
            myChart.setOption(option);
        },'json');

    </script>
<?php echo template('shop/footer');?>