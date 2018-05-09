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
									<span class="time">2017-11-30</span>
									<h2>玫瑰米酒蛋花羹</h2>
									<a><img src="images/foodlogo/玫瑰米酒蛋花羹.jpg" alt="Img"></a>
									<div>
										<p>
											米酒是以大米、糯米为原料，加麦曲、酒母边糖化边发酵的一种发酵酒。米酒经过酿制，营养成分更易于人体吸收，是中老年人、孕产妇和身体虚弱者补气养血之佳品；它可以促进食欲、帮助消化、温寒补虚、提神解乏、解渴消暑、促进血液循环、润肤等功效；还具有活血通经、散寒消积等。
										</p>
<!-- 										<a href="blog.html" class="more">Read More...</a> -->
									</div>
								</li>
								<li>
									<span class="time">2017-11-30</span>
									<h2>鳕鱼豆腐羹</h2>
									<a><img src="images/foodlogo/鳕鱼豆腐羹.jpg" alt="Img"></a>
									<div>
										<p>
											鳕鱼含丰富蛋白质、维生素A、维生素D、钙、镁、硒等营养元素，营养丰富、肉味甘美，口感鲜美嫩滑。加上营养丰富的豆腐，是一道老少皆宜的补钙佳品
										</p>
<!-- 										<a href="blog.html" class="more">Read More...</a> -->
									</div>
								</li>
								<li>
									<span class="time">2017-11-30</span>
									<h2>凉拌双耳</h2>
									<a><img src="images/foodlogo/凉拌双耳.jpg" alt="Img"></a>
									<div>
										<p>
											银耳营养丰富，多食有益身心健康。银耳中的膳食纤维可助胃肠蠕动，减少脂肪吸收，从而达到减肥的效果
                                           黑木耳中铁的含量极为丰富，故常吃木耳能养血驻颜，令人肌肤红润，容光焕发，并可防治缺铁性贫血。
                                           黑木耳中的胶质可把残留在人体消化系统内的灰尘、杂质吸附集中起来排出体外，从而起到清胃涤肠的作用
										</p>
<!-- 										<a href="blog.html" class="more">Read More...</a> -->
									</div>
								</li>
							</ul>
							<div class="pages">
								<a href="jsp/blog.jsp">Prev</a> <a href="jsp/blog.jsp">1</a> <a href="jsp/blog.jsp">2</a> <a href="jsp/blog.jsp">3</a> <a href="jsp/blog.jsp">4</a> <a href="jsp/blog.jsp">5</a> <a href="jsp/blog.jsp">6</a> <a href="jsp/blog.jsp">Next</a>
							</div>
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
