<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.delicious.model.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	// 权限验证
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect("jsp/login.jsp");
		return;
		}
List list=(List)request.getAttribute("sysRecList");
SysRecommend sr1=(SysRecommend)list.get(0);
SysRecommend sr2=(SysRecommend)list.get(1);
SysRecommend sr3=(SysRecommend)list.get(2);
SysRecommend sr4=(SysRecommend)list.get(3);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>DeliciousHome</title>
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
				<a href="#" id="logo"><img src="images/logo.png" alt="LOGO"></a>
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
			<div id="adbox">
				<h1>Elegant Life, DeliciousWorld!</h1>
				<div class="frame">
					<div class="section">
						<p style="font-family:'微软雅黑'' ; font-size:18px">
							琴棋书画，柴米油盐，大雅大俗。人活不易，要活出一番境界来更是难上加难,
							格调意味着超拔、不羁于凡俗，如竹节临渊，美食天下邀您雅俗共品！
						</p>
					</div>
					<div class="section">
						<h2>美食广场</h2>
						<p>
							在这里你可以发现心仪的美食，品味高雅生活。。。
						</p>
					</div>
				</div>
			</div>
		</div>
		<div id="contents">
			<div id="articles">
				<div>
					<div class="frame">
						<img src="images/sushi9.png" alt="Img" height="213" width="218">
						<h2>招牌美食A</h2>
						<p>
							美食A的宣传标语，店长推荐
						</p>
						<a href="blog.html" class="more">Learn More</a>
					</div>
					<div class="frame">
						<img src="images/sushi10.png" alt="Img" height="192" width="189">
						<h2>招牌美食B</h2>
						<p>
							美食B的宣传标语，店长推荐
						</p>
						<a href="blog.html" class="more">Learn More</a>
					</div>
					<div id="featured">
						<ul>
							<li>
								<a href="#"> <img src="images/foodlogo/<%=sr1.getPicUrl() %>" alt="Img">
								<h3><%=sr1.getFoodName() %><br><font color="red">美食评分：<%=sr1.getFoodDesc() %></font></h3>
								</a>
							</li>
							<li>
								<a href="#"> <img src="images/foodlogo/<%=sr2.getPicUrl() %>" alt="Img">
								<h3><%=sr2.getFoodName() %><br><font color="red">美食评分：<%=sr2.getFoodDesc() %></font></h3>
								</a>				
							</li>
							<li>
								<a href="#"> <img src="images/foodlogo/<%=sr3.getPicUrl() %>" alt="Img">
								<h3><%=sr3.getFoodName() %><br><font color="red">美食评分：<%=sr3.getFoodDesc() %></font></h3>
								</a>
							</li>
							<li>
								<a href="#"> <img src="images/foodlogo/<%=sr4.getPicUrl() %>" alt="Img">
								<h3><%=sr4.getFoodName() %><br><font color="red">美食评分：<%=sr4.getFoodDesc() %></font></h3>
								</a>
								
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="dummy">
			</div>
		</div>
		<div id="footer">
			<div class="header">
<!-- 				<div class="body"> -->
<!-- 					<ul> -->
<!-- 						<li> -->
<!-- 							<h4>合作伙伴</h4> -->
<!-- 							<span>&gt; <a href="#header">百度外卖</a></span> <span>&gt; <a href="#header">饿了吗</a></span> <span>&gt; <a href="#header">美团外卖</a></span> -->
<!-- 						</li> -->
<!-- 							<li> -->
<!-- 							<h4>合作伙伴</h4> -->
<!-- 							<span>&gt; <a href="#header">百度外卖</a></span> <span>&gt; <a href="#header">饿了吗</a></span> <span>&gt; <a href="#header">美团外卖</a></span> -->
<!-- 						</li> -->
<!-- 							<li> -->
<!-- 							<h4>合作伙伴</h4> -->
<!-- 							<span>&gt; <a href="#header">百度外卖</a></span> <span>&gt; <a href="#header">饿了吗</a></span> <span>&gt; <a href="#header">美团外卖</a></span> -->
<!-- 						</li> -->
							
<!-- 					</ul> -->
<!-- 				</div> -->
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
