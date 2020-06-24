<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
define ( 'SYSTEM_NAME', '番茄管理系统' );
define ( 'COMPANY', '襄阳市番茄网络科技有限公司' );
define ('HTTP_HOST', 'http://' . $_SERVER['HTTP_HOST']);
define('CSS_PATH',HTTP_HOST.'/res/css/');
define('JS_PATH',HTTP_HOST.'/res/js/');
define('LAYUI',HTTP_HOST.'/res/layui/');
define('IMG_PATH',HTTP_HOST.'/res/images/');
define('UPLOAD_URL',HTTP_HOST.'/res/upload/');
define('PLUGIN',HTTP_HOST.'/res/plugin/');
define ( 'PAGESIZE', 20 ); // 分页
define ( 'PAGESIZES', 10 ); // 分页
define ( 'USERFQ_SESSION', "fanqie_session_user" ); // 用户session
define ('DS', DIRECTORY_SEPARATOR);
//上传文件目录
define ('UPLOAD_PATH', 'res/upload');
/*
 * |--------------------------------------------------------------------------|DisplayDebugbacktrace|--------------------------------------------------------------------------||IfsettoTRUE,abacktracewillbedisplayedalongwithphperrors.If|error_reportingisdisabled,thebacktracewillnotdisplay,regardless|ofthissetting|
 */
defined ( 'SHOW_DEBUG_BACKTRACE' ) or define ( 'SHOW_DEBUG_BACKTRACE', TRUE );
define ( 'SSLCERT_PATH', APPPATH . 'libraries/wechat/cert/apiclient_cert.pem' );
define ( 'SSLKEY_PATH', APPPATH . 'libraries/wechat/cert/apiclient_key.pem' );
define ( 'NOTIFY_URL', HTTP_HOST . '/index.php/fanqie/notify/pay' );
define ( 'NOTIFY_URL_CZ', HTTP_HOST . '/index.php/fanqie/notify/cz' );
define ( 'NOTIFY_URL_OUT', HTTP_HOST . '/index.php/fanqie/notify/out' );
define ( 'NOTIFY_URL_POINTS', HTTP_HOST . '/index.php/fanqie/notify/points' );
// =======【curl代理设置】===================================
/**
 * *TODO：这里设置代理机器，只有需要代理的时候才设置，不需要代理，请设置为0.0.0.0和0
 * *本例程通过curl使用HTTPPOST方法，此处可修改代理服务器，
 * *默认CURL_PROXY_HOST=0.0.0.0和CURL_PROXY_PORT=0，此时不开启代理（如有需要才设置）
 * 
 * @var unknown_type
 *
 */
define ( 'CURL_PROXY_HOST', "0.0.0.0" );
define ( 'CURL_PROXY_PORT', 0 );

// =======【上报信息配置】===================================
/**
 * *TODO：接口调用上报等级，默认紧错误上报（注意：上报超时间为【1s】，上报无论成败【永不抛出异常】，
 * *不会影响接口调用流程），开启上报之后，方便微信监控请求调用的质量，建议至少
 * *开启错误上报。
 * *上报等级，0.关闭上报;1.仅错误出错上报;2.全量上报
 * 
 * @var int
 *
 */
define ( 'REPORT_LEVENL', 1 );

/*
 * |-------------------------------------------------------------------------- | File and Directory Modes |-------------------------------------------------------------------------- | | These prefs are used when checking and setting modes when working | with the file system. The defaults are fine on servers with proper | security, but you may wish (or even need) to change the values in | certain environments (Apache running a separate process for each | user, PHP under CGI with Apache suEXEC, etc.). Octal values should | always be used to set the mode correctly. |
 */
defined ( 'FILE_READ_MODE' ) or define ( 'FILE_READ_MODE', 0644 );
defined ( 'FILE_WRITE_MODE' ) or define ( 'FILE_WRITE_MODE', 0666 );
defined ( 'DIR_READ_MODE' ) or define ( 'DIR_READ_MODE', 0755 );
defined ( 'DIR_WRITE_MODE' ) or define ( 'DIR_WRITE_MODE', 0755 );

/*
 * |-------------------------------------------------------------------------- | File Stream Modes |-------------------------------------------------------------------------- | | These modes are used when working with fopen()/popen() |
 */
defined ( 'FOPEN_READ' ) or define ( 'FOPEN_READ', 'rb' );
defined ( 'FOPEN_READ_WRITE' ) or define ( 'FOPEN_READ_WRITE', 'r+b' );
defined ( 'FOPEN_WRITE_CREATE_DESTRUCTIVE' ) or define ( 'FOPEN_WRITE_CREATE_DESTRUCTIVE', 'wb' ); // truncates existing file data, use with care
defined ( 'FOPEN_READ_WRITE_CREATE_DESTRUCTIVE' ) or define ( 'FOPEN_READ_WRITE_CREATE_DESTRUCTIVE', 'w+b' ); // truncates existing file data, use with care
defined ( 'FOPEN_WRITE_CREATE' ) or define ( 'FOPEN_WRITE_CREATE', 'ab' );
defined ( 'FOPEN_READ_WRITE_CREATE' ) or define ( 'FOPEN_READ_WRITE_CREATE', 'a+b' );
defined ( 'FOPEN_WRITE_CREATE_STRICT' ) or define ( 'FOPEN_WRITE_CREATE_STRICT', 'xb' );
defined ( 'FOPEN_READ_WRITE_CREATE_STRICT' ) or define ( 'FOPEN_READ_WRITE_CREATE_STRICT', 'x+b' );
define ( 'PREV_URL', isset ( $_SERVER ["HTTP_REFERER"] ) ? $_SERVER ["HTTP_REFERER"] : '' );
/*
 * |-------------------------------------------------------------------------- | Exit Status Codes |-------------------------------------------------------------------------- | | Used to indicate the conditions under which the script is exit()ing. | While there is no universal standard for error codes, there are some | broad conventions. Three such conventions are mentioned below, for | those who wish to make use of them. The CodeIgniter defaults were | chosen for the least overlap with these conventions, while still | leaving room for others to be defined in future versions and user | applications. | | The three main conventions used for determining exit status codes | are as follows: | | Standard C/C++ Library (stdlibc): | http://www.gnu.org/software/libc/manual/html_node/Exit-Status.html | (This link also contains other GNU-specific conventions) | BSD sysexits.h: | http://www.gsp.com/cgi-bin/man.cgi?section=3&topic=sysexits | Bash scripting: | http://tldp.org/LDP/abs/html/exitcodes.html |
 */
defined ( 'EXIT_SUCCESS' ) or define ( 'EXIT_SUCCESS', 0 ); // no errors
defined ( 'EXIT_ERROR' ) or define ( 'EXIT_ERROR', 1 ); // generic error
defined ( 'EXIT_CONFIG' ) or define ( 'EXIT_CONFIG', 3 ); // configuration error
defined ( 'EXIT_UNKNOWN_FILE' ) or define ( 'EXIT_UNKNOWN_FILE', 4 ); // file not found
defined ( 'EXIT_UNKNOWN_CLASS' ) or define ( 'EXIT_UNKNOWN_CLASS', 5 ); // unknown class
defined ( 'EXIT_UNKNOWN_METHOD' ) or define ( 'EXIT_UNKNOWN_METHOD', 6 ); // unknown class member
defined ( 'EXIT_USER_INPUT' ) or define ( 'EXIT_USER_INPUT', 7 ); // invalid user input
defined ( 'EXIT_DATABASE' ) or define ( 'EXIT_DATABASE', 8 ); // database error
defined ( 'EXIT__AUTO_MIN' ) or define ( 'EXIT__AUTO_MIN', 9 ); // lowest automatically-assigned error code
defined ( 'EXIT__AUTO_MAX' ) or define ( 'EXIT__AUTO_MAX', 125 ); // highest automatically-assigned error code
