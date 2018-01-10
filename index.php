<?php
/*
 * Copyright (C) HaoJiang All rights reserved
 * FileName : 
 *
 * Author : 昊匠@www.haojiangnet.com 
 * Email  : dev@haojiangnet.com
 * QQ     : 1877358050
 * Date   : 2017/12/01
 * Description : 网页版聊天IM
 *
 */
require 'include/inc.php';

$controller = $_GET['c'];
$action = $_GET['a'];

define('DB_PREFIX', 'chat_');

if($controller == 'web_chat'){
    //获取用户的好友列表
    if($action == 'get_user_list'){

        $f_id = trim($_GET['f_id']);

        if(!$f_id) die('loss params');

        $sql = 'SELECT fu.fuserid as friend_tomid, u.nick_name as u_name, u.headimgurl as avatar, u.sex as gender, fu.black FROM '.DB_PREFIX.'friend AS fu LEFT JOIN '. DB_PREFIX .'user AS u ON fu.fuserid = u.id WHERE fu.userid = '. $f_id .' ORDER BY fu.timeline DESC';
        $list = $db->Query($sql);
        $member_list = array();
        foreach($list as $k => $v){
            if(!$v['black']) $v['friend'] = '1';
            $member_list[$v['friend_tomid']] = $v;
        }

        $add_time = date("Y-m-d");
		$add_time30 = strtotime($add_time)-60*60*24*30;
		$condition = 'f_id = '.$f_id.' AND add_time >= '.$add_time30;

        $sql = 'SELECT count(DISTINCT t_id) as count FROM '.DB_PREFIX.'chat_msg WHERE '.$condition;
        $msg_count = $db->Query($sql);
        $msg_count = $msg_count[0]['count'];
        if($msg_count > 0){
            
            $sql = 'SELECT t_id,t_name,max(add_time) as addtime FROM '.DB_PREFIX.'chat_msg WHERE '.$condition.' GROUP BY t_id ORDER BY addtime DESC' ;
            $list = $db->Query($sql);
            foreach($list as $k => $v) {
				$member = array();
				$u_id = $v['t_id'];
				$member['u_id'] = $u_id;
				$member['u_name'] = $v['t_name'];
				$member['avatar'] = $v['headimgurl'];
				$member['recent'] = 1;
				$member['time'] = date("Y-m-d H:i:s",$v['addtime']);
				if(empty($member_list[$u_id])) {
					$member_list[$u_id] = $member;
                } else {
                    if($member_list[$u_id]['black'] == 1) continue;
					$member_list[$u_id]['recent'] = 1;
					$member_list[$u_id]['time'] = date("Y-m-d H:i:s",$v['addtime']);
				}
            }

        }
	
        
        $condition = 't_id = '.$f_id.' AND add_time >= '.$add_time30;
        $sql = 'SELECT count(DISTINCT f_id) as count FROM '.DB_PREFIX.'chat_msg WHERE '.$condition;
        $msg_count = $db->Query($sql);
        $msg_count = $msg_count[0]['count'];
        if($msg_count > 0){
            
            $sql = 'SELECT f_id,f_name,max(add_time) as addtime FROM '.DB_PREFIX.'chat_msg WHERE '.$condition.' GROUP BY f_id ORDER BY addtime DESC' ;
            $list = $db->Query($sql);
           
            foreach($list as $k => $v) {
				$member = array();
				$u_id = $v['f_id'];
				$member['u_id'] = $u_id;
				$member['u_name'] = $v['f_name'];
				$member['avatar'] = $v['headimgurl'];
				$member['recent'] = 1;
				$member['time'] = date("Y-m-d H:i:s",$v['addtime']);
				if(empty($member_list[$u_id])) {
					$member_list[$u_id] = $member;
				} else {
                    if($member_list[$u_id]['black'] == 1) continue;
					$member_list[$u_id]['recent'] = 1;
					$member_list[$u_id]['time'] = date("Y-m-d H:i:s",$v['addtime']);
				}
            }
        }

        /*echo '<pre>';
		print_r($member_list);
		echo '</pre>';
		exit;*/
        die(json_encode($member_list));

    }elseif($action == 'update_black_user'){

        $userid = trim($_GET['uid']);
        $fuserid = trim($_GET['fid']);

        if(!$userid || !$fuserid) _massege('','', array('status'=> 0, 'msg'=>'发生错误'));

        $friendid = $db->GetOne(DB_PREFIX.'friend', 'friendid', 'userid = '.$userid.' and fuserid='.$fuserid);
        
        if(!$friendid) _massege('', '', array('status'=> 0, 'msg'=>'好友关系不存在'));
        
        $fuserid = trim($_GET['fid']);
        
        $black = intval($_GET['black']);
        
        $db->Update(DB_PREFIX.'friend', array('black' => $black), 'friendid = '.$friendid);

        _massege('', '', array('status' => 1, 'msg' => '操作成功'));

    }elseif($action == 'get_info'){

		$types = array('member_id','member_name','store_id','member');
		$key = $_GET['t'];
        $member_id = intval($_GET['u_id']);
		if($member_id && trim($key) != '' && in_array($key,$types)){
            $member = array();

            $data = $db->getRow(DB_PREFIX . 'user', '*', 'id = '.$member_id);
            $member['age'] = '18';
            $data['avatarurl'] = $data['headimgurl'];
			$data['member_name'] = $data['nick_name'];
			$data['member_avatar'] = $data['headimgurl'];
            die(json_encode($member));
        }

    }elseif($action == 'get_chat_log'){

        $f_id = intval($_GET['f_id']);
		$t_id = intval($_GET['t_id']);
        $page = intval($_GET['page']);

		$add_time_to = date("Y-m-d");
        $time_from = array();
        $time_from['1'] = strtotime($add_time_to) - 60*60*24*1;
		$time_from['7'] = strtotime($add_time_to)-60*60*24*7;
		$time_from['15'] = strtotime($add_time_to)-60*60*24*15;
		$time_from['30'] = strtotime($add_time_to)-60*60*24*30;
		$key = $_GET['t'];
          
        $chat_log = array();
        $list = array();

        if(array_key_exists($key,$time_from)){
            $page = 0;
            $condition_sql = " add_time >= '".$time_from[$key]."' ";
        }else{
            $key = $key ? $key : time();
            if($page < 1) $page = 10;
            $condition_sql = " add_time < '".$key."' ";
        }
        $condition_sql .= " and ((f_id = '".$f_id."' and t_id = '".$t_id."') or (f_id = '".$t_id."' and t_id = '".$f_id."'))";
            
	    $list = $db->FetchAll(DB_PREFIX.'chat_log', '*', $condition_sql , 'm_id DESC', $page);
        if(!empty($list) && is_array($list)) {
			    foreach($list as $k => $v) {
				    $v['time'] = date("Y-m-d H:i:s",$v['add_time']);
				    $list[$k] = $v;
			    }
        }

	    $chat_log['list'] = $list;
	    $chat_log['total_page'] = 1;
        die(json_encode($chat_log));
      

    }elseif($action == 'send_msg'){

        $msg = array();
		$msg['f_id'] = trim($_POST['f_id']);
		$msg['f_name'] = trim($_POST['f_name']);
		$msg['t_id'] = trim($_POST['t_id']);
		$msg['t_name'] = trim($_POST['t_name']);
        $msg['t_msg'] = trim($_POST['t_msg']);
        $msg['f_ip'] = ip();
        //state:1--read ,2--unread
        $msg['r_state'] = '1';
		$msg['add_time'] = time();
        
        $friendid = $db->GetOne(DB_PREFIX.'friend', 'friendid', 'userid = '.$msg['t_id'].' and fuserid='.$msg['f_id']);

        if(!$friendid) 
            _massege('', '', array('status' => 0, 'msg' => '无法发送, 您还不是对方的好友'));

        $black = $db->GetOne(DB_PREFIX.'friend', 'black', 'friendid='.$friendid);

        if($black == 1)
            _massege('', '', array('status' => 0, 'msg' => '无法发送，您已被对方加入黑名单'));

        if($msg['t_msg'] != ''){

            $m_id = $db->Insert(DB_PREFIX.'chat_msg', array_keys($msg), array_values($msg), true);
            $msg['m_id'] = $m_id;
            unset($msg['r_state']);
            
            if($m_id) $db->Insert(DB_PREFIX.'chat_log', array_keys($msg), array_values($msg));
            $msg['add_time'] = date('Y-m-d H:i:s', $msg['add_time']);
            if($msg['m_id']) 
                _massege('', '', array('status' => 1, 'msg' => $msg));
            else
                _massege('', '', array('status' => 0, 'msg' => 'dberror'));
        
        }
    
    }elseif($action == 'get_session'){
    
    }

}

?>
