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
List list=(List)request.getAttribute("searchlist");
Food []food=new Food[list.size()];
for(int i=0;i<list.size();i++){
   food[i]=(Food)list.get(i);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>美食搜索</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/searchstyle.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  <h1>美食天下搜索</h1>
<h3>简单、易用、方便、快捷</h3>

<section class="list-wrap">
  <label for="search-text">搜索列表内容</label>
  <input type="text" id="search-text" placeholder="美食大搜索" class="search-box">
  <span class="list-count"></span>
	<ul id="list">
	
	   <%  for(int i=0;i<list.size();i++){%>
	  <li id="<%=food[i].getId() %>" class="in"><a href="foodSearch?id=<%=food[i].getId()%>"><%=food[i].getFoodName() %></a></li>
	  <%} %>
	  <span class="empty-item">无数据</span>
	</ul>
</section>

<script type="text/javascript" src='js/jquery.min.js'></script>
<script type="text/javascript" src="js/index.js"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗 不支持IE8及以下浏览器。</p>
</div>
</body>
</html>
