<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="beans.Reader" %>
<%@ page import="daos.ReaderDao" %>
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
    
    <title>我的</title>
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"></link>
    <link rel="stylesheet" href="css/me.css" type="text/css"></link>
    
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/reader.js"></script>
  
  
    
    </head>
  
  <body class="backstretch">
  		<%
  			ReaderDao readerDao=new ReaderDao();
  			ArrayList readers=readerDao.reader();
  			Reader readerss=(Reader)readers.get(0);
  			
  			
			ReturnDao returnDao=new ReturnDao();
			ArrayList lends=returnDao.returnBook();
  		 %>
  
  
  
  
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
		<div id="box">
			<div id="font">
				<h2 style="color:#fff;">我的借阅</h2>
		<!-- 搜索输出结果 -->
		<table>
			<tr>
				<td>书名</td>
				<td>作者</td>
				<td>书库</td>
				<td>还书</td>
			</tr>
			<%
				for(int i=0;i<lends.size();i++){
					Document lendss=(Document)lends.get(i);
			%>
			 <tr>
			 	<td><%=lendss.getTitle() %></td>
			 	<td><%=lendss.getAuthor() %></td>
			 	<td><%=lendss.getStack() %></td>
			 	<td><a href="servlet/LendServlet?style=2&&doc=<%=lendss.getId() %>">还书</a></td>
			 </tr>
			 <%} %>
			 </table>
			</div>
			<div id="back">
				
				<h2 style="color:#fff;">我的信息</h2>
				<table>
					<tr>
						<td>账号</td>
						<td>姓名</td>
						<td>性别</td>
						<td>手机号</td>
						<td>允借册数</td>
					</tr>
					<tr>
						<td><%=readerss.getPatronId() %></td>
						<td><%=readerss.getName() %></td>
						<td><% if(Integer.parseInt(readerss.getGender())==1) out.print("男");else out.print("女"); %></td>
						<td><%=readerss.getTel() %></td>
						<td><%=readerss.getItemcounts() %></td>
					</tr>
				</table>
				</div>
			<div id="left">
				<h2 style="color:#fff;">推荐链接</h2>
				<marquee direction="up" onmouseover="this.stop()" onmouseout="this.start()" behavior="scroll" scrollamount="5" loop="-1">
					
					<a href="javascript:null;" class="marquee">百度</a><br><br>
					<a href="javascript:null;" class="marquee">谷歌</a><br><br>
					<a href="javascript:null;" class="marquee">腾讯</a><br><br>
					<a href="javascript:null;" class="marquee">网易</a><br><br>
					<a href="javascript:null;" class="marquee">360</a><br><br>
					<a href="javascript:null;" class="marquee">新浪</a>
				</marquee>
			
			</div>
			<div id="right">
				<h2 style="color:#fff;">投诉建议</h2>
				<table>
					<tr>
						<td>联系本站编写组：<br>
							我要提建议：<br>
							我要投诉：<br>
						</td>
						<td>
							asdfas@163.com<br>
							asdfase@126.com<br>
							asreer@qq.com<br>
						</td>
					</tr>
				</table>
			</div>
			<div id="up">up</div>
			<div id="down">down</div>
		</div>
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
