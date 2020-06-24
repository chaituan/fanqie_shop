<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );

$config ['base_url'] = HTTP_HOST;

$config ['index_page'] = 'index.php';

$config ['uri_protocol'] = 'REQUEST_URI';

$config ['url_suffix'] = '';

$config ['language'] = 'english';

$config ['charset'] = 'UTF-8';

$config ['enable_hooks'] = FALSE;

$config ['subclass_prefix'] = 'MY_';

$config ['composer_autoload'] = FCPATH . 'vendor/autoload.php';

$config ['permitted_uri_chars'] = 'a-z 0-9~%.:_\-';

$config ['enable_query_strings'] = FALSE;
$config ['controller_trigger'] = 'c';
$config ['function_trigger'] = 'm';
$config ['directory_trigger'] = 'd';

$config ['allow_get_array'] = TRUE;

$config ['log_threshold'] = 1;

$config ['log_path'] = '';

$config ['log_file_extension'] = '';

$config ['log_file_permissions'] = 0644;

$config ['log_date_format'] = 'Y-m-d H:i:s';

$config ['error_views_path'] = '';

$config ['cache_path'] = '';

$config ['cache_query_string'] = FALSE;

$config ['encryption_key'] = '';

$config ['sess_driver'] = 'files';
$config ['sess_cookie_name'] = 'ctshop_session';
$config ['sess_expiration'] = 2592000;
$config ['sess_save_path'] = APPPATH . 'cache/session';
$config ['sess_match_ip'] = FALSE;
$config ['sess_time_to_update'] = 0;
$config ['sess_regenerate_destroy'] = true;

$config ['cookie_prefix'] = '';
$config ['cookie_domain'] = '';
$config ['cookie_path'] = '/';
$config ['cookie_secure'] = FALSE;
$config ['cookie_httponly'] = FALSE;

$config ['standardize_newlines'] = FALSE;

$config ['global_xss_filtering'] = FALSE;

$config ['csrf_protection'] = FALSE;
$config ['csrf_token_name'] = 'csrf_test_name';
$config ['csrf_cookie_name'] = 'csrf_cookie_name';
$config ['csrf_expire'] = 7200;
$config ['csrf_regenerate'] = TRUE;
$config ['csrf_exclude_uris'] = array ();

$config ['compress_output'] = FALSE;//启用Gzip压缩达到最快的页面加载速度

$config ['time_reference'] = 'local';

$config ['rewrite_short_tags'] = FALSE;

$config ['proxy_ips'] = '';
