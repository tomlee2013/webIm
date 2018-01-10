<?php
/*
 * Copyright (C) 昊匠 All rights reserved
 * FileName : 
 *
 * Author : 李星锋|^_^|tomlee 
 * Email : lixingfeng517@gmail.com
 * Date :  2017/06/20
 * Description : 项目自定义公共函数库
 *
 */

function startSendSms($accountId, $dname, $sid, $parentId = 0){
	
	$ch = curl_init(); 
	$curl_opt = array( 
	  CURLOPT_URL => "http://127.0.0.1/sendSms.php?accountId=$accountId&dname=$dname&sid=$sid&parentId=".$parentId,
	  CURLOPT_RETURNTRANSFER => 1, 
	  CURLOPT_TIMEOUT => 1,
	); 
	curl_setopt_array($ch, $curl_opt); 
	curl_exec($ch); 
	$err = curl_error($ch);
	curl_close($ch); 
	//if($err) die('CURL-ERROR:'.$err);

}
