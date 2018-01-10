<?php
/*
 * Copyright (C) 昊匠 All rights reserved
 * FileName : 
 *
 * Author : 李星锋|^_^|tomlee 
 * Email : lixingfeng517@gmail.com
 * Date :  2017/12/5
 * Description : 微信网页端接口
 *
 */
class WechatWeb {

	private $loginUrl = '';
	private $uuid = '';
	private $uinfoDir = '';
	private $cookieFile = '';
	private $loginFile = '';
	private $initFile = '';
	private $base_host = '';
	private $base_uri = '';
	private $contactsFile = '';
	private $batchContactsFile = array();

	private $pass_ticket = '';
	private $base_request = '';
	private $uin = '';
	private $sid = '';
	private $skey = '';
	private $deviceId = '';
	private $batchContacts = '';

	private $sync_key = '';
	private $sync_key_str = '';
	public $my_account = '';

	private $qrCodeFile = '';
	private $UuidFile = '';
	private $reUrlFile = '';

	public $childDir = '';

	public function __construct($id, $dname = ''){

		if(!$id) die('id参数不能为空');

		if(defined('ROOT_PATH')){
			
			$this->childDir = $dname ? $dname : md5($this->getMillisecond());

			$this->uinfoDir = ROOT_PATH.'data/uinfo_'.$id;
			
			if(!is_dir($this->uinfoDir)){
				@mkdir($this->uinfoDir);
				@chmod($this->uinfoDir, 0777);
			}

			$this->uinfoDir = $this->uinfoDir .'/'. $this->childDir;

		}else{
			$this->uinfoDir = dirname(__FILE__).'/uinfo_'.$id;
		}

		if(!is_dir($this->uinfoDir)){ 
			@mkdir($this->uinfoDir); 
			@chmod($this->uinfoDir, 0777);
		}

		$this->cookieFile = $this->uinfoDir.'/cookie.txt';
		$this->loginFile = $this->uinfoDir.'/loginInfo.txt';
		$this->initFile = $this->uinfoDir.'/initInfo.txt';
		$this->contactsFile = $this->uinfoDir.'/contactsInfo.txt';
		$this->qrCodeFile = $this->uinfoDir.'/loginQrcode.png';
		$this->UuidFile = $this->uinfoDir.'/UUID.txt';
		$this->reUrlFile = $this->uinfoDir.'/reUrl.txt';
		//$this->batchContactsFile = $this->uinfoDir.'/batchContacts.txt';
		
	}

	public function getUuid(){
		
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => "https://login.weixin.qq.com/jslogin",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  //CURLOPT_COOKIEFILE => $this->cookieFile,
		  //CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_POSTFIELDS => "appid=wx782c26e4c19acffb&fun=new&lang=zh_CN&_=".$this->getMillisecond(),
		  CURLOPT_HTTPHEADER => array(
		    "Cache-Control: no-cache",
		    "Content-Type: application/x-www-form-urlencoded",
		  ),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		if ($err) die("getUuid-cURL Error #:" . $err);
		
		$matches = array();
		//window.QRLogin.code = 200; window.QRLogin.uuid = "gd3Mu84opg==";
		preg_match_all('/window\.QRLogin\.code \= (\d+)\;/', $response, $matches);
		if($matches[1][0] != '200') return false;

		preg_match_all('/window\.QRLogin\.uuid \= \"(.*?)\"\;/', $response, $matches);
		file_put_contents($this->UuidFile, $matches[1][0]);
		@chmod($this->UuidFile, 0777);
		return $matches[1][0] ? $matches[1][0] : false;

		//print_r($matches);

	}

	public function saveLoginQrcode(){
		$this->uuid = $uuid = $this->getUuid();
		if(!$uuid) return false;
		$qrUrl = 'https://login.weixin.qq.com/l/'.$uuid;
		
		$flag = true;
		//if(strtoupper(substr(PHP_OS,0,3)) === 'WIN'){
			$flag = file_put_contents($this->qrCodeFile, file_get_contents('http://pan.baidu.com/share/qrcode?w=300&h=300&url='.$qrUrl));
			@chmod($this->qrCodeFile, 0777);
		//}else{
			//system("echo '".$qrUrl."' | qrencode -o - -t UTF8");
		//}
		return $flag;
	
	}

	public function isLogin(){
		
		$uuid =  $this->uuid ? $this->uuid : @file_get_contents($this->UuidFile);

		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => "https://login.weixin.qq.com/cgi-bin/mmwebwx-bin/login?tip=0&uuid=".$uuid."&_=".$this->getMillisecond(),
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 3,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  //CURLOPT_COOKIEFILE => $this->cookieFile,
		  //CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_CUSTOMREQUEST => "GET",
		  CURLOPT_HTTPHEADER => array(
		    "Cache-Control: no-cache",
		  ),
		));
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		$return = array();
		if($err){
			if(strpos($err, 'timed out') !== false){
					$return['code'] = 2;
					$return['info'] = '请扫描登录二维码';
					return $return;
			}
			$return['code'] = 0;
			$return['info'] = $err;
			return $return;
		}

		if(strpos($response, 'window.code') !== false){
			preg_match_all('/window\.code\=(\d+)\;/', $response, $matches);
			switch ($matches[1][0]) {
				case '408': 
					$return['code'] = 2;
					$return['info'] = '请扫描登录二维码';
					break;
				case '201': // code...  
					$return['code'] = 2;
					$return['info'] = '扫码成功，请确认登录';
					break;
				case '200': // code...  
					preg_match_all('/window\.redirect_uri\=\"(.*?)\"\;/', $response, $matches);
					$this->loginUrl =  $matches[1][0];
					file_put_contents($this->reUrlFile, $matches[1][0]);
					@chmod($this->reUrlFile, 0777);
					$return['code'] = 1;
					$return['info'] = '确认成功';
					break;
				default:
					$return['code'] = 0;
					$return['info'] = '登录未成功(未知原因1)';
					break;
			}
			return $return;
		}
		
		$return['code'] = 0;
		$return['info'] = '登录未成功(未知原因2)';
		return false;
			
	}

	public function saveLoginInfo(){
		
		$url = $this->loginUrl ? $this->loginUrl : @file_get_contents($this->reUrlFile);

		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $url.'&fun=new',
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  //CURLOPT_COOKIEFILE => $this->cookieFile,
		  CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_CUSTOMREQUEST => "GET",
		  CURLOPT_HTTPHEADER => array(
		    "Cache-Control: no-cache",
		  ),
		));
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		if($err) die("saveLoginInfo-cURL Error #:" . $err);

		//print_r($response); echo PHP_EOL;

		$ret = $this->xmlToArray($response);
		$return = array();
		if($ret['ret']){
			$return['code'] = 0;
			$return['info'] = '登录失败()';
			return $return;
		}

		$this->setBaseUri();

		file_put_contents($this->loginFile, json_encode($ret));
		@chmod($this->loginFile, 0777);
	
		$return['code'] = 1;
		$return['info'] = '登录信息保存成功';
		return $return;
	}

	private function setBaseUri(){
		
		$url = $this->loginUrl ? $this->loginUrl : @file_get_contents($this->reUrlFile);

		$urlArr = parse_url($url);
		$this->base_uri  = '';
		$this->base_uri .= $urlArr['scheme'].'://';
		$this->base_uri .= $urlArr['host'].'/';
		$pathArr = explode('/', $urlArr['path']);
		$this->base_uri .= $pathArr[1].'/'.$pathArr[2];
		$this->base_host = $urlArr['host'];

	}

	public function initWechatWeb(){
		
		//die($this->base_uri); exit;	
		$this->parseLoginInfo();
		
		$url = $this->base_uri."/webwxinit?r=-".substr(time(), 1)."&lang=zh_CN&pass_ticket=".$this->pass_ticket;

		//print_r($url);
		//echo PHP_EOL;
		//print_r($this->base_request);
		//echo PHP_EOL;
		//exit;

		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $url,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_COOKIEFILE => $this->cookieFile,
		  CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_POSTFIELDS => $this->base_request, 
		  CURLOPT_HTTPHEADER => array(
			"Cache-Control: no-cache",
			"ContentType: application/json",
		  ),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		if ($err) die("initWechatWeb-cURL Error #:" . $err);

		//print_r($response);echo PHP_EOL;

		$ret = json_decode($response, true);
		$result = array();
		if($ret['BaseResponse']['Ret']){
			$result['code'] = 0;
			$result['info'] = '初始化微信网页版发生错误';
			return $result;
		}

		file_put_contents($this->initFile, $response);
		@chmod($this->initFile, 0777);

		//sleep(3);
		
		$flag = $this->wxStatusNotify();

		if($flag !== true) return $flag;

		$result['code'] = 1;
		$result['info'] = '微信网页版登录初始化成功';
		return $result;
	}

	private function wxStatusNotify(){

		$this->parseInitInfo();

		$postJsonArr = array();
		$postJsonArr = json_decode($this->base_request, true);
		$postJsonArr['Code'] = 3;
		$postJsonArr['FromUserName'] = $this->my_account['UserName'];
		$postJsonArr['ToUserName'] = $this->my_account['UserName'];
		$postJsonArr['ClientMsgId'] = $this->getMillisecond() * 1000 + rand(1000, 9999);

		//pMsg($postJsonArr);

		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $this->base_uri."/webwxstatusnotify?pass_ticket=$this->pass_ticket&lang=zh_CN",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_COOKIEFILE => $this->cookieFile,
		  CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_POSTFIELDS => json_encode($postJsonArr), 
		  CURLOPT_HTTPHEADER => array(
			"Cache-Control: no-cache",
			"ContentType: application/json",
		  ),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		if ($err) die("wxStatusNotify-cURL Error #:" . $err);
	
		$ret = json_decode($response, true);

		//if($ret['BaseResponse']['Ret']){
			//$result['code'] = 0;
			//$result['info'] = '微信网页版状态通知发生错误';
			//return $result;
		//}
		return true;

	}

	public function getWxUserContacts(){
		
		$ret = $this->saveWxUserContacts();
		if($ret !== true) return $ret;
		
		//$ret = $this->saveWxBatchContacts();
		//if($ret !== true) return $ret;

		$contacts = $this->filterContacter();

		if(is_array($this->batchContacts) && count($this->batchContacts) > 0)
				$contacts = array_merge($contacts, $this->batchContacts);

		return $contacts;
	}

	private function saveWxUserContacts(){

		//pMsg("https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxgetcontact?seq=0&pass_ticket=$this->pass_ticket&skey=".$this->skey."&r=".$this->getMillisecond());
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $this->base_uri."/webwxgetcontact?seq=0&pass_ticket=$this->pass_ticket&skey=".$this->skey."&r=".$this->getMillisecond(),
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_COOKIEFILE => $this->cookieFile,
		  CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_POSTFIELDS => $this->base_request, 
		  CURLOPT_HTTPHEADER => array(
			"Cache-Control: no-cache",
			"ContentType: application/json",
		  ),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		if ($err) die("getWxUserContacts-cURL Error #:" . $err);

		$ret = json_decode($response, true);
		$result = array();
		if($ret['BaseResponse']['Ret']){
			$result['code'] = 0;
			$result['info'] = '获取用户联系人失败';
			return $result;
		}
		
		$flag = file_put_contents($this->contactsFile, $response);
		@chmod($this->contactsFile, 0777);
		
		if($flag !== false) return true;
		
		//print_r($response);exit;
		
		$result['code'] = 0;
		$result['info'] = '保存用户联系人失败';
		return $result;
	
	}

	private function saveWxBatchContacts(){

		//pMsg("https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxgetcontact?seq=0&pass_ticket=$this->pass_ticket&skey=".$this->skey."&r=".$this->getMillisecond());
		//
		$postJsonArr = array();
		$postJsonArr = json_decode($this->base_request, true);
		//$postJsonArr['Count'] = 3;
		//$postJsonArr['List'] = array();

		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $this->base_uri."/webwxbatchgetcontact?type=ex&pass_ticket=$this->pass_ticket&skey=".$this->skey."&r=".$this->getMillisecond(),
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_COOKIEFILE => $this->cookieFile,
		  CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_POSTFIELDS => $this->base_request, 
		  CURLOPT_HTTPHEADER => array(
			"Cache-Control: no-cache",
			"ContentType: application/json",
		  ),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		if ($err) die("getWxBatchContacts-cURL Error #:" . $err);
		
		//print_r($response);echo PHP_EOL;

		$ret = json_decode($response, true);
		$result = array();
		if($ret['BaseResponse']['Ret']){
			$result['code'] = 0;
			$result['info'] = '获取群用户联系人失败';
			return $result;
		}
		
		$flag = file_put_contents($this->batchContactsFile, $response);
		@chmod($this->batchContactsFile, 0777);
		
		if($flag !== false) return true;
		
		//print_r($response);exit;
		
		$result['code'] = 0;
		$result['info'] = '保存群用户联系人失败';
		return $result;
	
	}

	//type: 1. 
	private function filterContacter($type = 0){

		$contactsInfo = json_decode(file_get_contents($this->contactsFile), true);

		$contacts = array();
		foreach($contactsInfo['MemberList'] as $k=>$v){
			
			if ($v['AttrStatus'] < 200) continue;
			
			$contacts[$k]['UserName'] = $v['UserName'];
			$contacts[$k]['NickName'] = $v['NickName'];

		}

		return $contacts;

	}



	public function batchSendSms($contacts, $content){
		
		if(!$content) die('缺少必要参数content');
		
		$surpUsers = $totalUsers = count($contacts);
		$succUsers = 0;
		$failUsers = 0;
		foreach($contacts as $k=>$v){
			
			//if($v['NickName'] == '半杯茶')
			//if($v['NickName'] == '阿里郎')
			$ret = $this->sendTextSms($v['UserName'], $content);
			if($ret !== true){
				pMsg('发送给：'.$v['NickName'].'的消息失败,失败原因-('.$ret['info'].')');
				$failUsers++;
			}else{
				pMsg('发送给：'.$v['NickName'].'的消息成功');
				$succUsers++;
			}
			
			$surpUsers--;

		}

		pMsg('共需要发送用户数：'. $totalUsers);
		pMsg('已发送用户数：'. ($totalUsers - $surpUsers));
		pMsg('其中发送成功用户数：'. $succUsers);
		pMsg('其中发送失败用户数：'. $failUsers);
		pMsg('还未发送用户数：'. $surpUsers);

	
	}

	private function getMimeType($filePath){
		
		if(extension_loaded('fileinfo')){
			
			$fi = new finfo(FILEINFO_MIME_TYPE); 
			$mime_type = $fi->file($filePath);
		}else{

			$mimeType =  'images/jpeg';

		}
		return 	$mime_type;
	}

	public function uploadMedia($imgPath){
		
		$up_url =  'https://file.'. $this->base_host . '/cgi-bin/mmwebwx-bin/webwxuploadmedia?f=json';
		$up_url2 = 'https://file2.'. $this->base_host .'/cgi-bin/mmwebwx-bin/webwxuploadmedia?f=json';
		
		$imgPath = realpath($imgPath);
		$image_name = basename($imgPath);
		$mimeType = $this->getMimeType($imgPath);

		$fTime = filemtime($imgPath);
		//'Thu Mar 17 2016 00:55:10 GMT+0800 (CST)';
		$lastModifieDate = gmdate('D M d Y H:i:s TO',$fTime ).' (CST)';
		$file_size = filesize($imgPath);
		$pass_ticket = $this->pass_ticket;
		$client_media_id = (time() * 1000).mt_rand(10000,99999);
		$webwx_data_ticket = '';
		$fp = fopen($this->cookieFile, 'r');
		 while ($line = fgets($fp)) {
            # code...
            if(strpos($line,'webwx_data_ticket')!==false){
                $arr=explode("\t", trim($line));
                //var_dump($arr);
                $webwx_data_ticket = $arr[6];
                break;
            }
		}
		
		$base_request = json_decode($this->base_request, true);
		$uploadmediarequest = json_encode(array(
            "BaseRequest"=> $base_request['BaseRequest'],
            "ClientMediaId"=> $client_media_id,
            "TotalLen"=> $file_size,
            "StartPos"=> 0,
            "DataLen"=> $file_size,
            "MediaType"=> 4,
			"UploadType"=>2,
		), JSON_UNESCAPED_SLASHES);
        $multipart_encoder = array(
            'id'=> 'WU_FILE_1',
            'name'=> $image_name,
            'type'=> $mimeType,
            'lastModifieDate'=> $lastModifieDate,
            'size'=> $file_size,
            'mediatype'=> 'pic',
            'uploadmediarequest'=> $uploadmediarequest,
            'webwx_data_ticket'=> $webwx_data_ticket,
            'pass_ticket'=> $pass_ticket,
			'filename'=> new CURLFile($imgPath),
			
		);
		//print_r($multipart_encoder); exit;
		$ret = $this->curlUploadImg($up_url, $multipart_encoder);

		$result = array();

		if($ret['BaseResponse']['Ret']){
			
			$ret = $this->curlUploadImg($up_url2, $multipart_encoder);

			if($ret['BaseResponse']['Ret']){
				
				$result['code'] = 0;
				$result['info'] = '图片上传失败';
				return $result;
			}
		
		}
		
		$result['code'] = 1;
		$result['mid'] = $ret['MediaId'];
		return $result;

	}

	private function curlUploadImg($url, $postArr){
		
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $url,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 60,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_COOKIEFILE => $this->cookieFile,
		  CURLOPT_POSTFIELDS => $postArr, 
		  CURLOPT_HTTPHEADER => array(
			"Cache-Control: no-cache",
			"Content-Type:multipart/form-data",
			"user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36"
		  ),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		if ($err) die("uploadPic-cURL Error #:" . $err);

		//print_r($response);exit;

		return json_decode($response, true);
	
	}

	public function sendImgSms($toUserName, $mid, $imgPath){
		sleep(1);
	
		$url = $this->base_uri . '/webwxsendmsgimg?fun=async&f=json';
		
		$clientMsgId = $this->getMillisecond() * 1000 + rand(1000, 9999);
		$postJsonArr = array();
		$postJsonArr = json_decode($this->base_request, true);
		$postJsonArr['Msg']['Type'] = 3;
		$postJsonArr['Msg']['MediaId'] = $mid;
		$postJsonArr['Msg']['FromUserName'] = $this->my_account['UserName'];
		$postJsonArr['Msg']['ToUserName'] = $toUserName;
		$postJsonArr['Msg']['LocalID'] = $clientMsgId;
		$postJsonArr['Msg']['ClientMsgId'] = $clientMsgId;

		if(pathinfo($imgPath, PATHINFO_EXTENSION) == 'gif'){
			$url = $this->base_uri . '/webwxsendemoticon?fun=sys';
			$postJsonArr['Msg']['Type'] = 47;
            $postJsonArr['Msg']['EmojiFlag'] = 2;
		}

		
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $url,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_COOKIEFILE => $this->cookieFile,
		  CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_POSTFIELDS => json_encode($postJsonArr, JSON_UNESCAPED_UNICODE), 
		  CURLOPT_HTTPHEADER => array(
			"Cache-Control: no-cache",
			"ContentType: application/json",
		  ),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		$result = array();
		if ($err) {
			$result['code'] = 0;
			$result['info'] = 'SendImgSms-cURL Error #:' . $err;
			return $result;
		}
		//print_r($response); echo PHP_EOL; exit;
		
		$ret = json_decode($response, true);
		if($ret['BaseResponse']['Ret']){
			$result['code'] = 0;
			$result['info'] = $ret['BaseResponse']['Ret'].'(发送失败)';
			return $result;
		}

		return true;

	}
	
	public function asynSendSms($contacts, $content = '', $mid = false, $callback){
			
			$isImgSms = $mid !== false ? true : false;

			$rc = new muti_curl($callback);
			$rc->timeout = 10;
			//$thread_size = 2;
			$thread_size = count($contacts);
			$rc->thread_size = $thread_size;

			$url= $isImgSms ? $this->base_uri . '/webwxsendmsgimg?fun=async&f=json' : $this->base_uri."/webwxsendmsg?pass_ticket=$this->pass_ticket";

			$postJsonArr = array();
			$postJsonArr = json_decode($this->base_request, true);
			$postJsonArr['Msg']['Type'] = $isImgSms ? 3 : 1;
			if($isImgSms)
					$postJsonArr['Msg']['MediaId'] = $mid;
				else
					$postJsonArr['Msg']['Content'] = $content;
			$postJsonArr['Msg']['FromUserName'] = $this->my_account['UserName'];

			$clientMsgId = 0;
			foreach ($contacts as $k=>$v) {

				//if(!in_array($v['NickName'], array('半杯茶', 'JZ&amp;浩'))) continue;
				
				$postJsonArr['Msg']['ToUserName'] = $v['UserName'];
				$clientMsgId = $this->getMillisecond() * 1000 + rand(1000, 9999);
				$postJsonArr['Msg']['LocalID'] = $clientMsgId;
				$postJsonArr['Msg']['ClientMsgId'] = $clientMsgId;

				$option_setting = array(
		  			CURLOPT_URL => $url,
		  			CURLOPT_RETURNTRANSFER => true,
		  			CURLOPT_MAXREDIRS => 10,
		  			CURLOPT_TIMEOUT => 30,
		  			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  			CURLOPT_CUSTOMREQUEST => "POST",
		  			CURLOPT_SSL_VERIFYPEER => false,
          			CURLOPT_SSL_VERIFYHOST => false,
		  			CURLOPT_COOKIEFILE => $this->cookieFile,
		  			CURLOPT_COOKIEJAR  => $this->cookieFile,
		  			CURLOPT_POSTFIELDS => json_encode($postJsonArr, JSON_UNESCAPED_UNICODE), 
		  			CURLOPT_HTTPHEADER => array(
		  			  "Cache-Control: no-cache",
		  			  "ContentType: application/json",
		  			),
			   );							
				
				$request = new request_setting($option_setting, $v);
				$rc->add($request);

			}
			return $rc->execute();

	}


	public function sendTextSms($toUserName, $content){
		sleep(1);
		//pMsg($this->my_account['UserName'].'--to--'.$toUserName."Say:".$content); return true;
		
		$clientMsgId = $this->getMillisecond() * 1000 + rand(1000, 9999);
		$postJsonArr = array();
		$postJsonArr = json_decode($this->base_request, true);
		$postJsonArr['Msg']['Type'] = 1;
		$postJsonArr['Msg']['Content'] = $content;
		$postJsonArr['Msg']['FromUserName'] = $this->my_account['UserName'];
		$postJsonArr['Msg']['ToUserName'] = $toUserName;
		$postJsonArr['Msg']['LocalID'] = $clientMsgId;
		$postJsonArr['Msg']['ClientMsgId'] = $clientMsgId;

		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $this->base_uri."/webwxsendmsg?pass_ticket=$this->pass_ticket",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_COOKIEFILE => $this->cookieFile,
		  CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_POSTFIELDS => json_encode($postJsonArr, JSON_UNESCAPED_UNICODE), 
		  CURLOPT_HTTPHEADER => array(
			"Cache-Control: no-cache",
			"ContentType: application/json",
		  ),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		$result = array();
		if ($err) {
			$result['code'] = 0;
			$result['info'] = 'SendTextSms-cURL Error #:' . $err;
			return $result;
		}

		//print_r($response); echo PHP_EOL;
		
		$ret = json_decode($response, true);
		if($ret['BaseResponse']['Ret']){
			$result['code'] = 0;
			$result['info'] = $ret['BaseResponse']['Ret'].'(发送失败)';
			return $result;
		}

		return true;

	}

	public function wxWebLogout(){

		chmod($this->cookieFile, 0777);

		deldir($this->uinfoDir);

		if(!$this->base_uri || !$this->skey) return false;
			
		$url = $this->base_uri.'/webwxlogout?type=1&skey='.$this->skey;
		//print_r($url);echo PHP_EOL;

		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $url,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_COOKIEFILE => $this->cookieFile,
		  //CURLOPT_COOKIEJAR  => $this->cookieFile,
		  CURLOPT_SSL_VERIFYPEER => false,
          CURLOPT_SSL_VERIFYHOST => false,
		  CURLOPT_CUSTOMREQUEST => "GET",
		  //CURLOPT_FOLLOWLOCATION => 1,
		  CURLOPT_HTTPHEADER => array(
		    "Cache-Control: no-cache",
		  ),
		));
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		
		if($err) die("wxWebLogout-cURL Error #:" . $err);
		
		//print_r($response); echo PHP_EOL;
		return true;

	}

	private function parseInitInfo(){
		
		$initInfo = json_decode(file_get_contents($this->initFile), true);

		$this->sync_key = $initInfo['SyncKey'];
		$this->my_account = $initInfo['User'];
		foreach($this->sync_key as $k=>$v){
			$this->sync_key_str .= $v['Key'] . '_' . $v['Val'] .'|';
		}

		$list = $initInfo['ContactList'];

		foreach($list as $k=>$v){
			if(substr($v['UserName'], 0, 2) == '@@'){
				$this->batchContacts[$k]['UserName'] = $v['UserName'];
				$this->batchContacts[$k]['NickName'] = $v['NickName'];
			}
		}

	}

	private function parseLoginInfo(){
	
		$loginInfo = json_decode(file_get_contents($this->loginFile), true);

		$this->pass_ticket = $loginInfo['pass_ticket'];
		$this->uin = $loginInfo['wxuin'];
		$this->sid = $loginInfo['wxsid'];
		$this->skey = $loginInfo['skey']; 
		//$this->deviceId = 'e' . $this->random(14);
		$this->deviceId = 'e' . rand(10000000, 99999999) . rand(1000000, 9999999);
		
		$this->base_request = '{"BaseRequest": {"Sid": "'.$this->sid.'", "Skey": "'.$this->skey.'", "DeviceID": "'.$this->deviceId.'", "Uin": "'.$this->uin.'"}}';
		
		/*$base_request = array();
		$base_request['BaseRequest']['Sid'] = $this->sid;
		$base_request['BaseRequest']['Skey'] = $this->skey;
		$base_request['BaseRequest']['DeviceID'] = $this->deviceId;
		$base_request['BaseRequest']['Uin'] = $this->uin;
		$this->base_request = json_encode($base_request , JSON_UNESCAPED_SLASHES);*/

	}

	private function getMillisecond() { 
    	list($s1, $s2) = explode(' ', microtime()); 
    	return (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000); 
	}

	private function xmlToArray($xml){ 
		libxml_disable_entity_loader(true); 
		$xmlstring = simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA); 
		$val = json_decode(json_encode($xmlstring),true); 
		return $val; 
	} 

	private function random($length, $chars = '0123456789'){
		$hash = '';
		$max = strlen($chars) - 1;
		for($i = 0; $i < $length; $i++) {
		$hash .= $chars[mt_rand(0, $max)];
		}
		return $hash;
	}

}

?>
