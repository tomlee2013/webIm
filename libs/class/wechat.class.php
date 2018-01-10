<?php
/*
 * Copyright (C) HaoJiang All rights reserved
 * FileName : 
 *
 * Author : 李星锋|^_^|tomlee 
 * Email : lixingfeng517@gmail.com
 * Date :  2017/7/18
 * Description : 微信接口类
 *
 */

class WeChat{

	public $appId = '';
	public $appSecret = '';
	public $accessToken = '';
	public $lastTime = '';
	public $Token = '';
	public $TopaccessToken = '';



	public function __construct(){

		$this->Token = WX_TOKEN;
		$this->appId = WX_APP_ID;
		$this->appSecret = WX_APP_SECRET; 

		if($this->appId && $this->appSecret){
		
			$url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$this->appId.'&secret='.$this->appSecret;
			$return = json_decode(requests::get($url), true);
			if(!empty($return['access_token'])){
				$this->accessToken = $return['access_token'];
				$this->lastTime = time() + $return['expires_in'];
				
			}else{
				print_r($return);
				die();
			}

		}else{
			die('缺少AppID或AppSecret');
		}

		//$this->lasttime = 

	}

	public function send_template_message($data){
		$url = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token='.$this->accessToken;
		
		return json_decode(requests::post( $url, $data), true);
	}

	public static function valid()
    {
		$echoStr = $_GET["echostr"];
		if($echoStr){
        	if($this->checkSignature()){
            		echo $echoStr;
            		exit;
        	}
		}
	}

	private function checkSignature()
    {
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];    
                
        $token = WX_TOKEN;
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );
        
        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
	}


	public function getWxUserInfo($code){
		
		//https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf0e81c3bee622d60&redirect_uri=http%3A%2F%2Fnba.bluewebgame.com%2Foauth_response.php&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect 
		if(!$code) die('缺少code参数');

		$return = json_decode(requests::get('https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$this->appId.'&secret='.$this->appSecret.'&code='.$code.'&grant_type=authorization_code'), true);

		if(!$return['access_token']) die('获取高级AccessToken失败');
		
		if(!$return['openid']) die('获取OpenID失败');

		$return = json_decode(requests::get('https://api.weixin.qq.com/sns/userinfo?access_token='.$return['access_token'].'&openid='.$return['openid'].'&lang=zh_CN'), true);

		if(!$return['openid']) die('获取用户信息OpenID失败');

		return $return;
	}


	public function responseMsg()
    {
        $postStr = file_get_contents("php://input");

        if (!empty($postStr)){
                
		$this->postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
		switch ($this->postObj->MsgType) { 
			case 'event': 
				switch ($this->postObj->Event) { 
					case 'subscribe': 
						$this->onSubscribe(); 
						break; 
					case 'unsubscribe': 
						$this->onUnsubscribe(); 
						break; 
					case 'SCAN': 
						$this->onScan(); 
						break; 
					case 'LOCATION': 
						$this->onEventLocation(); 
						break; 
					case 'CLICK': 
						$this->onClick(); 
						break; 
				}     
				break; 
			case 'text': $this->onText(); break; 
			case 'image': $this->onImage(); break; 
			case 'location': $this->onLocation(); break; 
			case 'link': $this->onLink(); break; 
			case 'voice': $this->onVoice(); break; 
			default: $this->onUnknown(); break; 
		}
        }else {
            echo "Eoorr";
            exit;
        }
    
    }
	

    public function onSubscribe(){
		$this->reply('text', '欢迎关注万皓车佣^_^');
    }
    public function onText(){
		$this->reply('text', '请在下方的菜单中找到您想要的吧！');
    }

    public function reply($msgType, $data = '', $totalNum = 0){
                
		$fromUsername = $this->postObj->FromUserName;
                $toUsername = $this->postObj->ToUserName;
                $time = time();
		$textTpl = "<xml>
                            <ToUserName><![CDATA[%s]]></ToUserName>
                            <FromUserName><![CDATA[%s]]></FromUserName>
                            <CreateTime>%s</CreateTime>
                            <MsgType><![CDATA[%s]]></MsgType>";
		if($msgType == 'text'){
                	$textTpl .= "<Content><![CDATA[%s]]></Content>
                            <FuncFlag>0</FuncFlag>
                            </xml>";             
		}elseif($msgType == 'news'){
			$artCount = count($data) + 1;
			$textTpl .= "<ArticleCount>".$artCount."</ArticleCount>";
			$textTpl .= "<Articles>";
			foreach($data as $k => $v){
				if(strpos($v['img_url'], 'http') !== false) 
					$imgurl = $v['img_url'];
				else
					$imgurl = 'http://imgcdn.douzhekou.com/'.$v['img_url'];

				$textTpl .= "<item>
					<Title><![CDATA[".strip_tags($v['title'])."]]></Title> 
					<PicUrl><![CDATA[".$imgurl."]]></PicUrl>
					<Url><![CDATA[http://www.douzhekou.com/m/detail.php?id=".$v['id']."]]></Url>
				     </item>";
			}
			$textTpl .= "<item>
				<Title><![CDATA[共".$totalNum."条搜索结果，点击*这里*查看全部>>]]></Title> 
				<PicUrl><![CDATA[http://www.douzhekou.com/public/images/leftArrow.png]]></PicUrl>
				<Url><![CDATA[http://www.douzhekou.com/m/index.php?from=wx&act=search&w=".$this->postObj->Content."]]></Url>
				</item>";
			$textTpl .= "</Articles>
				    </xml>";
		}
                if(!empty($data))
                {
                    $contentStr = $data;
		    if($msgType == 'news')
                    	$resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, $msgType);
		    else
                    	$resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, $msgType, $contentStr);
                    echo $resultStr;
                }else{
                    echo "Input something...";
                }

    }

}

