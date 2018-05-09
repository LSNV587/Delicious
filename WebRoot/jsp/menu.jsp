<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.delicious.model.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 权限验证
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect("index.jsp");
		return;
	}
List list=(List)request.getAttribute("foodlist");
Food []food=new Food[list.size()];
for(int i=0;i<list.size();i++){
   food[i]=(Food)list.get(i);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <meta charset="UTF-8">
	<title>DeliciousMenu</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<!--[if IE7]>
		<link rel="stylesheet" href="css/ie7.css" type="text/css">
	<![endif]-->
<style>
 .dow{float:left;margin:0 15px;margin-bottom:10px;display:block;width:160px;height:45px; line-height:52px; text-align:center; font-family:arial,verdana,sans-serif, '新宋体'; font-weight:bold; font-size:18px; background:#F9AA46;color:#fff; text-decoration:none; cursor:pointer}
.dow:hover{background:#F88E8B;}
.dow:active{background:#F88E8B;}
</style>
<style type="text/css">
*{margin:0;padding:0; font-family:"微软雅黑"}
ul{ list-style:none;}
 /*用户评分*/
.pingfenxitong{
padding:15px 0;
position:absolute;
width:500px;
height:150px;
background: rgba(255,255,255, 0.7);
right:400px;
top:500px;
z-index:1000;
	}
.pingfenList{
	float:left;
	width:500px;
	padding-right:20px;
	}
.pfxtTitle{
	font-weight:bold;
	font-size:1.2em;
	margin-left:5px;
	padding:4px 0;
	}
.pfxtText{
    margin-left:5px;
	line-height:25px;
	}
.pfxtFen{

	margin:10px 0px;
	}
.pfxtFen li{
	float:left;
	width:98px;
	height:30px;
	text-align:center;
	line-height:30px;
	border:#ddd 1px solid;
	background:#f1f1f1;
	cursor:pointer;
	}
.pfxtFen li.pfxtCur{
	background:#308A95;
	color:#fff;
	border:#308A95 1px solid;
	}
</style>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
var rate='0';
var username="";
var foodid="";
var foodname="";
$(function(){
	//简洁用户评分代码
	$(".pfxtFen li").click(function(){
		$(this).addClass("pfxtCur");
		$(this).prevAll().addClass("pfxtCur");
		$(this).nextAll().removeClass("pfxtCur");
	});
		
	$(".pfxtFen li").dblclick(function(){
		$(".pfxtFen li").removeClass("pfxtCur");
	});
	
})
function showPingFen(){
document.getElementById("rate").style.display="";
document.getElementById("pfxtText").innerHTML=str;
alert(foodid);
alert(foodname);


}
function closePingFen(){
document.getElementById("rate").style.display="none";
}
function saverate(){
alert("您的评分为"+rate+"分,已完成!");
document.getElementById("rate").style.display="none";
}
</script>
  </head>
  
  <body>
  
<div id="rate" class="pingfenxitong" style="display:none">

	<div class="pingfenList">
	
		<div class="pfxtTitle">评分：</div>
		<div id="pfxtText" class="pfxtText"></div>
		<ul class="pfxtFen" title="双击取消评分">
			<li value="1">1</li>
			<li value="2">2</li>
			<li value="3">3</li>
			<li value="4">4</li>
			<li value="5">5</li>
		</ul><!--pfxtMid/-->
		<script>
		$(document).ready(function(){
        $("li").click(function(){
           rate=$(this).val();
         });
        });
		</script>
	</div><!--pingfenList/-->
	
	<div style="float:right;margin:50px 25px "><a  onclick="closePingFen();">取消</a></div>
	<div style="float:right;margin:50px 20px "><a  onclick="saverate(rate);">确定</a></div>

</div><!--pingfenxitong/-->
   <div id="page">
   <div style="float:right"  ><font color="white" >欢迎您：</font>&nbsp;<font color="red" >${currentUser.nickName }</font></div>
		<div id="header">
			<div id="sidebar">
				<a href="index.html" id="logo"><img src="images/logo.png" alt="LOGO"></a>
				<div id="navigation">
				<ul>
						<li class="selected">
							<a href="index">主页</a>
						</li>
						<li class="menu">
							<a href="foodMenu">菜单</a>
							<div class="sub">
<!-- 								<a href="menu.html">Lorem Ipsum</a> <a href="menu.html">Dolor Sit Amet</a> <a href="menu.html">Nulla Pretium</a> <a href="menu.html" class="last-child">Curabitur</a> -->
							</div>
							<span></span>
						</li>
						<li>
							<a href="Blog">博文</a>
						</li>
						<li class="last">
							<a href="About">关于</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="menu-adbox">
				<div class="details">
					<h1>美食菜单</h1>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet nulla ac purus iaculis quis fermentum lacus sodales
					</p>
				</div>
			</div>
		</div>
		<div id="contents">
			<a href="foodMenu?flag=distance" class="dow">距离排序 ↑</a><a href="foodMenu?flag=price" class="dow">价格排序 ↑</a><a href="foodMenu?flag=score" class="dow">好评排序</a><a href="foodSearch" class="dow">模糊搜索</a><a href="Blog" class="dow">为您推荐</a>
			<br>
			<ul id="gallery">
			<%
			      for(int i=0;i<list.size();i++){
			 %>
				<li>
				<form id="pfForm" action="#" method="post">
				     <input type="hidden"  id="foodid" value="<%=food[i].getId() %>" >
				     <input type="hidden"  id="foodname" value="<%=food[i].getFoodName() %>" >
					<a onClick="showPingFen();"> <img src="images/foodlogo/<%=food[i].getFoodPicture() %>" title="<%=food[i].getRemark() %>"> <b><br><%=food[i].getFoodName() %></b><br>【参考价】：<%=food[i].getFoodPrice() %></a>
                </form>
				</li>
				<% } %>
			</ul>
		</div>
		<div id="footer">
			<div class="header">
				<div class="body">
					<ul>
						<li>
							<h4>Lorem Ipsum</h4>
							<span>&gt; <a href="#header">Dolor Sit Amet</a></span> <span>&gt; <a href="#header">Lorem Ipsum</a></span> <span>&gt; <a href="#header">Nulla Pretium</a></span>
						</li>
						<li>
							<h4>Dolor Sit Amet</h4>
							<span>&gt; <a href="#header">Dolor Sit Amet</a></span> <span>&gt; <a href="#header">Lorem Ipsum</a></span> <span>&gt; <a href="#header">Nulla Pretium</a></span>
						</li>
						<li>
							<h4>Nulla Pretium</h4>
							<span>&gt; <a href="#header">Dolor Sit Amet</a></span> <span>&gt; <a href="#header">Lorem Ipsum</a></span> <span>&gt; <a href="#header">Nulla Pretium</a></span>
						</li>
						<li class="last-child">
							<h4>Curabitur</h4>
							<span>&gt; <a href="#header">Dolor Sit Amet</a></span> <span>&gt; <a href="#header">Lorem Ipsum</a></span> <span>&gt; <a href="#header">Nulla Pretium</a></span>
						</li>
					</ul>
				</div>
				<div class="footer">
					<div id="connect">
						<a href="#" target="_blank" class="facebook"></a> <a href="#" target="_blank" class="twitter"></a> <a href="#" target="_blank" class="googleplus"></a> <a href="http://#/go/vimeo/" target="_blank" class="vimeo"></a>
					</div>
					<p>
						Copyright 2017.11 内蒙古大学计算机学院.
					</p>
				</div>
			</div>
			
		</div>
	</div>
  </body>
</html>
