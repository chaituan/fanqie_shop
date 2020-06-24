<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 首页
 * @author chaituan@126.com
 */
class Location extends XcxCommon {

    function index_get(){
       if (is_ajax_request()){
           $get = Gets();
           $this->load->model('shop/Locations');
           $location = $this->Locations->dw($get);
           AjaxResult_page($location,'',true);
       }
    }

    function search_get(){
        if(is_ajax_request()){
            $get = Gets();
            $this->load->model('shop/Locations');
            $result = $this->Locations->search($get);
            AjaxResult_page($result,'',true);
        }
    }

    function shop_apply_get(){
        if(is_ajax_request()){
            $get = Gets();
            $this->load->model('shop/Locations');
            $location = $this->Locations->dw_lists($get);
            $news = [];
            if($location){
                foreach ($location as $item) {
                    $news[] = ['id'=>$item['id'],'name'=>$item['title'].'('.$item['metre'].')'];
                }
            }
            AjaxResult_page($news,'',false,['error'=>'抱歉！该地区未开通，请联系客服']);
        }
    }

}