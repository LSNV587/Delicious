<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="/IMUSoft/Backstage/js/html5.js"></script>
<script type="text/javascript" src="/IMUSoft/Backstage/js/respond.min.js"></script>
<script type="text/javascript" src="/IMUSoft/Backstage/js/PIE_IE678.js"></script>
<![endif]-->
<link href="/Delicious/css/H-ui.css" rel="stylesheet" type="text/css" />
<link href="/Delicious/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="/IMUSoft/Backstage/js/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录 - 管理员</title>
<style>
   #code{  
                color:#ffffff;/*字体颜色白色*/  
                background-color:#000000;     
                font-size:20pt;  
                font-family:"华康娃娃体W5";  
                padding:5px 35px 10px 35px;  
                margin-left:5%;       
                cursor:pointer;  
            }  
</style>
</head>
  <body onload="changeImg()">
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form action="../adminLogin" method="post" onsubmit="return check()">
      <div class="formRow user">
        <input id="" name="username" type="text" placeholder="账户" class="input_text input-big">
      </div>
      <div class="formRow password">
        <input id="" name="password" type="password" placeholder="密码" class="input_text input-big">
      </div>
      <div class="formRow yzm">
        <input id="vcode" class="input_text input-big" type="text" placeholder="验证码" onBlur="if(this.value==''){this.value='验证码:'}" onClick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
       <span id="code" title="看不清，换一张"></span> </div>
      <div class="formRow">
        <label for="online">
          <input type="checkbox" name="online" id="online" value="">
          使我保持登录状态</label>
      </div>
      <div class="formRow">
        <input name="" type="submit" class="btn radius btn-success btn-big" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
        <input name="" type="reset" class="btn radius btn-default btn-big" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
      </div>
    </form>
  </div>
</div>
<div class="footer">美食管理系统后台登陆</div>
<script type="text/javascript" src="/Delicious/js/jquery.min.js"></script>
<script type="text/javascript" src="/Delicious/js/H-ui.js"></script>

</body>
<script type="text/javascript">  
        var code;//声明一个变量用于存储生成的验证码  
        document.getElementById("code").onclick=changeImg;  
        function changeImg(){  
            //alert("换图片");  
            var arrays=new Array(  
                '1','2','3','4','5','6','7','8','9','0',  
                'a','b','c','d','e','f','g','h','i','j',  
                'k','l','m','n','o','p','q','r','s','t',  
                'u','v','w','x','y','z',  
                'A','B','C','D','E','F','G','H','I','J',  
                'K','L','M','N','O','P','Q','R','S','T',  
                'U','V','W','X','Y','Z'               
            );  
            code='';//重新初始化验证码  
            //alert(arrays.length);  
            //随机从数组中获取四个元素组成验证码  
            for(var i=0;i<4;i++){  
            //随机获取一个数组的下标  
                var r=parseInt(Math.random()*arrays.length);  
                code+=arrays[r];  
                //alert(arrays[r]);  
            }  
            //alert(code);  
            document.getElementById('code').innerHTML=code;//将验证码写入指定区域  
        }         
          
        //效验验证码(表单被提交时触发)  
        function check(){  
            //获取用户输入的验证码  
            var input_code=document.getElementById('vcode').value;  
            //alert(input_code+"----"+code);  
            if(input_code.toLowerCase()==code.toLowerCase())  
            {  
                //验证码正确(表单提交)  
                return true;  
            }  
            alert("请输入正确的验证码!");  
            //验证码不正确,表单不允许提交  
            return false;  
        }  
    </script>   
</html>

