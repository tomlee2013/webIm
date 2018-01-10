<?php

require_once 'include/inc.php';

$uid = intval($_GET['uid']);

if(!$uid) die('ACCESS DENIED');

$uinfo = $db->getRow('chat_user', '*', 'id = '. $uid);

if(!$uinfo) die('No USER_INFO');

?>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>聊天</title>
    <link rel="stylesheet" href="/public/mchat/css/sm.min.css" />
    <link rel="stylesheet" href="/public/mchat/css/sm-extend.css" />

    <link rel="stylesheet" href="/public/mchat/css/chat.css" />
</head>
<body>

<div class="page-group">

<div class="page">
<header class="bar bar-nav">
		<a href="javascript:history.go(-1);" class="icon icon-left pull-left"></a>
		<h1 class="title">聊天</h1>
		<a href="javascript:window.location.reload();" class="icon icon-refresh pull-right"></a>
</header>

<div id="chat" class="content  pull-to-refresh-content" data-ptr-distance="55">
    <div class="pull-to-refresh-layer"> 
         <div class="preloader"></div> 
         <div class="pull-to-refresh-arrow"></div> 
    </div>
    <div class="buttons-tab" style="z-index:11;">
        <a id="tab-1" href="#tab1" class="tab-link button">最近联系</a>
        <a id="tab-2" href="#tab2" class="tab-link active  button">我的好友</a>
        <a id="tab-3" href="#tab3" class="tab-link button">黑名单</a>
    </div>
    <div class="content-block">
   
    <div class="tabs">
      <div id="tab1" class="tab">
        <div class="content-block">
          <div id="chat_recent_list"></div>
        </div>
      </div>
      <div id="tab2" class="tab active">
        <div class="content-block" >
            <div id="chat_friend_list"></div>
        </div>
      </div>
      <div id="tab3" class="tab">
        <div class="content-block">
            <div id="chat_black_list"></div>
        </div>
      </div>
    </div>
    </div>
</div>
</div>

<div id="chatDialog" style="display:none;" class="popup">
<header class="bar bar-nav">
		<h1 class="title chat-card-header"><img class="chat-avatar" src="" width="33"><span class="chat-name"></span></h1>
		<a href="javascript:closeChatDialog();" class="icon icon-friends pull-right"></a>
</header> 
<div id="chatContent" class="content" data-ptr-distance="55" >
    
    <div id="chat-list"> </div>
    <div class="blank"></div>
</div>
<nav class="bar bar-tab">
	    <div class="content-padded">
			<div class="searchbar row" style="background: none;">
				<div class="col-75">
					<input id="send_message" placeholder='输入你想说的话' />
                </div>
                <a id="chat_show_smilies" style="line-height: 10px; margin-left: 1%;" href="javascript:void(0);" class="chat_smiles icon icon-emoji col-5"></a>
				<a style="top:0;text-decoration:none;margin-left: 6.5%;" class="button button-fill button-primary col-20" href="javascript:;" onclick="send_msg();">发送</a>
			</div>
		</div>
</nav>
</div>

</div>

<div id="jplayer"></div>

<script type="text/javascript">
	var RESOURCE_SITE_URL = 'public/mchat';
    var CHAT_SITE_URL = '';
	var connect_url = "http://127.0.0.1:8090";
	var user = {};
    user['u_id'] = "<?php echo $uinfo['id'];?>";
	user['u_name'] = "<?php echo $uinfo['nick_name'];?>";
	user['avatar'] = "<?php echo $uinfo['headimgurl'];?>";
</script>
<script type="text/javascript" src="/public/mchat/js/jquery.min.js"></script>
<script type="text/javascript" src="/public/mchat/js/jquery.smilies.js" charset="utf-8"></script>
<script type="text/javascript" src="/public/mchat/js/jplayer/jquery.jplayer.min.js" ></script>

<script type='text/javascript' src='/public/mchat/js/zepto.js' charset='utf-8'></script>
<script type='text/javascript' src='/public/mchat/js/sm.min.js' charset='utf-8'></script>

<script type="text/javascript" src="/public/mchat/js/chat.js?<?php echo time();?>" ></script>
</body>
</html>
