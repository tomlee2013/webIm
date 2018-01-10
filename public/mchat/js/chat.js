var interval = 1;//断开后计时
var new_interval = 1;//消息提醒计时
var connect = 0;//连接状态
var new_msg = 0;//新消息数
var obj = {};
var msg_dialog = '';
var socket = {};
var chat_log = {};
var connect_list = {};
var connect_n = 0;

var web_info = new Array();//页面信息
var friend_list = new Array();//我的好友
var recent_list = new Array();//最近联系人
var black_list = new Array();//黑名单
var user_list = new Array();//所有会员信息
var msg_list = new Array();//收到消息
var goods_list = new Array();//所有商品信息
var left_list = new Array();//左侧的会员
var right_list = new Array();//右侧的会员
var dialog_show = 0;//对话框是否打开
var chat_uid = 0; //当前聊天会员ID
var msg_max = 20;//消息数
var time_max = 10;//定时(分钟)刷新防止登录超时退出,为0时关闭
var chatlist_min_time = 0;


    $(function(){
        if(user['u_id'] != '') {
		    web_info['html_title'] = $(document).attr('title');
			var ajaxurl = CHAT_SITE_URL+'/index.php?c=web_chat&a=get_user_list&n=99&f_id='+user['u_id'];
            var friend_card = '';
            var recent_card = '';
            var black_card = '';
            $$.showIndicator();
			$.ajax({
				type: "GET",
				url: ajaxurl,
				dataType:"json",
				async: true,
			    success: function(u_list){
                    //console.log(u_list);
                    $$.hideIndicator();
				  	for (var u_id in u_list){

				  		var user_info = u_list[u_id];
				  	    set_user_info(u_id,"u_name",user_info['u_name']);
					  	set_user_info(u_id,"avatar",user_info['avatar']);

                        if(user_info['black'] == 1){

                              black_list[u_id] = user_info;
                              black_card += '<div id="black_' + u_id + '" class="card blackCard'+u_id+'"> <div class="card-content"> <img src="'+  u_list[u_id].avatar +'" class="yylb-img"> <div style="width: 65%;"> <span class="span-top friend_name">'+  u_list[u_id].u_name +' </span> </div> <a href="javascript:;" onclick="update_black_user('+u_id+', 0);"> <span class="item-title aspan btn-normal">恢复</span> </a> </div> </div>';

                        }else if(user_info['friend'] == 1){ 
                            	
                            connect_list[u_id] = 0;
				  		    connect_n++;
					  	   
                            friend_list[u_id] = user_info;
                            friend_card += '<div id="friend_' + u_id + '" class="card friendCard'+u_id+'"> <div class="card-content"> <img src="'+  u_list[u_id].avatar +'" class="yylb-img"> <div> <span class="span-top friend_name">'+  u_list[u_id].u_name +' </span><i class="msgNum">0</i> <span class="state"></span> </div>  <a href="javascript:;" onclick="showChatDialog('+u_id+');"> <span class="item-title aspan">私聊</span> </a> <a href="javascript:;" onclick="update_black_user('+u_id+', 1);"> <span class="item-title aspan btn-danger">拉黑</span> </a> </div> </div>';

                            if(user_info['recent'] == 1){
                                recent_list[u_id] = user_info;
                                recent_card += ' <div id="recent_' + u_id + '" class="card recentCard'+u_id+'" onclick="showChatDialog('+u_id+');"> <div class="card-content"> <img src="'+  u_list[u_id].avatar +'" class="yylb-img"> <div style="width: 85%;"> <span class="span-top friend_name">'+  u_list[u_id].u_name +' </span><i class="msgNum">0</i> <span class="state"></span> </div> </div> </div>';
                            }

                        }
                     
					}

					setTimeout("getconnect()", 1000);
					
                    $('#chat_recent_list').html(recent_card);
                    $('#chat_friend_list').html(friend_card);
                    $('#chat_black_list').html(black_card);

					setInterval( function () { 
						$.get(CHAT_SITE_URL+'/index.php?c=web_chat&a=get_session&key=member_id');
                    }, time_max*60000);
		
			  },
              error: function (){
                    console.log('dataTypeErr');
              }
			});
		} 

        //表情按钮初始化
        $("#chat_show_smilies").smilies({smilies_id:"send_message"});
        
        //新消息提醒音频设置
        $("#jplayer").jPlayer( { ready: function () { $(this).jPlayer("setMedia", { mp3: RESOURCE_SITE_URL+"/js/ding.mp3"}); } });
       
        //好友列表以及聊天窗口下拉刷新/加载初始化
        $$.initPullToRefresh('.pull-to-refresh-content');
        $$(document).on('refresh', '.pull-to-refresh-content',function(e) {
            if(e.target.id == 'chat'){
                  
                  setTimeout(function() {
                        send_state();
                        $$.pullToRefreshDone('.pull-to-refresh-content');
                  }, 1000);

            }else if(e.target.id == 'chatContent'){
                if(!chat_uid)  return false;
                var ajaxurl = CHAT_SITE_URL+'/index.php?c=web_chat&a=get_chat_log&f_id='+user['u_id']+'&t_id='+chat_uid+'&t='+chatlist_min_time;
                var list = '';
		        $.ajax({
			        type: "GET",
			        url: ajaxurl,
			        dataType:"json",
			        async: true,
		            success: function(chat_msg){
                        if(chat_msg.list.length > 0){

                               if(chatlist_min_time == 0) $('#chat-list').html('');
                               
                               list = chat_msg.list;
                               for(var k in list){
                                    var class_html = '';
		    	                    var text_append = '';
                                    var user_avatar = '';
		    	                    var msg = list[k];
		    	                    if (msg['f_name'] == user['u_name'] ) {
		    		                    class_html = ' item-media-right';
                                        user_avatar = user['avatar'];
		    	                    }else{
                                        user_avatar = user_list[msg['f_id']]['avatar'];
                                    }
                                    text_append += '<div data-mid="'+msg['m_id']+'" class="item-media'+class_html+'"> <img src="'+user_avatar+'" width="33"><i class="msg-time">'+msg['time']+'</i><div class="item-subtitle">'+ update_chat_msg(msg['t_msg']) +'</div> </div>';
		                            $('#chat-list').prepend(text_append);
                                    chatlist_min_time = msg['add_time'];
                               }

                        }else{
                            $$.toast('没有更多消息了');
                        }
                        $$.pullToRefreshDone('.pull-to-refresh-content');
		            }
		         });

            }
          
        });

	});

    function update_black_user(uid, black){
        $$.showIndicator();
        $.get(CHAT_SITE_URL+'/index.php?c=web_chat&a=update_black_user&uid='+user['u_id']+'&fid='+uid+'&black='+black, '', function (data){
        
            $$.hideIndicator();
            if(data.status == 1){
                 
                if(black == 1){
                    //connect_list
                    delete connect_list.uid;
				    connect_n--;
                    //friend_list
                    var blacker = friend_list[uid];
                    delete friend_list[uid];
                    $('#chat_friend_list #friend_'+uid).remove();
                    //recent_list
                    delete recent_list[uid];
                    $('#chat_recent_list #recent_'+uid).remove();

                    if(msg_list[uid].length > 0){
                        
                        var max_id = 0;
                        for (var m_id in msg_list[uid]){
			
			                delete msg_list[uid][m_id];//删除消息
            
                            new_msg--;

			                if ( m_id > max_id ) max_id = m_id;
		                }
                        if ( max_id > 0 && connect === 1 ) socket.emit('del_msg', {'max_id':max_id,'f_id':uid});
                    }

                    
                    black_list[uid] = blacker;
                    $('#chat_black_list').append('<div id="black_' + uid + '" class="card blackCard'+ uid +'"> <div class="card-content"> <img src="'+  blacker.avatar +'" class="yylb-img"> <div style="width: 65%;"> <span class="span-top friend_name">'+  blacker.u_name +' </span> </div> <a href="javascript:;" onclick="update_black_user('+uid+', 0);"> <span class="item-title aspan btn-normal">恢复</span> </a> </div> </div>');
                    showTab(3);

                 }else{

                    var friend = black_list[uid];

                    delete black_list[uid];
                    $('#chat_black_list #black_'+uid).remove();
                    
                    connect_list[uid] = 0;
				    connect_n++;

                    friend_list[uid] = friend;
                    $('#chat_friend_list').prepend('<div id="friend_' + uid + '" class="card friendCard'+uid+'"> <div class="card-content"> <img src="'+  friend.avatar +'" class="yylb-img"> <div> <span class="span-top friend_name">'+  friend.u_name +' </span><i class="msgNum">0</i> <span class="state"></span> </div>  <a href="javascript:;" onclick="showChatDialog('+uid+');"> <span class="item-title aspan">私聊</span> </a> <a href="javascript:;" onclick="update_black_user('+uid+', 1);"> <span class="item-title aspan btn-danger">拉黑</span> </a> </div> </div>');

                    showTab(2);
                    
                    send_state();

                 }

            }else{
                $$.toast(data.msg);
            }
            
        }, 'json');
         
    }

    function get_state(list){//返回会员的状态并在页面显示
        //console.log(list);
		var u_list = list['u_state'];
		set_user_list(list['user']);
		if(user['u_id'] != '') {
			update_friends();
            update_recent();
		} else {
		    socket.disconnect();
		}
	}

    function send_msg(){//发消息
		if(chat_uid < 1) {
			$$.toast('未选择聊天会员');
			return false;
		}
		var msg = {};
		msg['f_id'] = user['u_id'];
		msg['f_name'] = user['u_name'];
		msg['t_id'] = chat_uid;
		msg['t_name'] = user_list[chat_uid]['u_name'];
		msg['t_msg'] = $.trim($("#send_message").val());
		if(msg['t_msg'].length < 1) {
			$$.toast('发送内容不能为空');
			return false;
		}
		if(msg['t_msg'].length > 255) {
			$$.toast('一次最多只能发送255字');
			return false;
		}
		if(connect < 1) {
			$$.toast('处于离线状态,稍后再试');
			return false;
		}
		$.ajax({
			type: "POST",
			url: CHAT_SITE_URL+'/index.php?c=web_chat&a=send_msg',
			dataType:"json",
			data: msg,
			async: false,
		    success: function(t_msg){

				if(t_msg.status == 1) {

                     if ( connect === 1 ) {

						socket.emit('send_msg', t_msg.msg);

						show_t_msg(t_msg.msg);

						return true;

					} else {

						$$.toast('由于网络原因未发送成功,稍后再试');
						return false;

					}

				} else {
					
					$$.toast(t_msg.msg);
					return false;
                   
			   }

		  }
		});
	}

	function show_t_msg(msg){//显示发出的消息
		var user_info = user;
		var u_id = msg['t_id'];
		var text_append = '';
        text_append += ' <div data-mid="'+msg['m_id']+'" class="item-media item-media-right"> <img src="'+user_info['avatar']+'" width="33"> <i class="msg-time">'+msg['add_time']+'</i> <div class="item-subtitle">'+ update_chat_msg(msg['t_msg']) +'</div> </div>';
        $('#chat-list').append(text_append);
        $("#send_message").val('');
        $('#chatContent').scrollTop($('#chat-list').height());
	}

	function show_msg(u_id, show){//显示会员的消息
		var user_info = user_list[u_id];
		var u_name = user_info['u_name'];
		var max_id = 0;
		
		var text_append = '';
        for (var m_id in msg_list[u_id]){
			
            var msg = msg_list[u_id][m_id];
            
            if(show === true) text_append += ' <div data-mid="'+msg['m_id']+'" class="item-media"> <img src="'+user_info['avatar']+'" width="33"> <i class="msg-time">'+msg['add_time']+'</i> <div class="item-subtitle">'+ update_chat_msg(msg['t_msg']) +'</div> </div>';

			delete msg_list[u_id][m_id];//删除消息
            
            new_msg--;

			if ( m_id > max_id ) max_id = m_id;
		}

        if(show === true){ 
            $('#chat-list').append(text_append);
            $('#chatContent').scrollTop($('#chat-list').height());
        }
		$("#send_message").focus();

        if ( max_id > 0 && connect === 1 ) socket.emit('del_msg', {'max_id':max_id,'f_id':u_id});

	}

    
    function show_chat_msg(u_id){
    
        if(chat_uid != u_id) return false;

        //get_chat_msg(u_id, 1, false);
        
        if(msg_list[u_id].length > 0){
            
            //show_msg(u_id, false);
            show_msg(u_id, true);
            
            user_list[u_id]['new_msg'] = 0;
            
        }

    }

  

    function get_chat_msg(t_id, time_from, isAysn){
        var ajaxurl = CHAT_SITE_URL+'/index.php?c=web_chat&a=get_chat_log&f_id='+user['u_id']+'&t_id='+t_id+'&t='+time_from;
		$.ajax({
			type: "GET",
			url: ajaxurl,
			dataType:"json",
			async: isAysn,
		    success: function(chat_msg){
               if(chat_msg.list.length > 0) show_chat_list(chat_msg.list);
		    }
		});
	}

    function show_chat_list(chat_msg){
		
        $('#chat-list').html('');
        for (var k in chat_msg){
		    	var class_html = '';
		    	var text_append = '';
                var user_avatar = '';
		    	var msg = chat_msg[k];
		    	if (msg['f_name'] == user['u_name'] ) {
		    		class_html = ' item-media-right';
                    user_avatar = user['avatar'];
		    	}else{
                    user_avatar = user_list[msg['f_id']]['avatar'];
                }
                text_append += '<div data-mid="'+msg['m_id']+'" class="item-media'+class_html+'"> <img src="'+user_avatar+'" width="33"><i class="msg-time">'+msg['time']+'</i><div class="item-subtitle">'+ update_chat_msg(msg['t_msg']) +'</div> </div>';
		        $('#chat-list').prepend(text_append);

                chatlist_min_time = msg['add_time'];
	    }
        setTimeout(function (){$('#chatContent').scrollTop($('#chat-list').height()); }, 500);
	}

	function set_user(u_id,u_name){//初始化会员信息
		var user_info = new Array();
		user_info['u_id'] = u_id;
		user_info['u_name'] = u_name;
		user_info['new_msg'] = 0;
		user_info['online'] = 0;
		if ( typeof user_list[u_id] === "undefined" ) user_list[u_id] = user_info;
		if ( typeof msg_list[u_id] === "undefined" ) msg_list[u_id] = new Array();
	}
	function set_user_info(u_id,k,v){//设置会员信息
		if ( typeof user_list[u_id] === "undefined" ) set_user(u_id,'');
		user_list[u_id][k] = v;
	}

    function set_user_list(list){//初始化会员列表
		for (var k in list){
			var user_info = list[k];
			var u_id = user_info['u_id'];
	  	    var u_name = user_info['u_name'];
	  	    var online = 0;
			if ( user_info['online'] > 0 ) online = 1;
			set_user_info(u_id,"u_name",u_name);
			set_user_info(u_id,"avatar",user_info['avatar']);
			set_user_info(u_id,"online",online);
	  }
	}    

    function update_friends(){
       //console.log(user_list);
	   for (var u_id in friend_list){
		    if(user_list[u_id]['online'] > 0 ) {
			    $('#friend_'+u_id+' .state').css({'font-size':'0.6rem', 'color':'green'}).text('在线');
		    } else {
			    $('#friend_'+u_id+' .state').css({'font-size':'0.6rem', 'color':'#888'}).text('离线');
		    }
		}
	}

    function update_recent(){
       //console.log(user_list);
	   for (var u_id in recent_list){
		    if(user_list[u_id]['new_msg'] > 0 ) {
			    $('#recent_'+u_id+' .msgNum').text(user_list[u_id]['new_msg']).show();
            }else{
			    $('#recent_'+u_id+' .msgNum').text('0').hide();
            }
            if(user_list[u_id]['online'] > 0 ) {
			    $('#recent_'+u_id+' .state').css({'font-size':'0.6rem', 'color':'green'}).text('在线');
		    } else {
			    $('#recent_'+u_id+' .state').css({'font-size':'0.6rem', 'color':'#888'}).text('离线');
		    }
		}

	}
    
    function send_state(){//向服务器请求页面中的相关会员的在线状态
		
        var u_list = connect_list;
		var n = connect_n;
		if(connect === 1) {
		    if(n > 0) {
    		    socket.emit('get_state', u_list);
    		} else {
    		    if (user['u_id'] == '') {
        		    socket.disconnect();
    		    }
    		}
		} else {
		    return n;
		}
	}

    function get_msg(list){
        
        //console.log(list);
        for (var k in list){
            //console.log(list[k]);
        	msg = list[k];
			var m_id = msg['m_id'];
			var u_id = msg['f_id'];
			set_user(u_id,msg['f_name']);
			if (typeof msg_list[u_id][m_id] === "object") {//防止重复计数
				continue;
			}
            if (typeof msg['user'] === "object" && typeof msg['user']['avatar'] !== "undefined") {
				var user_info = msg['user'];
		  	    var u_name = user_info['u_name'];
				set_user_info(u_id,"u_name",u_name);
				set_user_info(u_id,"avatar",user_info['avatar']);
				if ( user_info['online'] > 0 ) set_user_info(u_id,"online",1);
			}
            
            msg_list[u_id][m_id] = msg;

            if(chat_uid == 0) {//没有打开对话窗口时计数
				user_list[u_id]['new_msg']++;
                new_msg++;
			} else {
				if (chat_uid == u_id) {
					show_msg(u_id, true);//当前对话的会员消息设为已读
				} else {
					user_list[u_id]['new_msg']++;
                    new_msg++;
				}
			}
            //alert_user_msg(u_id);
        }
        
        send_state();
        
        alert_msg();
    }

	function update_chat_msg(msg){
		if (typeof smilies_array !== "undefined") {
			msg = ''+msg;
			for(var i in smilies_array[1]) {
				var s = smilies_array[1][i];
				var re = new RegExp(""+s[1],"g");
				var smilieimg = '<img width="28" height="28" title="'+s[6]+'" alt="'+s[6]+'" src="'+RESOURCE_SITE_URL+'/js/smilies/images/'+s[2]+'">';
				msg = msg.replace(re,smilieimg);
			}
		}
		return msg;
	}

    function alert_msg(){
	    
		if ( new_msg > 0 ) {//消息提醒
            
            $("#jplayer").jPlayer('play');
            if(!$('#tab-1').hasClass('active')) showTab(1);
            //$(".new_msg_alert").html(new_msg).show();
            
    	} else {
    	  	
            new_msg = 0;
            //$(".new_msg_alert").html('').hide();
            
    	}

	}

    function showTab(index){
        index = index ? index : 2;
        $('.tab-link').removeClass('active');
        $('#tab-'+index).addClass('active');
        $('.tabs .tab').removeClass('active');
        $('#tab'+index).addClass('active');
    }

	function del_msg(msg){//已读消息处理
      	var max_id = msg['max_id'];//最大的消息编号
      	var u_id = msg['f_id'];//消息发送人
      	for (var m_id in msg_list[u_id]){
      		if ( max_id >= m_id) {
      			delete msg_list[u_id][m_id];
      			if ( user_list[u_id]['new_msg'] > 0 ) user_list[u_id]['new_msg']--;
    				if ( new_msg > 0 ) new_msg--;
      		}
      	}
        alert_msg();
	}

    function showChatDialog(uid){ 
        if(!user_list) return false;
        chat_uid = uid;
        $('#chatDialog .chat-avatar').attr('src', user_list[chat_uid]['avatar']);
        $('#chatDialog .chat-name').text(user_list[chat_uid]['u_name']);
        show_chat_msg(chat_uid);

        $$.destroyPullToRefresh('.pull-to-refresh-content');
        $('#chat .pull-to-refresh-layer').remove();
        $('#chat').removeClass('pull-to-refresh-content');
        $('#chatContent').prepend('<div class="pull-to-refresh-layer"> <div class="preloader"></div> <div class="pull-to-refresh-arrow"></div> </div>');
        $('#chatContent').addClass('pull-to-refresh-content');
        $$.initPullToRefresh('.pull-to-refresh-content');
 
        $('#send_message').val('');

        $$.popup('#chatDialog'); 
    }

    function closeChatDialog(){ 
        send_state();
        chat_uid = 0;
        chatlist_min_time = 0;
        $('#chat-list').html('');
    
        $$.destroyPullToRefresh('.pull-to-refresh-content');
        $('#chatContent .pull-to-refresh-layer').remove();
        $('#chatContent').removeClass('pull-to-refresh-content');
        $('#chat').prepend('<div class="pull-to-refresh-layer"> <div class="preloader"></div> <div class="pull-to-refresh-arrow"></div> </div>');
        $('#chat').addClass('pull-to-refresh-content');
        $$.initPullToRefresh('.pull-to-refresh-content');
    
        $$.closeModal('#chatDialog'); 
    }

    function getconnect(){
		
        $.getScript(connect_url+"/resource/socket.io.js", function(){
			clearInterval(interval);
			if ( typeof io === "object" ) {
			  socket = io.connect(connect_url, { 'resource': 'resource', 'reconnect': false });
			  
              socket.on('connect', function () {
			      
                  connect = 1;
			      socket.on('get_state', function (u_list) {
			        get_state(u_list);
			      });
                  if(user['u_id'] == '') return false;//未登录时不取消息
                  
                  socket.emit('update_user', user);
                  socket.on('get_msg', function (msg) {
                     get_msg(msg);
                  });
                  
                  socket.on('send_state', function (){
                      setTimeout(function (){
                        send_state();
                      }, 1000);
                  });

                  socket.on('del_msg', function (msg) {
                      del_msg(msg);
                  });

                  //setInterval(send_state, 8000);
				  socket.on('disconnect', function () {
				    connect = 0;
				    interval = setInterval( getconnect, 60000);//断开1分钟后重新连接服务器
				  });

			  });
		  }
		});
	}
