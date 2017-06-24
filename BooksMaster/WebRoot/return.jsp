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
    
    <title>����</title>
    
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
		<div>��ӭ�����װ��Ķ���&nbsp;<%=session.getAttribute("name") %>&nbsp;!</div>
		<div><a href="login.jsp" class="top">�˳�</a></div>
	</div>
	<div id="nav">
		<img alt="no" src="imgs/log.png"></img>
		<ul>
			<li><a href="index.jsp"><span class="box"><span class="font">����</span><span class="back">����</span></span></a></li>
			<li><a href="return.jsp"><span class="box"><span class="font">����</span><span class="back">����</span></span></a></li>
			<li><a href="me.jsp"><span class="box"><span class="font">�ҵ�</span><span class="back">�ҵ�</span></span></a></li>
			<li><a href="recom.jsp"><span class="box"><span class="font">�Ƽ�</span><span class="back">�Ƽ�</span></span></a></li>
		</ul>
	</div>
	
	<div id="body">
		<!-- ���������� -->
		<table class="pub_table">
			<tr>
				<td>����</td>
				<td>����</td>
				<td>������</td>
				<td>���</td>
				<td>����</td>
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
			 	<td><a href="servlet/LendServlet?style=2&&doc=<%=lendss.getId() %>">����</a></td>
			 </tr>
			 <%} %>
			 </table>
	</div>
	
	<div id="footer">
		<div>
			<a href="javascript:null;" class="footer">��������</a> | 
    		<a href="javascript:null;" class="footer">���ڱ�վ</a> | 
    		<a href="javascript:null;" class="footer">��ϵ����</a> | 
    		<a href="javascript:null;" class="footer">��������</a><br /><br />
    		��վ��д��<br /><br /><br>
    	</div>
		
	</div>
  </body>
</html>
