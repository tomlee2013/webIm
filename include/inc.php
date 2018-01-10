<?php
session_start();
setcookie(session_name(), session_id(), time() + 1 * 24 * 3600, "/");

error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE);
define('DS', DIRECTORY_SEPARATOR);
define('ROOT_PATH', str_replace('include/inc.php', '', str_replace('\\', '/', __FILE__)));

//公共文件目录配置
define('PUBLIC','/public/');
require ROOT_PATH.'/data/config_db.php';

require ROOT_PATH.'/libs/func/global.func.php';
require ROOT_PATH.'/libs/func/custom.func.php';
require ROOT_PATH.'/libs/func/dir.func.php';
require ROOT_PATH.'/libs/func/iconv.func.php';

//Smarty模板引擎初始化
require ROOT_PATH.'/libs/class/smarty/Smarty.class.php';
$smarty = new Smarty;
$smarty->compile_check = true;
$smarty->left_delimiter = '<{';
$smarty->right_delimiter = '}>';
//$smarty->debugging = true;

//数据库实例
require ROOT_PATH.'/libs/class/M.class.php';
require ROOT_PATH.'/libs/class/MysqliDb.class.php';
$db = new M();

require ROOT_PATH.'/libs/class/requests.class.php';

//商户号//1485965982
//define('WX_APP_ID', '');  //微信接口appid
//define('WX_APP_SECRET', ''); //微信公众号 appSecret
//define('WX_TOKEN', '');  //微信公众号Token令牌 
//require ROOT_PATH.'/libs/class/wechat.class.php';
require ROOT_PATH.'/libs/class/mutiCurl.class.php';
require ROOT_PATH.'/libs/class/wechatWeb.class.php';


if(!get_magic_quotes_gpc()){
	$_POST = new_addslashes($_POST);
	$_GET = new_addslashes($_GET);
}
foreach($_POST as $k=>$v){
	$_POST[$k] = remove_xss(safe_replace($v));
}
foreach($_GET as $k=>$v){
	$_GET[$k] = remove_xss(safe_replace($v));
}

?>
