<?php defined('BASEPATH') or exit ('No direct script access allowed');
/**
 * 统计
 * @author chaituan@126.com
 */
class Chart extends AdminCommon{

    function order()  {
        $this->load->model(array('goods/Orders'=>'do'));
        $field = "add_time,sum(total) total_price";
        $orderlist = $this->do->getItems("DATEDIFF(now() , FROM_UNIXTIME(add_time,'%Y-%m-%d')) <= 7",$field,'add_time asc','','','','','add_time');
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

    function user()  {
        $this->load->model(array('user/Users'=>'do'));
        $field = "add_time,count(id) num";
        $orderlist = $this->do->getItems("DATEDIFF(now() , FROM_UNIXTIME(add_time,'%Y-%m-%d')) <= 7",$field,'add_time asc','','','','','add_time');
        $legend = ['会员数量'];
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
            $seriesdata[0]['data'][]= $item['num'];
        }
        $data['xdata'] = ($xdata);
        $data['seriesdata'] = ($seriesdata);
        AjaxResult_page($data);
    }

    function shop()  {
        $this->load->model(array('shop/Shops'=>'do'));
        $field = "add_time,count(id) num";
        $orderlist = $this->do->getItems("DATEDIFF(now() , FROM_UNIXTIME(add_time,'%Y-%m-%d')) <= 7",$field,'add_time asc','','','','','add_time');
        $legend = ['商家数量'];
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
            $seriesdata[0]['data'][]= $item['num'];
        }
        $data['xdata'] = ($xdata);
        $data['seriesdata'] = ($seriesdata);
        AjaxResult_page($data);
    }

    function partner()  {
        $this->load->model(array('partner/Partners'=>'do'));
        $field = "add_time,count(id) num";
        $orderlist = $this->do->getItems("DATEDIFF(now() , FROM_UNIXTIME(add_time,'%Y-%m-%d')) <= 7",$field,'add_time asc','','','','','add_time');
        $legend = ['合伙人数量'];
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
            $seriesdata[0]['data'][]= $item['num'];
        }
        $data['xdata'] = ($xdata);
        $data['seriesdata'] = ($seriesdata);
        AjaxResult_page($data);
    }

    function user_l(){
        $this->load->model(array('user/Users'=>'do'));
        $field = 'count(province) as count,province';
        $items = $this->do->getItems('',$field,'count desc','','','','','province');
        foreach ($items as $value){
            $value['province']=='' && $value['province']='未知省份';
            $legdata[] = $value['province'];
            $dataList[] = $value['count'];
        }
        $data['legdata'] = ($legdata);
        $data['seriesdata'] = ($dataList);
        AjaxResult_page($data);
    }
}
