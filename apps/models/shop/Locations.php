<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 区域管理
 * @author chaituan@126.com
 */
class Locations extends MY_Model {

    function __construct() {
        parent::__construct ();
        $this->table_name = 'shop_location';
    }



    function dw($get){
        $this->load->model(['admin/AdminConfig']);
        $scope = $this->AdminConfig->getValue('scope');
        $juli = floatval(bcdiv($scope,100,2));//1=111公里
        $longitude = $get['longitude'];
        $latitude = $get['latitude'];
        $order = "ACOS(SIN(($latitude * 3.1415) / 180 ) *SIN((latitude * 3.1415) / 180 ) + COS(($latitude * 3.1415) / 180 ) * COS((latitude * 3.1415) / 180 ) *COS(($longitude* 3.1415) / 180 - (longitude * 3.1415) / 180 ) ) * 6380 asc";
        $where = "latitude > ($latitude-$juli) and latitude < ($latitude+$juli) and longitude > ($longitude-$juli) and longitude < ($longitude+$juli) and status=1";
        $result = $this->getItem($where,"id,title,longitude,latitude,default",$order);
        $system = '';
        if(!$result){
            $result = $this->getItem(['default'=>1],"id,title,longitude,latitude,default");
            $system = '系统默认定位';
        }
        $result['system'] = $system;
        $this->session->set_userdata('location_id',$result['id']);
        $result['metre'] = get_metre($longitude,$latitude,$result['longitude'],$result['latitude']).'km';
        return $result;
    }

    //定位列表用于下拉列表
    function dw_lists($get){
        $this->load->model(['admin/AdminConfig']);
        $scope = $this->AdminConfig->getValue('scope');
        $juli = floatval(bcdiv($scope,100,2));//1=111公里
        $longitude = $get['longitude'];
        $latitude = $get['latitude'];
        $order = "ACOS(SIN(($latitude * 3.1415) / 180 ) *SIN((latitude * 3.1415) / 180 ) + COS(($latitude * 3.1415) / 180 ) * COS((latitude * 3.1415) / 180 ) *COS(($longitude* 3.1415) / 180 - (longitude * 3.1415) / 180 ) ) * 6380 asc";
        $where = "latitude > ($latitude-$juli) and latitude < ($latitude+$juli) and longitude > ($longitude-$juli) and longitude < ($longitude+$juli) and status=1 ";
        $result = $this->getItems($where,"id,title,longitude,latitude,default",$order);
        foreach ($result as &$item) {
            $item['metre'] = get_metre($longitude,$latitude,$item['longitude'],$item['latitude']).'km';
        }
        return $result;
    }


    function search($data){
        $where['status'] = 1;
        $key = $data['key'];
        $where['title like']= "%$key%";
        $result = $this->getItems($where,"id,title,longitude,latitude,default");
        foreach ($result  as &$item){
            $metre = get_metre($data['longitude'],$data['latitude'],$item['longitude'],$item['latitude']);
            $item['metre'] = $metre.'km';
            $item['sort'] = $metre;
            $item['system'] = '';
        }
        array_multisort(array_column($result,'sort'),SORT_ASC,$result);
        return $result;
    }

}