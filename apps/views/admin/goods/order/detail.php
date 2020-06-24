<?php echo template('admin/headers');?>
<style>
    html{background-color: #f2f2f2;}
    .w-d60{widt:60px !important;}
</style>
<div class="childrenBody childrenBody_show">
    <div class="layui-card">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li class="layui-this">订单详情</li>
                <li >发货操作</li>
                <li >退款操作</li>
                <li >修改订单</li>
            </ul>
            <div class="layui-tab-content">

                <div class="layui-tab-item layui-show">
                    <table class="layui-table">
                        <colgroup><col width="150"><col><col width="150"><col></colgroup>
                        <tbody>
                        <tr>
                            <td>收货人</td><td ><?php echo $item['a_name'];?></td>
                            <td>联系电话</td><td ><?php echo $item['a_mobile'];?></td>
                        </tr>
                        <tr>
                            <td>收货地址</td>
                            <td colspan="3"><?php echo $item['a_address'];?></td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="layui-table">
                        <colgroup><col width="150"><col><col width="150"><col></colgroup>
                        <tbody>
                        <tr>
                            <td>订单编号</td><td ><?php echo $item['order_no'];?></td>
                            <td>订单状态</td><td ><?php echo $item['status_say'];?></td>
                        </tr>
                        <tr>
                            <td>商品总数</td><td ><?php echo $item['num'];?></td>
                            <td>商品总价</td><td ><?php echo $item['total'];?></td>
                        </tr>
                        <tr>
                            <td>支付邮费</td><td ><?php echo $item['num'];?></td>
                            <td>优惠券</td><td >1</td>
                        </tr>
                        <tr>
                            <td>实际支付</td><td ><?php echo $item['pay_price'];?></td>
                            <td>微信订单号</td><td ><?php echo $item['transaction_id'];?></td>
                        </tr>
                        <tr>
                            <td>支付方式</td><td ><?php echo $item['pay_type_say'];?></td>
                            <td>订单类型</td><td ><?php echo $item['type'];?></td>
                        </tr>
                        <tr>
                            <td>创建时间</td><td ><?php echo format_time($item['add_time']);?></td>
                            <td>支付时间</td><td ><?php echo $item['pay_time']?format_time($item['pay_time']):'无';?></td>
                        </tr>
                        <tr>
                            <td>用户备注</td><td colspan="3"><?php echo $item['mark'];?></td>
                        </tr>
                        <tr>
                            <td>商家备注</td><td colspan="3"><?php echo $item['remark'];?></td>
                        </tr>
                        </tbody>
                    </table>

                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>商品名称</th>
                            <th>商品数量</th>
                            <th>商品价格</th>
                            <th>商品规格</th>
                        </tr>
                        </thead>
                        <tbody>

                        <?php foreach ($items as $v){ ?>
                            <tr>
                                <td><?php echo $v['title'];?></td>
                                <td><?php echo $v['num'];?></td>
                                <td><?php echo $v['price'];?></td>
                                <td><?php echo $v['sku_path'];?></td>
                            </tr>
                        <?php }?>
                        </tbody>
                    </table>

                </div>

                <div class="layui-tab-item ">
                    <blockquote class="layui-elem-quote layui-quote-nm">
                        <?php  if($item['status']==2){?>
                            <span style="color: #FF5722">
                                用户已付款，请尽快备货
                            </span>
                        <?php }else{ ?>
                            发货操作
                        <?php } ?>
                    </blockquote>
                    <form class="layui-form layui-card-body" method="post">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="hidden" name="id" value="<?php echo $item['id']?>">
                                <?php echo admin_btn(site_url('adminct/goods/order/send'),'save','layui-btn-lg',"lay-filter='sub' location='close_iframe'",'备货完成')?>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="layui-tab-item">
                    <blockquote class="layui-elem-quote layui-quote-nm">
                        <?php  if($item['status']==5){?>
                            <span style="color: #FF5722">
                                <?php if($item['refund_status']==1){
                                    echo '用户申请退款，请处理';
                                }elseif($item['refund_status']==2){
                                    echo '退款成功';
                                }else{
                                    echo '拒绝退款--'.$item['refund_reason'];
                                } ?>
                            </span>
                        <?php }else{ ?>
                            用户未申请退款，无需操作
                        <?php } ?>
                    </blockquote>
                    <table class="layui-table">
                        <colgroup><col width="150"><col><col width="150"><col></colgroup>
                        <tbody>
                        <tr>
                            <td>退款说明</td><td ><?php echo $item['refund_say'];?></td>
                            <td>退款图片</td>
                            <td >
                                <?php if($item['refund_thumb']){$arrImg = explode(',',$item['refund_thumb']); foreach ($arrImg as $v){?>
                                <a href="<?php echo $v; ?>" target="_blank"><img src="<?php echo $v;?>" class="wd10"></a>
                                <?php }} ?>
                            </td>
                        </tr>
                        <tr>
                            <td>退款金额</td><td ><?php echo $item['refund_money'];?></td>
                            <td>退款原因</td><td ><?php echo $item['refund_mark'];?></td>
                        </tr>
                        <tr>
                            <td>不退款说明</td><td><?php echo $item['refund_no_say'];?></td>
                            <td>申请退款时间</td><td ><?php echo format_time($item['refund_time']);?></td>
                        </tr>
                        </tbody>
                    </table>
                    <?php  if($item['status']==5&&$item['refund_status']==1){?>
                    <form class="layui-form layui-card-body" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">退款金额</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[refund_money]" class="layui-input" value="<?php echo $item['pay_price']?>"  lay-verify="required" >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">是否退款</label>
                            <div class="layui-input-block">
                                <input type="radio" name="data[refund_status]" value="2" checked title="退款">
                                <input type="radio" name="data[refund_status]" value="0" title="不退款">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">退款说明</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[refund_say]" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="hidden" name="id" value="<?php echo $item['id']?>">
                                <input type="hidden" name="pay_type" value="<?php echo $item['pay_type']?>">
                                <input type="hidden" name="wx_oid" value="<?php echo $item['transaction_id']?>">
                                <input type="hidden" name="data[uid]" value="<?php echo $item['uid']?>">
                                <?php echo admin_btn(site_url('adminct/goods/order/back'),'save','layui-btn-lg',"lay-filter='sub' location='close_iframe'")?>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-mid layui-word-aux">
                                1.退款后，款项会根据支付方式原路返回。比如微信支付则返回到用户零钱，余额支付则返回到用户余额中<br>
                                2.选择不退款后，需要填写不退款说明
                            </div>
                        </div>
                    </form>
                    <?php } ?>
                </div>

                <div class="layui-tab-item">
                    <form class="layui-form layui-card-body" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">支付金额</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[pay_price]" class="layui-input" value="<?php echo $item['pay_price']?>"  lay-verify="required" >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">商家备注</label>
                            <div class="layui-input-block">
                                <input type="text" name="data[remark]" class="layui-input" value="<?php echo $item['remark']?>"  lay-verify="required" >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="hidden" name="id" value="<?php echo $item['id']?>">
                                <?php echo admin_btn($edit_url,'save','layui-btn-lg',"lay-filter='sub' location='close_iframe'")?>
                            </div>
                        </div>
                    </form>
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
<?php echo template('admin/footers');?>

