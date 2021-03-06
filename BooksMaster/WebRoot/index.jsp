<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="daos.SearchResultDao" %>
<%@ page import="beans.Document" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"></link>
    <link rel="stylesheet" href="css/reader.css" type="text/css"></link>
    
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/reader.js"></script>
  
   <script type="text/javascript" src="js/modernizr2.js"></script>
    
    </head>
  
  <body class="backstretch" >
	<%
		String book=request.getParameter("sear");
		Document docss=null;
		SearchResultDao docDao=new SearchResultDao();
		ArrayList docs=docDao.searchResult(book);
		
	%>
	<div id="top" style="">
		<div>欢迎您，亲爱的读者&nbsp;<%=session.getAttribute("name") %>&nbsp;!</div>
		<div><a href="login.jsp" class="top">退出</a></div>
	</div>
	<div id="nav">
		
		<ul>
			<li><a href="index.jsp"><span class="box"><span class="font">搜索</span><span class="back">搜索</span></span></a></li>
			<li><a href="resourse.jsp"><span class="box"><span class="font">资源</span><span class="back">资源</span></span></a></li>
			<li><a href="me.jsp"><span class="box"><span class="font">我的</span><span class="back">我的</span></span></a></li>
			<li><a href="recom.jsp"><span class="box"><span class="font">推荐</span><span class="back">推荐</span></span></a></li>
		</ul>
	</div>
	
	<div id="body"  >
		<form id="indexSearchForm" action="index.jsp" method="post">
			<input type="text" id="search" name="sear">
			<input type="button" id="sub" name="sub" value="搜书">
		</form>

		<!-- 搜索输出结果 -->
		<% if(book!=null){%>
		<table id="searchBookResult">
			<tr>
				<td>书名</td>
				<td>作者</td>
				<td>出版社</td>
				<td>书库</td>
				<td>定价</td>
				<td>可借数</td>
				<td>借阅</td>
			</tr>
		<%} %>
			<%
				for(int i=0;i<docs.size();i++){
					if(book!=null){docss=(Document)docs.get(i);}//docs是一个动态数组，得到一组数据，利用docss进行多行输出
			 %>
			 <tr>
			 	<td><% if(docss!=null){out.print(docss.getTitle());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getAuthor());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getPublisher());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getStack());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getPrice());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getLeftCount());} %></td>
			 	<td><a href="servlet/LendServlet?style=1&&doc=<% if(docss!=null){out.print(docss.getId());} %>">借阅</a></td>
			 </tr>
			 <%} %>
		<% if(docss!=null){%></table><%} %>
	</div>
	


  </body>
  <script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="js/backstretch.js"></script>

 <script>
      $(".backstretch").backstretch([
        "backgrounds/wg_blurred_backgrounds_8.jpg",
        "backgrounds/wg_blurred_backgrounds_5.jpg",
        "backgrounds/wg_blurred_backgrounds_3.jpg",
        "backgrounds/wg_blurred_backgrounds_1.jpg",
        "backgrounds/wg_blurred_backgrounds_2.jpg",
        "backgrounds/wg_blurred_backgrounds_4.jpg",
        "backgrounds/wg_blurred_backgrounds_6.jpg",
        "backgrounds/wg_blurred_backgrounds_7.jpg",
        "backgrounds/wg_blurred_backgrounds_9.jpg",
      ], {
        duration: 3000,
        fade: 'slow'
      });
    </script>
</html>
