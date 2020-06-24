<?php if (! defined ( 'BASEPATH' ))	exit ( 'No direct script access allowed' );
/**
 * 文章分类
 * @author chaituan@126.com
 */
class Articles_group extends MY_Model {

    function __construct() {
        parent::__construct ();
        $this->table_name = 'article_group';
    }

    function get_cat($html = true) {
        $items = $this->getItems ( '', '', 'id desc' );
        $this->load->library ( 'Tree' );
        if (! $items)return '';
        if ($html) {
            $data = $this->tree->makeTreeForHtml ( $items );
        } else {
            $data = $this->tree->makeTree ( $items );
        }
        return $data;
    }
}