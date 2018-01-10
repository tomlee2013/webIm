<!DOCTYPE HTML>
<?php

require_once 'include/inc.php';

$uid = intval($_GET['uid']);

if(!$uid) die('ACCESS DENIED');

$uinfo = $db->getRow('chat_user', '*', 'id = '. $uid);

if(!$uinfo) die('No USER_INFO');

?>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Chat</title>
        <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
		<link href="/public/chat/css/perfect-scrollbar.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <script src="/public/chat/js/jquery.min.js"></script>
        <script src="/public/chat/js/jquery-ui/jquery.ui.js"></script>
		<link href="/public/chat/css/chat.css" rel="stylesheet" type="text/css">
		<a href="javascript:void(0);" id="chat_show_user" class="chat">聊天<i id="new_msg" class="new_msg" style="display:none;"></i></a>
				
		<div style="clear: both;"></div>
		<div id="web_chat_dialog" style="display: none;float:right;"></div>
		<a id="chat_login" href="javascript:void(0)" style="display: none;"></a>
					<script type="text/javascript" charset="utf-8">
					var RESOURCE_SITE_URL = '/public/chat';
					var CHAT_SITE_URL = '';
					var connect_url = "http://localhost:8090";

					var layout = "layout/home_layout.php";
					var act_op = "goods_index";
					var user = {};

                    user['u_id'] = "<?php echo $uinfo['id'];?>";
					user['u_name'] = "<?php echo $uinfo['nick_name'];?>";
					user['avatar'] = "<?php echo $uinfo['headimgurl'];?>";
					</script>

		<script type="text/javascript" src="/public/chat/js/perfect-scrollbar.min.js"></script>
        <script type="text/javascript" src="/public/chat/js/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="/public/chat/js/jquery.charCount.js" charset="utf-8"></script>
		<script type="text/javascript" src="/public/chat/js/jquery.smilies.js" charset="utf-8"></script>
		<script type="text/javascript" src="/public/chat/js/jplayer/jquery.jplayer.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="/public/chat/js/user.js" charset="utf-8"></script>
        <div id="jplayer"></div>
    </body>
</html>
