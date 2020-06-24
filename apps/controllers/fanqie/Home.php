<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 首页
 * @author chaituan@126.com
 */
class Home extends XcxCommon {

    function index_get(){
        if(is_ajax_request()){
            $get = Gets();
            $lid = $get['location_id'];
            if(!$lid)AjaxResult_error('无法获取当前区域信息');
            $this->load->model(['goods/Goodss','shop/Shops','admin/Tpls'=>'tpldo','news/Articles','news/Articles_group']);
            $join = array('table'=>'goods as b','cond'=>'a.id=b.shop_id','type'=>'','ytable'=>'shop as a');
            $tpl = $this->tpldo->getItem('','page_data');
            $tpl = $tpl?(json_decode($tpl['page_data'],true)):'';
            $arr = [1=>1,5=>4,6=>2,7=>2,8=>3];
            foreach ($tpl['items'] as &$item) {
                if(isset($item['style']['type'])){
                    if(array_key_exists($item['style']['type'],$arr)){
                        $item['style']['num'] = $arr[$item['style']['type']];
                    }
                }
                if(isset($item['data'])){
                    $item['data'] = array_values($item['data']);
                }
            }
            $news_group = $this->Articles_group->getItems(['status'=>1,'parent_id'=>2],'id,gname');
            $this->Articles->db->where_in('group_id',array_column($news_group,'id'));
            $news = $this->Articles->getItems(['status'=>1],'id,group_id,title','sort asc','','','','','group_id');
            $tempArr = array_column($news_group, null, 'id');
            foreach ($news as &$v){
                if($tempArr[$v['group_id']]){
                    $v['gname'] = $tempArr[$v['group_id']]['gname'];
                }
            }
            $data['news'] = $news;
            $data['tpl'] = $tpl;
            $data['newItems'] = $this->Shops->getItems_join($join,['a.location_id'=>$lid,'a.status'=>1,'b.status'=>1],'b.id,b.thumb,b.title,b.price,b.ot_price,b.info,b.stock,b.sales','b.top_time desc',1,10);
            foreach ($data['newItems'] as &$v) {
                $v['bfb'] = bcdiv($v['sales'],(bcadd($v['stock'],$v['sales'])),2) * 100;
            }
            $data['hotItems'] = $this->Shops->getItems_join($join,['a.location_id'=>$lid,'a.status'=>1,'b.status'=>1],'b.id,b.thumb,b.title,b.price','b.sales desc',1,3);
            $data['burstItems'] = $this->Shops->getItems_join($join,['a.location_id'=>$lid,'a.status'=>1,'b.status'=>1,'b.burst'=>1],'b.id,b.thumb,b.title,b.price,b.info','b.top_time desc',1,10);
            AjaxResult_page($data,'',true);
        }
    }

    function newsgoods_get(){
        if(is_ajax_request()){
            $get = Gets();
            $pages = $get['pages'];
            $lid = $get['location_id'];
            $this->load->model(['goods/Goodss','shop/Shops']);
            $join = array('table'=>'goods as b','cond'=>'a.id=b.shop_id','type'=>'','ytable'=>'shop as a');
            $data = $this->Shops->getItems_join($join,['a.location_id'=>$lid,'a.status'=>1,'b.status'=>1],'b.id,b.thumb,b.title,b.price,b.ot_price,b.info,b.stock,b.sales','b.top_time desc',$pages,10);
            foreach ($data as &$v) {
                $v['bfb'] = bcdiv($v['sales'],(bcadd($v['stock'],$v['sales'])),2) * 100;
            }
            AjaxResult_page($data?$data:'','',true);
        }
    }

    function shop_get(){
        if(is_ajax_request()){
            $get = Gets();
            $pages = $get['pages'];
            $this->load->model(['shop/Shops']);
            $data = $this->Shops->dw_index($get,$pages);
            AjaxResult_page($data?$data:'','',true);
        }
    }

}