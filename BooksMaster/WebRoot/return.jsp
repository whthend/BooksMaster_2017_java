<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="daos.ReturnDao" %>
<%@ page import="beans.Document" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>还书</title>
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"></link>
    <link rel="stylesheet" href="css/reader.css" type="text/css"></link>
    
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/reader.js"></script>
  
  
    
    </head>
  
  <body>
	<%
		Document lendss=null;
		ReturnDao returnDao=new ReturnDao();
		ArrayList lends=returnDao.returnBook();
		
	%>
	<div id="top">
		<div>欢迎您，亲爱的读者&nbsp;<%=session.getAttribute("name") %>&nbsp;!</div>
		<div><a href="login.jsp" class="top">退出</a></div>
	</div>
	<div id="nav">
		<img alt="no" src="imgs/log.png"></img>
		<ul>
			<li><a href="index.jsp"><span class="box"><span class="font">搜索</span><span class="back">搜索</span></span></a></li>
			<li><a href="return.jsp"><span class="box"><span class="font">还书</span><span class="back">还书</span></span></a></li>
			<li><a href="me.jsp"><span class="box"><span class="font">我的</span><span class="back">我的</span></span></a></li>
			<li><a href="recom.jsp"><span class="box"><span class="font">推荐</span><span class="back">推荐</span></span></a></li>
		</ul>
	</div>
	
	<div id="body">
		<!-- 搜索输出结果 -->
		<table class="pub_table">
			<tr>
				<td>书名</td>
				<td>作者</td>
				<td>出版社</td>
				<td>书库</td>
				<td>还书</td>
			</tr>
			<%
				for(int i=0;i<lends.size();i++){
					lendss=(Document)lends.get(i);
			%>
			 <tr>
			 	<td><%=lendss.getTitle() %></td>
			 	<td><%=lendss.getAuthor() %></td>
			 	<td><%=lendss.getPublisher() %></td>
			 	<td><%=lendss.getStack() %></td>
			 	<td><a href="servlet/LendServlet?style=2&&doc=<%=lendss.getId() %>">还书</a></td>
			 </tr>
			 <%} %>
			 </table>
	</div>
	
	<div id="footer">
		<div>
			<a href="javascript:null;" class="footer">关于我们</a> | 
    		<a href="javascript:null;" class="footer">关于本站</a> | 
    		<a href="javascript:null;" class="footer">联系我们</a> | 
    		<a href="javascript:null;" class="footer">免责声明</a><br /><br />
    		本站编写组<br /><br /><br>
    	</div>
		
	</div>
  </body>
</html>
