<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 订单管理
 * @author chaituan@126.com
 */
class Orders_lists extends MY_Model {

    function __construct() {
        parent::__construct ();
        $this->table_name = 'goods_order_lists';
    }

}