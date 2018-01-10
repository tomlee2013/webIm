<?php  
    class Page {  
          private $total;      //总记录  
          private $pagesize;    //每页显示多少条  
          private $limit;          //limit  
          private $page;           //当前页码  
          private $pagenum;      //总页码  
          private $url;           //地址  
          private $bothnum;      //两边保持数字分页的量  
    
      //构造方法初始化  
      public function __construct($_total, $_pagesize) {  
         $this->total = $_total ? $_total : 1;  
         $this->pagesize = $_pagesize;  
          $this->pagenum = ceil($this->total / $this->pagesize);  
         $this->page = $this->setPage();  
         $this->limit = "LIMIT ".($this->page-1)*$this->pagesize.",$this->pagesize";  
         $this->url = $this->setUrl();  
         $this->bothnum = 2;  
      }  
    
      //拦截器  
      public function __get($_key) {  
         return $this->$_key;  
      }  
    
      //获取当前页码  
      private function setPage() {  
         if (!empty($_GET['page'])) {  
                if ($_GET['page'] > 0) {  
                   if ($_GET['page'] > $this->pagenum) {  
                          return $this->pagenum;  
                   } else {  
                          return $_GET['page'];  
                   }  
                } else {  
                   return 1;  
                }  
         } else {  
                return 1;  
         }  
      }   
    
      //获取地址  
      private function setUrl() {  
         $_url = $_SERVER["REQUEST_URI"];  
         $_par = parse_url($_url);  
         if (isset($_par['query'])) {  
                parse_str($_par['query'],$_query);  
                unset($_query['page']);  
                $_url = $_par['path'].'?'.http_build_query($_query);  
		 }else{
		 	$_url = $_url.'?';
		 }  
         return $_url;  
      } //数字目录  
      private function pageList() {  
         /*for ($i=$this->bothnum;$i>=1;$i--) {  
            $_page = $this->page-$i;  
            if ($_page < 1) continue;  
                $_pagelist .= ' <a style="display:none;" href="'.$this->url.'&page='.$_page.'">'.$_page.'</a> ';  
         } */ 

         $_pagelist1 .= ' <div class="pagenav-cur"><div class="pagenav-text" style="padding:0 0.2rem"> <span>'.$this->page.'/'.$this->pagenum.'</span> <i></i>  ';
         $_pagelist1 .= '<select name="page" class="pagenav-select" onchange="window.location.href=this.options[this.selectedIndex].value">';
         for($i=0;$i<=$this->pagenum;$i++){
          if ($i == 0) {
              $_pagelist1 .= '<option style="display:none;" value="'.$this->url.'&page='.$i.'">'.$i.'</option>';
          }else{
              $_pagelist1 .= '<option value="'.$this->url.'&page='.$i.'">'.$i.'</option>';
          }
         }
         $_pagelist1 .= '</select></div></div>';

         $_pagelist = $_pagelist1;

         /*for ($i=1;$i<=$this->bothnum;$i++) {  
            $_page = $this->page+$i;  
                if ($_page > $this->pagenum) break;  
                $_pagelist .= ' <a style="display:none;" href="'.$this->url.'&page='.$_page.'">'.$_page.'</a> ';  
         }  */
         return $_pagelist;  
      }    
    
      //首页  
      private function first() {  
         if ($this->page > $this->bothnum+1) {  
                return '<div class="pagenav-wrapper" id="J_PageNavWrap" style=""><div class="pagenav-content"><div class="pagenav" id="J_PageNav" style="display:flex; text-align:center;"><div class="p-prev"> <a href="'.$this->url.'">首页</a></div>';  
         }
         return '<div class="pagenav-wrapper" id="J_PageNavWrap" style=""><div class="pagenav-content"><div class="pagenav" id="J_PageNav" style="display:flex; text-align:center;"><div class="p-prev"> <a href="'.$this->url.'">首页</a></div>';  
      }  
    
      //上一页  
      private function prev() {  
         if ($this->page == 1) {  
                return '<div class="p-prev p-gray"><span class="disabled">上一页</span></div>';  
         }  
         return ' <div class="p-prev"><a href="'.$this->url.'&page='.($this->page-1).'">上一页</a></div> ';  
      } 

         
    
      //下一页
      private function next() {
         if ($this->page == $this->pagenum) {
                return '<div class="p-prev p-gray"><span class="disabled">下一页</span></div>';
         }
         return ' <div class="p-prev"><a href="'.$this->url.'&page='.($this->page+1).'">下一页</a></div> ';
      }
    
      //尾页  
      private function last() {  
         if ($this->pagenum - $this->page > $this->bothnum) {  
                return '<div class="p-prev"><a href="'.$this->url.'&page='.$this->pagenum.'">末页</a></div></div></div></div>';  
         } 
         return '<div class="p-prev"><a href="'.$this->url.'&page='.$this->pagenum.'">末页</a></div></div></div></div>'; 
      }  
    
      //分页信息  
      public function showpage() {  
         $_page .= $this->first();  
         $_page .= $this->prev(); 
         $_page .= $this->pageList(); 
         $_page .= $this->next();   
         $_page .= $this->last();   
         return $_page;  
      }  
 }  
?>  
