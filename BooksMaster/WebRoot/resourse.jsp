<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="daos.DocumentDao" %>
<%@ page import="beans.Document" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Դ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"></link>
    <link rel="stylesheet" href="css/reader.css" type="text/css"></link>
    
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/reader.js"></script>
  
  
    
    </head>
  
  <body class="backstretch">
	<div id="top">
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
	
	<div id="body">
   <form action="servlet/DocInsert" style="background-color:transparent;">
  <h1 align="center">������Ϣ</h1>
  <div>
    <%
    	DocumentDao docDao=new DocumentDao();
    	ArrayList docs=docDao.searchAllBooks();
     %>
     <table  class="pub_table" >
     	<tr>
     		<td>���</td>
     		<td>����</td>
     		<td>����</td>
     		<td>������</td>
     		<td>����</td>
     		<td>�������</td>
     		<td>������</td>
     		<td>&nbsp��&nbsp��&nbsp</td>
     		
 
     	</tr>
     	 <%
     		for(int i=0;i<docs.size();i++){
     		Document docss=(Document)docs.get(i);
     		//out.println("a");
     		 
     	 %> 
     	 <tr>
     	 	<td><%=docss.getId() %></td>
     		<td><%=docss.getTitle() %></td>
     		<td><%=docss.getAuthor() %></td>
     		<td><%=docss.getPublisher() %></td>
     		<td><%=docss.getPrice() %></td>
     		<td><%=docss.getTitle() %></td>
     		<td><%=docss.getLeftCount() %></td>
     		<td><a href="servlet/LendServlet?style=1&&doc=<%=docss.getId() %>" >����</a></td>
     	</tr> 
     	<%
     		}
     		
     	 %>
     	  </table>
  </div>
    </form>


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
