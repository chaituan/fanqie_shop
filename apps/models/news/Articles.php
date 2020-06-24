<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 文章
 * @author chaituan@126.com
 */
class Articles extends MY_Model {

    function __construct() {
        parent::__construct ();
        $this->table_name = 'article';
    }
}