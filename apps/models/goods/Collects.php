<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 收藏管理
 * @author chaituan@126.com
 */
class Collects extends MY_Model {

    function __construct() {
        parent::__construct();
        $this->table_name = 'goods_collect';
    }

}