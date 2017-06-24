<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="daos.ReaderDao" %>
<%@ page import="beans.Reader" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>读者</title>
		
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"></link>
    <link rel="stylesheet" href="css/manage.css" type="text/css"></link>
    
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/manage.js"></script>
  	
	</head>
  <body>
  
  
	<div id="top">
		<div>欢迎您，&nbsp;<%=session.getAttribute("name") %>&nbsp;!</div>
		<div><a href="login.jsp" class="top">退出</a></div>
	</div>
	<div id="nav">
		<img alt="no" src="imgs/log.png"></img>
		<ul>
			<li><a href="document.jsp"><span class="box"><span class="font">文献</span><span class="back">文献</span></span></a></li>
			<li><a href="reader.jsp"><span class="box"><span class="font">读者</span><span class="back">读者</span></span></a></li>
			<li><a href="update.jsp"><span class="box"><span class="font">修改</span><span class="back">修改</span></span></a></li>
			<li><a href="about.jsp"><span class="box"><span class="font">关于</span><span class="back">关于</span></span></a></li>
		</ul>
	</div>
	<div id="body" class="backstretch">
  <h1 align="center">读者信息</h1>
  <div>
    <%
    	ReaderDao readerDao=new ReaderDao();
    	ArrayList readers=readerDao.reader();
     %>
     
     <form name="reader" action="servlet/readerInsert" method="post">
     <table class="pub_table" style="width: 60%;margin:auto">
     	<tr>
     		<td>读者账号</td>
     		<td>读者姓名</td>
     		<td>性别</td>
     		<td>密码</td>
     		<td>身份证号</td>
     		<td>电话号码</td>
     		<td>允借册数</td>
     		<td>&nbsp操&nbsp&nbsp作&nbsp</td>
     	</tr>
     	 <%
     		for(int i=0;i<readers.size();i++){
     		Reader readerss=(Reader)readers.get(i);	 
     	 %> 
     	 <tr>
     	 	<td><%=readerss.getPatronId() %></td>
     		<td><%=readerss.getName() %></td>
     		<td><%
     	         int a=Integer.parseInt(readerss.getGender());
     			if(a==1) out.println("男");
     			else out.println("女");
     		 %></td>
     		 <td>********</td>
     		<td><%=readerss.getId() %></td>
     		<td><%=readerss.getTel() %></td>
     		<td><%=readerss.getItemcounts() %></td>
     		<td><a href="servlet/readerInsert?style=1&&nam=<%=readerss.getPatronId() %>" >删除</a></td>
     	</tr> 
     	<%
     		}
     	 %>
   		<tr>
     		<td style="background-color:#999">读者账号自动生成</td>
     		<td><input name="name" type="text" ></td>
     		<td>男<input name="gender" type="radio" value="1" checked><input name="gender" type="radio" value="0">女</td>
     		<td><input name="pwd" type="password"></td>
     		<td><input name="id" type="text"></td>
     		<td><input name="tel" type="text"></td>
     		<td style="background-color:#999">3</td>
     		<td><input type="submit" value="添加"></td>
    	</tr>  
     	</td></</tr>
     </table></form>
  </div>
   </div>
   
   
   
   
   
   
   
   
   <div id="mfooter">
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
