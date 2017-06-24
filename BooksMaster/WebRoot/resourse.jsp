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
    
    <title>资源</title>
    
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
	
	<div id="body">
   <form action="servlet/DocInsert" style="background-color:transparent;">
  <h1 align="center">文献信息</h1>
  <div>
    <%
    	DocumentDao docDao=new DocumentDao();
    	ArrayList docs=docDao.searchAllBooks();
     %>
     <table  class="pub_table" >
     	<tr>
     		<td>编号</td>
     		<td>书名</td>
     		<td>作者</td>
     		<td>出版社</td>
     		<td>单价</td>
     		<td>所在书库</td>
     		<td>藏书量</td>
     		<td>&nbsp操&nbsp作&nbsp</td>
     		
 
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
     		<td><a href="servlet/LendServlet?style=1&&doc=<%=docss.getId() %>" >借阅</a></td>
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
			<a href="javascript:null;" class="footer">关于我们</a> | 
    		<a href="javascript:null;" class="footer">关于本站</a> | 
    		<a href="javascript:null;" class="footer">联系我们</a> | 
    		<a href="javascript:null;" class="footer">免责声明</a><br /><br />
    		本站编写组<br /><br /><br>
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
