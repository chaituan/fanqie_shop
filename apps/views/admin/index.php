<?php echo template('admin/header',['definedcss'=>[CSS_PATH.'admin/index']]); echo template('admin/sider');?>

<div class="layui-body">
	<div class="childrenBody childrenBody_show">
        <div class="row">
            <div class="sysNotice col" style="margin-bottom: 10px">
                <table class="layui-table">
                    <colgroup>
                        <col width="150"><col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>系统授权</td>
                        <td>
                            <div class="auth1 hide">
                                <span class="layui-badge layui-bg-green">正版商业授权</span>
                            </div>
                            <div id="auth2" class="hide">
                                <span class="layui-badge">抱歉！您还未获得商业授权（未授权，不可用于商业用途）</span>
                                <button type="button" class="layui-btn layui-btn-xs" id="onAuth">点击一键授权</button>
                            </div>
                        </td>
                    </tr>

                    <tr class="auth1 hide">
                        <td>系统版本</td>
                        <td>
                            <div class="layui-btn layui-btn-danger layui-btn-xs" id="version"></div> <a class="layui-btn layui-btn-xs"  href="<?php echo site_url('adminct/system/upsystem/index'); ?>">检测版本更新</a>
                        </td>
                    </tr>

                    </tbody>
                </table>

            </div>
        </div>
        <div class="layui-row layui-col-space15">
            <?php foreach ($items as $v){ ?>
                <div class="layui-col-sm6 layui-col-md2">
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
            <div class="layui-col-sm6 layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">七日订单统计</div>
                    <div class="layui-card-body p15 shortcut text-center">
                        <div id="main" style="width:100%;height:220px;"></div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">快捷菜单</div>
                    <div class="layui-card-body p15 shortcut text-center" style="height:220px;">
                        <ul class="layui-row layui-col-space10">
                            <li class="layui-col-md2 layui-col-sm4"><a href="<?php echo site_url('adminct/goods/goods/index'); ?>"> <i class="layui-icon layui-icon-cart-simple"></i>
                                    <cite>商品管理</cite></a>
                            </li>
                            <li class="layui-col-md2 layui-col-sm4"><a href="<?php echo site_url('adminct/goods/order/index'); ?>"> <i class="layui-icon layui-icon-set"></i>
                                    <cite>订单管理</cite></a>
                            </li>
                            <li class="layui-col-md2 layui-col-sm4"><a href="<?php echo site_url('adminct/shop/shop/index'); ?>"> <i class="layui-icon layui-icon-set"></i>
                                    <cite>商家管理</cite></a>
                            </li>
                            <li class="layui-col-md2 layui-col-sm4"><a href="<?php echo site_url('adminct/partner/lists/index'); ?>"> <i class="layui-icon layui-icon-set"></i>
                                    <cite>合伙人管理</cite></a>
                            </li>
                            <li class="layui-col-md2 layui-col-sm4"><a href="<?php echo site_url('adminct/setting/config/index/tab_id-5-type-0'); ?>"> <i class="layui-icon layui-icon-chart-screen"></i>
                                    <cite>配置管理</cite></a>
                            </li>
                            <li class="layui-col-md2 layui-col-sm4"><a href="<?php echo site_url('adminct/setting/tpl/index'); ?>"> <i class="layui-icon layui-icon-chart-screen"></i>
                                    <cite>首页设置</cite></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">七日会员统计</div>
                    <div class="layui-card-body p15 shortcut text-center">
                        <div id="main1" style="width:100%;height:220px;"></div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">七日商家统计</div>
                    <div class="layui-card-body p15 shortcut text-center">
                        <div id="main2" style="width:100%;height:220px;"></div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">七日合伙人统计</div>
                    <div class="layui-card-body p15 shortcut text-center">
                        <div id="main3" style="width:100%;height:220px;"></div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">会员地区分布</div>
                    <div class="layui-card-body layuiadmin-card-list">
                        <div id="main4" style="width:100%;height:220px;"></div>
                    </div>
                </div>
            </div>
        </div>

		<div class="row mt15">
			<div class="sysNotice col">
				<blockquote class="layui-elem-quote title">系统基本参数</blockquote>

				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col>
					</colgroup>
					<tbody>
                        <tr>
                            <td>使用说明</td>
                            <td class="version"><a href="http://bbs.chaituans.com/?forum-2.htm"  target="_blank">点击查看</a></td>
                        </tr>
						<tr>
							<td>PHP版本</td>
							<td class="homePage"><?php echo PHP_VERSION; ?></td>
						</tr>
                        <tr>
                            <td>MYSQL版本</td>
                            <td class="homePage"><?php echo $this->AdminUser->db->version() ; ?></td>
                        </tr>
						<tr>
							<td>服务器环境</td>
							<td class="server"><?php echo PHP_OS.';'.$_SERVER['SERVER_SOFTWARE'];?>;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<?php echo template('admin/script');?>
    <script type="text/javascript" src="<?php echo JS_PATH.'echarts.common.min.js'?>"></script>
    <script type="text/javascript">
        $(function () {
            var say="";
            check();
            function check() {
                $.post(site_url_js + '/adminct/system/upsystem/check_auth','',function (res) {
                    if(res.state == 1){
                        $('.auth1').css('display','contents');
                        $('#version').html(res.data.v);
                    }else{
                        $('#auth2').addClass('layui-show');
                    }
                },'json');
            }

            $('#onAuth').click(function () {
                $.post(site_url_js + '/adminct/system/upsystem/auth','',res=>{
                    if(res.status==1){
                        layer.open({
                            content: res.msg
                            ,btn: ['确认']
                            ,yes: function(index, layero){
                                window.location.reload();
                            }
                        });
                    }else if(res.status==3){
                        layer.open({
                            content: res.msg
                            ,btn: ['确认']
                            ,yes: function(index, layero){
                                window.open("http://www.chaituans.com",'_blank');
                            }
                        });
                    }else{
                        layer.msg(res.msg);
                    }
                },'json');
            });
        });
        $.post(site_url_js + '/adminct/record/chart/order','',res=>{
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

        $.post(site_url_js + '/adminct/record/chart/user','',res=>{
            var data = res.data;
            var myChart = echarts.init(document.getElementById('main1'));
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

        $.post(site_url_js + '/adminct/record/chart/shop','',res=>{
            var data = res.data;
            var myChart = echarts.init(document.getElementById('main2'));
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

        $.post(site_url_js + '/adminct/record/chart/partner','',res=>{
            var data = res.data;
            var myChart = echarts.init(document.getElementById('main3'));
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

        $.post(site_url_js + '/adminct/record/chart/user_l','',res=>{
            var data = res.data;
            var myChart = echarts.init(document.getElementById('main4'));
            var option = {
                tooltip: {trigger: 'axis',axisPointer: {type : 'shadow' }},
                grid: {left: '3%',right: '4%',bottom: '3%',containLabel: true},
                xAxis: [{type: 'category',data: data.legdata   }],
                yAxis: [{type:'value'}],
                series:{
                    name:'数量',
                    type:'bar',
                    barWidth: '60%',
                    data:data.seriesdata
                }
            };
            myChart.setOption(option);
        },'json');

    </script>
<?php echo template('admin/footer');?>