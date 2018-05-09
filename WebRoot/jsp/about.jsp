<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
  <meta charset="UTF-8">
	<title>DeliciousAbout</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<!--[if IE7]>
		<link rel="stylesheet" href="css/ie7.css" type="text/css">
	<![endif]-->

  </head>
  
  <body>
   <div id="page">
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
			<div id="about">
				<ul>
					<li>
						<img src="images/sushi-chef1.png" alt="Img">
					</li>
					<li>
						<img src="images/sushi-chef2.png" alt="Img">
					</li>
					<li>
						<img src="images/sushi-chef3.png" alt="Img">
					</li>
				</ul>
				<div class="header">
					<div class="footer">
						<div class="body">
							<h2>设计灵感</h2>
							<p>
								请在这里写下你的设计灵感。。。请在这里写下你的设计灵感。。。请在这里写下你的设计灵感。。。请在这里写下你的设计灵感。。。请在这里写下你的设计灵感。。。请在这里写下你的设计灵感。。。请在这里写下你的设计灵感。。。请在这里写下你的设计灵感。。。
							</p>
							<h2>技术概要</h2>
							<p>
								请在这里写下技术概要。。。请在这里写下技术概要。。。请在这里写下技术概要。。。请在这里写下技术概要。。。请在这里写下技术概要。。。请在这里写下技术概要。。。请在这里写下技术概要。。。请在这里写下技术概要。。。请在这里写下技术概要。。。请在这里写下技术概要。。。
							</p>
							<h2>关于作者</h2>
							<p>
								介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。介绍下自己呗。。。
							</p>
							<h2>致谢</h2>
							<p>
								感谢你的导师，你的同学。。。感谢你的导师，你的同学。。。感谢你的导师，你的同学。。。感谢你的导师，你的同学。。。感谢你的导师，你的同学。。。感谢你的导师，你的同学。。。感谢你的导师，你的同学。。。
							</p>
							<br><br><br><br>
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
