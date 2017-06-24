<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"></link>
    <link rel="stylesheet" href="css/manage.css" type="text/css"></link>
    
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
  	<script type="text/javascript" src="js/manage.js"></script>

  </head>
  
  <body>
	<div id="top" >
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
	<div id="body" class="backstretch" >
		<form id="updateForm" action="servlet/UpdateServlet" method="post">
			<table style="position:absolute;left:50%;margin-left:-300px;top:68px;border-radius:8px;box-shadow:0 2px 15px #222;background-color:#dc9600;">
				<tr>
					<td style="text-align:right;width:300px;line-height:21px;">
						修改读者信息<input type="radio" id="updateReaderInput" name="updateStyle" value="1" checked /><br>
						账号:<br>
						姓名:<br>
						ID:<br>
						密码:<br>
						确认密码:<br>
						电话:<br>
						<input type="reset" value="重置" ><br>
					</td>
					<td style="text-align:left;width:300px;">
						<input type="radio" id="updateStaffInput" name="updateStyle" value="2" />修改员工信息<br>
						<input id="accountInput" type="text" name="account" />
						<input type="radio" name="gender" value="1" checked />男
						<input type="radio" name="gender" value="0" />女<br>
						<input type="text" name="name" /><br>
						<input id="idInput" type="text" name="id"><br>
						<input type="password" name="pwd" /><br>
						<input type="password"><br>
						<input type="text" name="tel" /><br>
						<input type="button" id="updateSubmit" value="提交"><br>
					</td>
				</tr>
			</table>
			
			
			
			
			
			<% 
				if(session.getAttribute("updateResult")!=null){
				int i=(Integer)session.getAttribute("updateResult");
					if(i==1){out.print("修改成功！");}
					else {out.print("修改失败！");}}
			 %>
		</form>
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
