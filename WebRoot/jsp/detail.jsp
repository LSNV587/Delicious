<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List list=(List)request.getAttribute("foodDetail");
// 权限验证
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <meta charset="UTF-8">
	<title>DeliciousBlog</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<!--[if IE7]>
		<link rel="stylesheet" href="css/ie7.css" type="text/css">
	<![endif]-->

  </head>
  
  <body>
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
		</div>
		<div id="contents">
			<div id="blog">
				<div class="header">
					<div class="footer">
						<div class="body">
							<ul>
								<li>
									<span class="time"><%=list.get(10)%></span>
									<h2><%=list.get(3) %></h2>
									<a><img src="images/foodlogo/<%=list.get(1) %>" alt="Img"></a>
									<div>
									<table width="400px"  height="200px" border="1" ellpadding="0" cellspacing="0">
                                   <tr>
                                  <td width="50%">美食编号：<%=list.get(0) %></td>
                                  <td width="50%">所属商家：<%=list.get(2) %></td>
                                 </tr>
 								 <tr>
   								 <td>品名：<%=list.get(3) %></td>
    							<td>菜式：<%=list.get(4) %></td>
  								</tr>
  								<tr>
    							<td>口味：<%=list.get(5) %></td>
    							<td>菜系：<%=list.get(6) %></td>
 								</tr>
 								<tr>
    							<td>价格：<%=list.get(7) %></td>
    							<td>地址：<%=list.get(9) %></td>
  								</tr>
                                </table>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
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
