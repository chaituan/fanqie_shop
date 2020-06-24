<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 * 小程序API
 * @author chaituan@126.com
 */
use EasyWeChat\Foundation\Application;
class Api extends XcxCommon {

    function wx_config_get(){
        if(is_ajax_request()){
            $url = Gets('url');
            $config = get_Cache('wechatConfig');
            $configs = [
                'app_id'=>$config['appid'],
                'secret'=>$config['appsecret'],
            ];
            $app = new Application($configs);
            $app->js->setUrl($url);
            $data['config'] = $app->js->getConfigArray(['updateAppMessageShareData','updateTimelineShareData','getLocation','openLocation']);
            $this->load->model(['admin/AdminConfig']);
            $set = $this->AdminConfig->getAllConfig(20);
            $data['share'] = ['share_thumb'=>$set['share_thumb'],'share_title'=>$set['share_title'],'share_desc'=>$set['share_desc']];
            $data['web_name'] = $this->AdminConfig->getValue('web_name');
            AjaxResult_page($data);
        }
    }

    function share_get(){
        if(is_ajax_request()){
            $this->load->model(['admin/AdminConfig']);
            $set = $this->AdminConfig->getAllConfig(20);
            $data['share'] = ['share_thumb'=>$set['share_thumb'],'share_title'=>$set['share_title'],'share_desc'=>$set['share_desc']];
            $data['web_name'] = $this->AdminConfig->getValue('web_name');
            $data['shop_is_open'] = $this->AdminConfig->getValue('shop_is_open');
            AjaxResult_page($data);
        }
    }

    function mapkey_get(){
        $this->load->model(['admin/AdminConfig']);
        $mapkey = $this->AdminConfig->getValue('qqmap_key');
        AjaxResult_page($mapkey,'',true);
    }

    function home(){
        if(is_ajax_request()){
            $this->load->model(array('store/Products'=>'do','ad/Ads'=>'addo','xcx/Navs'=>'navdo','admin/Tpls'=>'tpldo'));
            $adwhere = "gid in (1,3)";
            $ad = $this->addo->getItems($adwhere,'','sort');
            foreach ($ad as $v){
                if($v['gid']==1){
                    $items['lb'][] = $v;
                }else{
                    $items['yx'][] = $v;
                }
            }
            $tpl = $this->tpldo->getItem('','page_data');
            $items['tpl'] = $tpl?json_decode($tpl['page_data'],true):'';
            $items['navs'] = $this->navdo->getItems(['type'=>1],'','sort');
            $items['bestItems'] = $this->do->getItems(array('is_best'=>1,'is_show'=>1,'is_del'=>0),'id,image,store_name,cate_id,price,ot_price,IFNULL(sales,0) + IFNULL(ficti,0) as sales,unit_name','sort DESC, id DESC',1,10);
            $items['newsItems'] = $this->do->getItems(array('is_new'=>1,'is_show'=>1,'is_del'=>0),'id,image,store_name,cate_id,price,unit_name,sort','sort DESC, id DESC',1,10);
            $items['beneItems'] = $this->do->getItems(array('is_benefit'=>1,'is_show'=>1,'is_del'=>0),'id,image,store_name,cate_id,price,ot_price,stock,unit_name,sort','sort DESC, id DESC',1,10);
            $items['hotItems'] = $this->do->getItems(array('is_hot'=>1,'is_show'=>1,'is_del'=>0),'id,image,store_name,cate_id,price,unit_name,sort','sort DESC,id DESC',1,3);
            AjaxResult_page($items);
        }
    }

    function get_appui(){
        if(is_ajax_request()){
            $item = get_Cache('appuiConfig');
            AjaxResult_page($item,'',true);
        }
    }


    function fanpai_ad(){
        if(is_ajax_request()){
            $this->load->model(array('ad/Ads'=>'addo'));
            $adwhere['gid'] = 6;
            $ad = $this->addo->getItems($adwhere,'','sort');
            AjaxResult_page($ad,'',true);
        }
    }


    function issue_upimg_post(){
        $path = "/res/upload/images/{yyyy}{mm}{dd}/{time}{rand:6}";
        $config = array ("pathFormat" => $path,"maxSize" => 2000, "allowFiles" => array(".gif",".png",".jpg",".jpeg"));
        $this->load->library('Uploader', array ('fileField' =>'pics','config' => $config));
        $info = $this->uploader->getFileInfo();
        if($info['state']=='SUCCESS'){
            AjaxResult(1, '',base_url($info['url']));
        }else{
            AjaxResult_error($info['state']);
        }
    }

    function get_news(){
        if(is_ajax_request()){
            $this->load->model(['news/Articles'=>'do']);
            $items = $this->do->getItems(['cid'=>3],'id,title,img,synopsis,author,visit');
            foreach ($items as &$item) {
                if(!$item['img'])$item['img'] = base_url('res/images/news.jpg');
            }
            AjaxResult_page($items,'',true);
        }
    }

    function get_news_detail(){
        if(is_ajax_request()){
            $id = Posts('id');
            $this->load->model(['news/Articles'=>'do']);
            $item = $this->do->getItem(['id'=>$id]);
            $item['add_time'] = format_time($item['add_time'],'Y-m-d H:i');
            $this->do->edit(['visit'=>'+=1'],['id'=>$id]);
            AjaxResult_page($item,'',true);
        }
    }

    function get_share(){
        if(is_ajax_request()){
            $this->load->model(['admin/AdminConfig'=>'do']);
            $config = $this->do->getAllConfig(7);
            AjaxResult_page($config,'',true);
        }
    }

    function tie() {
        if(is_ajax_request()){
            $data = Posts();
            $lid = $data['lid'];
            $this->load->model(array('tie/Ties'=>'do'));
            $where = '';$order = "addtime desc";
            if(isset($data['state'])){//tab 选项搜索
                $cid = '';
                if(isset($data['cid'])){
                    $cid = "cid=".$data['cid'];
                }

                if($data['state']==0){//最新
                    $where = $cid?$cid." and lid=$lid":"lid=$lid";
                }else if($data['state']==1){//推荐
                    $where = "state=1" . ($cid?" and $cid and lid=$lid":" and lid=$lid");
                    $order = "addtime desc";
                }else if($data['state']==2){//附近
                    $scope = calcScope($data['la'], $data['lg'], 500000);
                    $where = "( latitude between {$scope['minLat']} and {$scope['maxLat']} ) and ( longitude between {$scope['minLng']} and {$scope['maxLng']} ) " . ($cid?" and $cid and lid=$lid":" and lid=$lid");
                }else if($data['state']==3){//3热帖
                    $where = $cid?$cid." and lid=$lid":"lid=$lid";
                    $order = "hits desc";
                }
            }
            if(isset($data['search'])){//搜索
                $v = $data['v'];
                $where = "content like '%$v%' and lid=$lid";
                $order = "id desc";
            }
            if(!$where){
                $where = "lid=$lid";
            }
            $page = isset($data['page'])?$data['page']:0;$limit = PAGESIZES;$total = isset($data['total'])?$data['total']:0;
            $items = $this->do->getItems($where,'',$order,$page,$limit,$total,true);
            $pagemenu = $this->do->pagemenu;
            $newss = [];
            if($items){
                foreach ($items as $v){
                    $v['thumb'] = $v['thumb']?explode(',', $v['thumb']):'';
                    $v['addtime'] = time_ago($v['addtime']);
                    $v['zan'] = $v['zan']?json_decode($v['zan'],true):array();
                    $v['comment'] = $v['comment']?json_decode($v['comment'],true):array();
                    $v['content'] = str_cut($v['content'], 30);
                    $news[] = $v;
                }
                foreach ($news as $v){
                    if(is_array($v['thumb'])){
                        $thumb = array();
                        foreach ($v['thumb'] as $vs){
                            $thumb[] = base_url($vs);
                        }
                    }else{
                        $thumb = '';
                    }
                    $v['thumb'] = $thumb;
                    $newss[] = $v;
                }
                if(isset($data['state'])&&$data['state']==2){//附近人排序
                    foreach ($newss as $v){
                        $locaArr = calcDistance($data['la'], $data['lg'], $v['latitude'], $v['longitude']);
                        $v['sort'] = $locaArr;
                        $news_s[] = $v;
                        $sort[] = $locaArr;
                    }
                    array_multisort($sort,SORT_ASC,$news_s);
                    $newss = $news_s;
                }
            }
            AjaxResult_page($newss,$pagemenu,true);
        }
    }

    function tie_home(){
        if(is_ajax_request()){
            $this->load->model(array('ad/Ads'=>'addo','tie/Cats'=>'cat'));
            $datas['ad'] = $this->addo->getItems(['gid'=>7],'','sort');
            $datas['nav'] = $this->cat->getItems('','','sort');
            $this->load->model(array('admin/AdminConfig'));
            $datas['share'] = $this->AdminConfig->getAllConfig(20,['share_title','share_img']);
            AjaxResult_page($datas,'',true);
        }
    }

    function tie_cat(){
        if(is_ajax_request()){
            $uid = $this->User['id'];
            $this->load->model (array('tie/Cats'=>'do'));
            $items = $this->do->getItems('','','sort');
            AjaxResult_page($items);
        }
    }

    function tie_detail(){
        if(is_ajax_request()){
            $id = Posts('id');
            $this->load->model(array('tie/Ties'=>'do'));
            $item = $this->do->getItem(array('id'=>$id));
            if($item['thumb']){
                $thumb = explode(',', $item['thumb']);
                foreach ($thumb as $v){
                    $news[] = base_url($v);
                }
                $item['thumb'] = $news;
            }
            $item['addtime'] = time_ago($item['addtime']);
            $this->do->edit(array('hits'=>'+=2'),array('id'=>$id));
            AjaxResult_page($item);
        }
    }

    function comment_lists(){
        if(is_ajax_request()){
            $data = Posts();
            $this->load->model(array('tie/Comments'=>'do'));
            $items = $this->do->getItems(array('tid'=>$data['tid']),'','id desc');
            foreach ($items as &$v){
                $v['addtime'] = time_ago($v['addtime']);
                $news[] = $v;
            }
            AjaxResult_page($items,'',true);
        }
    }

    function zan_lists(){
        if(is_ajax_request()){
            $data = Posts();
            $this->load->model(array('tie/Zans'=>'do'));
            $items = $this->do->getItems(array('tid'=>$data['tid'],'status'=>1),'','id desc');
            foreach ($items as &$v){
                $v['addtime'] = time_ago($v['addtime']);
                $news[] = $v;
            }
            AjaxResult_page($items,'',true);
        }
    }

    function get_location(){
        if(is_ajax_request()){
            $post = Posts();
            $this->load->model(['admin/AdminConfig']);
            $map_key = $this->AdminConfig->getValue('map_key');
            $user = $this->session->wechat_user_x;
            $la = $post['la'];
            $lg = $post['lg'];
            if(!$map_key)AjaxResult_error('请在后台配置腾讯地图key');
            $ipget = file_get_contents("https://apis.map.qq.com/ws/geocoder/v1/?location=$la,$lg&key={$map_key}");
            $result = json_decode($ipget,true);
            $district = $lid='';
            if($result['status']==0){
                $district = $result['result']['address_component']['district'];
                $lid = $result['result']['ad_info']['adcode'];
            }else{
                AjaxResult_error('定位接口出错，请检查您的腾讯地图管理中心');
            }
            $data = ['district'=>$district,'lid'=>$lid];
            AjaxResult_page($data);
        }
    }

    function test(){
        $this->load->model('user/Groups','do');
        exit;
        $arr = $this->do->getLeveAndNext(2);
        var_dump($arr);
        exit;
    }
}