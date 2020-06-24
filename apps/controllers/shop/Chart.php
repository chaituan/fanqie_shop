<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 统计
 * @author chaituan@126.com
 */
class Chart extends ShopCommon{

    function order()  {
        $shop_id = $this->loginUser['id'];
        $this->load->model(array('goods/Orders'=>'do'));
        $field = "add_time,sum(total) total_price";
        $orderlist = $this->do->getItems("DATEDIFF(now() , FROM_UNIXTIME(add_time,'%Y-%m-%d')) <= 7 and shop_id=$shop_id",$field,'add_time asc','','','','','add_time');
        $legend = ['订单金额'];
        $data['legend'] = (['data'=>$legend]);
        $seriesdata=[
            [
                'name'=>$legend[0],
                'type'=>'line',
                'data'=>[],
            ]
        ];
        $xdata=[];
        foreach ($orderlist as $item){
            $xdata[] = format_time($item['add_time'],'Y-m-d');
            $seriesdata[0]['data'][]= $item['total_price'];
        }
        $data['xdata'] = ($xdata);
        $data['seriesdata'] = ($seriesdata);
        AjaxResult_page($data);
    }

}
