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
    
    <title>��ҳ</title>
    
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
		<div>��ӭ�����װ��Ķ���&nbsp;<%=session.getAttribute("name") %>&nbsp;!</div>
		<div><a href="login.jsp" class="top">�˳�</a></div>
	</div>
	<div id="nav">
		
		<ul>
			<li><a href="index.jsp"><span class="box"><span class="font">����</span><span class="back">����</span></span></a></li>
			<li><a href="resourse.jsp"><span class="box"><span class="font">��Դ</span><span class="back">��Դ</span></span></a></li>
			<li><a href="me.jsp"><span class="box"><span class="font">�ҵ�</span><span class="back">�ҵ�</span></span></a></li>
			<li><a href="recom.jsp"><span class="box"><span class="font">�Ƽ�</span><span class="back">�Ƽ�</span></span></a></li>
		</ul>
	</div>
	
	<div id="body"  >
		<form id="indexSearchForm" action="index.jsp" method="post">
			<input type="text" id="search" name="sear">
			<input type="button" id="sub" name="sub" value="����">
		</form>

		<!-- ���������� -->
		<% if(book!=null){%>
		<table id="searchBookResult">
			<tr>
				<td>����</td>
				<td>����</td>
				<td>������</td>
				<td>���</td>
				<td>����</td>
				<td>�ɽ���</td>
				<td>����</td>
			</tr>
		<%} %>
			<%
				for(int i=0;i<docs.size();i++){
					if(book!=null){docss=(Document)docs.get(i);}//docs��һ����̬���飬�õ�һ�����ݣ�����docss���ж������
			 %>
			 <tr>
			 	<td><% if(docss!=null){out.print(docss.getTitle());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getAuthor());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getPublisher());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getStack());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getPrice());} %></td>
			 	<td><% if(docss!=null){out.print(docss.getLeftCount());} %></td>
			 	<td><a href="servlet/LendServlet?style=1&&doc=<% if(docss!=null){out.print(docss.getId());} %>">����</a></td>
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
