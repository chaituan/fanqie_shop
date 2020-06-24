<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单打印</title>
</head>
<style>
    table
    {
        border-collapse:collapse;
    }
    td,th{
        font-family:"宋体";
        font-size:12px;
        height: 30px;
        padding: 0 0 0 20px;
    }
    th{
        font-size:18px;
        font-weight:normal;
    }
    .td1{ width:50px;}


    .td2{ width:200px;}
    .td3{ width:100px;}
    .td4{ width:140px;}
    .td5{ width:130px;}
    .td6{ width:160px;}

    .num{ font-family:"Calibri";}
    .a{
        padding:0 0 0 0;
        text-align: center
    }
</style>
<body>

<table width="792px" border="1" cellpadding="0" >
    <tbody>
    <tr>
        <th colspan="6"><?php echo $shopname; ?>--配送服务单</th>
    </tr>
    <tr class="b">
        <td colspan="3">订单编号：<?php echo $item['order_id'];?></td>
        <td colspan="2">交易单号：<?php echo $item['transaction_id'];?></td>
        <td colspan="1">付款方式：微信支付</td>
    </tr>
    <tr class="b">
        <td colspan="3">收货地址：<?php echo $item['user_address'];?></td>
        <td colspan="2">买家：<?php echo $item['nickname'];?></td>
        <td colspan="1">收货人：<?php echo $item['real_name'];?></td>
    </tr>
    <tr class="b">
        <td colspan="3">订单备注：</td>
        <td colspan="2">联系电话：<?php echo $item['user_phone'];?></td>
        <td colspan="1"></td>
    </tr>
    <tr class="a">
        <td class="td1">序号</td>
        <td class="td2">商品名称</td>
        <td class="td3">数量</td>
        <td class="td4">规格</td>
        <td class="td5">单价</td>
        <td class="td6">总价</td>
    </tr>
    <?php foreach ($child as $k=>$v) { ?>
    <tr class="a">
        <td class="num"><?php echo $k; ?></td>
        <td><?php echo $v['title'];?></td>
        <td><?php echo $v['num'];?></td>
        <td><?php echo $v['sku'];?></td>
        <td><?php echo $v['prices'];?></td>
        <td><?php echo $v['prices'];?></td>
    </tr>
    <?php } ?>
    <tr class="a">
        <td class="num" colspan="2">合计</td>
        <td bgcolor="yellow"><?php echo $item['total_num'];?></td>
        <td></td>
        <td></td>
        <td bgcolor="yellow"><?php echo $item['total_price'];?></td>
    </tr>
    <tr>
        <td colspan="2">配货人签字：</td>
        <td colspan="2">送货人签字：</td>
        <td colspan="2">收货人签字：</td>
    </tr>
    <tr>
    </tr>
    </tbody>
</table>
<table width="792px" border="1" cellpadding="0" rules="rows">
    <tbody><tr><td>第一联仓库存根</td>
        <td>第二联收货人存根</td>
        <td>第三联财务存根</td>
        <td>第四联物流存根</td>
    </tr></tbody></table>
</body>
</html>