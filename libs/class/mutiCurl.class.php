<?php

class request_setting {
    public $options = null;
    public $extData = null;
    function __construct($options = null, $extData = '') {
        $this->options = $options;
        $this->extData = $extData;
    }
    public function __destruct() {
        unset($this->options, $this->extData);
    }
}
/***********************************************************************************************
    批量操作的类
*******************************************************************************************/
class muti_curl {
    protected   $thread_size = 100;
    protected   $timeout = 10;
    private     $callback;
    protected   $options = array(
        CURLOPT_SSL_VERIFYPEER => false,//禁用后cURL将终止从服务端进行验证。使用CURLOPT_CAINFO选项设置证书使用CURLOPT_CAPATH选项设置证书目录 如果CURLOPT_SSL_VERIFYPEER(默认值为2)被启用，CURLOPT_SSL_VERIFYHOST需要被设置成TRUE否则设置为FALSE。    自cURL 7.10开始默认为TRUE。从cURL 7.10开始默认绑定安装。
        CURLOPT_RETURNTRANSFER => true,  //将 curl_exec()获取的信息以文件流的形式返回，而不是直接输
        CURLOPT_CONNECTTIMEOUT => 15,
        CURLOPT_TIMEOUT => 30,
//      CURLOPT_HTTP_VERSION=>CURL_HTTP_VERSION_1_0, //使用代理的时候用这个去抓取数据，更爽
//      CURLOPT_AUTOREFERER=>false,//     当根据Location:重定向时，自动设置header中的Referer:信息。   
//      CURLOPT_BINARYTRANSFER=>false,    //在启用CURLOPT_RETURNTRANSFER的时候，返回原生的（Raw）输出这个不用设置。 
//      CURLOPT_COOKIESESSION=>true,//    启用时curl会仅仅传递一个session cookie，忽略其他的cookie，默认状况下cURL会将所有的cookie返回
//      CURLOPT_CRLF=>false,//    启用时将Unix的换行符转换成回车换行符。  
//      CURLOPT_DNS_USE_GLOBAL_CACHE=>false, // 启用时会启用一个全局的DNS缓存，此项为线程安全的，并且默认启用。    
//      CURLOPT_FAILONERROR=>false,  // 显示HTTP状态码，默认行为是忽略编号小于等于400的HTTP信息。   
//      CURLOPT_FILETIME=>true,   //启用时会尝试修改远程文档中的信息。结果信息会通过 curl_getinfo()函数的CURLINFO_FILETIME选项返回。 curl_getinfo(). 
//      CURLOPT_FOLLOWLOCATION=>false, //     启用时会将服务器服务器返回的"Location: "放在header中递归的返回给服务器，使用CURLOPT_MAXREDIRS可以限定递归返回的数量。   
//      CURLOPT_FORBID_REUSE=>true,   //在完成交互以后强迫断开连接，不能重用。  
//      CURLOPT_FRESH_CONNECT=>true,//    强制获取一个新的连接，替代缓存中的连接。   
//      CURLOPT_FTP_USE_EPRT=>false,//    启用时当FTP下载时，使用EPRT (或 LPRT)命令。设置为FALSE时禁用EPRT和LPRT，使用PORT命令 only.   
//      CURLOPT_FTP_USE_EPSV=>false,//    启用时，在FTP传输过程中回复到PASV模式前首先尝试EPSV命令。设置为FALSE时禁用EPSV命令。   
//      CURLOPT_FTPAPPEND=>false,//   启用时追加写入文件而不是覆盖它。   
//      CURLOPT_FTPASCII=>false,//   CURLOPT_TRANSFERTEXT的别名。    
//      CURLOPT_FTPLISTONLY=>false,//     启用时只列出FTP目录的名字。    
//      CURLOPT_HEADER=>true,//   启用时会将头文件的信息作为数据流输出。    
//      CURLINFO_HEADER_OUT=>false,   //启用时追踪句柄的请求字符串。   
//      CURLOPT_HTTPGET=>true,//  启用时会设置HTTP的method为GET，因为GET是默认是，所以只在被修改的情况下使用。 
//      CURLOPT_HTTPPROXYTUNNEL =>true,// 启用时会通过HTTP代理来传输。   
//      CURLOPT_MUTE=>true,//     启用时将cURL函数中所有修改过的参数恢复默认值。  
//      CURLOPT_NETRC=>false,//   在连接建立以后，访问~/.netrc文件获取用户名和密码信息连接远程站点。  
//      CURLOPT_NOBODY=>true,     启用时将不对HTML中的BODY部分进行输出。    
//      CURLOPT_NOPROGRESS=>false,//启用时关闭curl传输的进度条，此项的默认设置为启用。
//      CURLOPT_NOSIGNAL=>false,//    启用时忽略所有的curl传递给php进行的信号。在SAPI多线程传输时此项被默认启用。     cURL 7.10时被加入。
//      CURLOPT_POST=>false,//    启用时会发送一个常规的POST请求，类型为：application/x-www-form-urlencoded，就像表单提交的一样。 
//      CURLOPT_PUT=>false,//     启用时允许HTTP发送文件，必须同时设置CURLOPT_INFILE和CURLOPT_INFILESIZE。 
//      CURLOPT_TRANSFERTEXT=>false,//    启用后对FTP传输使用ASCII模式。对于LDAP，它检索纯文本信息而非HTML。在Windows系统上，系统不会把STDOUT设置成binary模式。   
//      CURLOPT_UNRESTRICTED_AUTH=>true,//    在使用CURLOPT_FOLLOWLOCATION产生的header中的多个locations中持续追加用户名和密码信息，即使域名已发生改变。    
//      CURLOPT_UPLOAD=>false,//  启用后允许文件上传。 
//      CURLOPT_VERBOSE =>true,// 启用时会汇报所有的信息，存放在STDERR或指定的CURLOPT_STDERR中。
    );
    private     $headers = array();
    private     $requests = array();
    private     $requestMap = array();
    /*********************
        构造一个callback的函数
    ********************/
    function __construct($callback = null) {
        $this->callback = $callback;
    }
 
    /********************************************************************
     重载 __get的方法
     *******************************************************************/
     public function __get($name) {
        return (isset($this->{$name})) ? $this->{$name} : null;
    }
 
    /*********************************************************************
     重载 __set的方法
     *******************************************************/
    public function __set($name, $value) {
        // 增加一个设置到headers
        if ($name == "options" || $name == "headers") {
            $this->{$name} = $value + $this->{$name};
        } else {
            $this->{$name} = $value;
        }
        return true;
    }
    //增加一个请求
     public function add($request) {
        $this->requests[] = $request;
        return true;
    }
 
 
    public function request($url, $method = "GET", $post_data = null, $headers = null, $options = null) {
        $this->requests[] = new request_setting($options);
        return true;
    }
 
    public function get($url, $headers = null, $options = null) {
        return $this->request($url, "GET", null, $headers, $options);
    }
 
    public function post($url, $post_data = null, $headers = null, $options = null) {
        return $this->request($url, "POST", $post_data, $headers, $options);
    }
 
    private function single_curl() {
        $ch = curl_init();  //初始化
        $request = array_shift($this->requests);//把第一个单元移出并作为结果
        $options = $this->get_options($request);//获得该单元的设置
        curl_setopt_array($ch, $options);//批设置
        $output = curl_exec($ch);
        $curl_info = curl_getinfo($ch);
 
        if ($this->callback) {
            $callback = $this->callback;
            if (is_callable($this->callback)) {
                call_user_func($callback, $output, $curl_info, $request);
            }
        }
        else
            return $output;
        return true;
    }
 
   
    private function rolling_curl($thread_size = null) {
        if ($thread_size){
            $this->thread_size = $thread_size;
        }
      
        if (count($this->requests) < $this->thread_size){
            $this->thread_size = count($this->requests);
        }
        if ($this->thread_size < 2) {
            $errorinfo = '线程大小必须大于 1!!!!';
            throw new Exception($errorinfo);
        }
        $queue = curl_multi_init();
 
        //在线程里开始增加任务队列
        for ($i = 0; $i < $this->thread_size; $i++) {
            $ch = curl_init();
            $options = $this->get_options($this->requests[$i]);
            curl_setopt_array($ch, $options);//获得设置
            curl_multi_add_handle($queue, $ch);//添加进去
            $key = (string) $ch;
            $this->requestMap[$key] = $i;
        }
        do {
            while (($statu_run_muti_exec = curl_multi_exec($queue, $active)) == CURLM_CALL_MULTI_PERFORM) ;
            if ($statu_run_muti_exec != CURLM_OK){  break;  }
            // 发现完成的一个请求，进行处理
            while ($done = curl_multi_info_read($queue)) {
                $curl_info = curl_getinfo($done['handle']);
                $output = curl_multi_getcontent($done['handle']);
                $callback = $this->callback;
                if (is_callable($callback)){
                    $key = (string) $done['handle'];
                    $request = $this->requests[$this->requestMap[$key]];
                    unset($this->requestMap[$key]);//这个销毁变量用得很帅
                    $callR = call_user_func($callback, $output, $curl_info, $request);
					//if($callR === true) return true;
                }
                //增加一个未处理的请求加入到一个已经完成的队列中
                if ($i < count($this->requests) && isset($this->requests[$i]) && $i < count($this->requests)) {
                    $ch = curl_init();
                    $options = $this->get_options($this->requests[$i]);
                    curl_setopt_array($ch, $options);
                    curl_multi_add_handle($queue, $ch);
                    $key = (string) $ch;
                    $this->requestMap[$key] = $i;
                    $i++;
                }
                curl_multi_remove_handle($queue, $done['handle']);
                //echo "done ";
                //print_r($queue);
                //print_r ($done);
            }
            // 这一步非常非常重要如果有一个完成后，要重新设置设置timeout的时间
            //这里很关键的一点，就是要保证第一次所有的线程里的请求最少有一个是有效的，否则就出现第一次所有的都没有效果，导致 $active=0,因此不执行下面的东西
            if ($active >0){
                curl_multi_select($queue, $this->timeout);
            }
 
        } while ($active);
        curl_multi_close($queue);
        return true;
    }
    public function execute($thread_size = null) {
        //判断thread_size的大小如果只有一个请求，就用单线程模式
        if (count($this->requests) == 1) {
            return $this->single_curl();
        } else {
            return $this->rolling_curl($thread_size);
        }
    }
	private function get_options($request) {

		return $request->options;

        $options = $this->__get('options');
        if (ini_get('safe_mode') == 'Off' || !ini_get('safe_mode')) {
//          $options[CURLOPT_FOLLOWLOCATION] = 1;
//          $options[CURLOPT_MAXREDIRS] = 5;
        }
        $headers = $this->__get('headers');
         
        if ($request->options) {
            $options = $request->options + $options;
        }
        $options[CURLOPT_URL] = $request->url;
        //下面分别对post选项与header选项进行设置
        if ($request->post_data){
            $options[CURLOPT_POST] = 1;
            $options[CURLOPT_POSTFIELDS] = $request->post_data;
        }
        if ($headers) {
            $options[CURLOPT_HEADER] = 0;
            $options[CURLOPT_HTTPHEADER] = $headers;
        }
        return $options;
    }
 
    public function __destruct() {
        unset($this->thread_size, $this->callback, $this->options, $this->headers, $this->requests);
    }
}
