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
    
    <title>�ҵ�</title>
    
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
		<div id="box">
			<div id="font">
				<h2 style="color:#fff;">�ҵĽ���</h2>
		<!-- ���������� -->
		<table>
			<tr>
				<td>����</td>
				<td>����</td>
				<td>���</td>
				<td>����</td>
			</tr>
			<%
				for(int i=0;i<lends.size();i++){
					Document lendss=(Document)lends.get(i);
			%>
			 <tr>
			 	<td><%=lendss.getTitle() %></td>
			 	<td><%=lendss.getAuthor() %></td>
			 	<td><%=lendss.getStack() %></td>
			 	<td><a href="servlet/LendServlet?style=2&&doc=<%=lendss.getId() %>">����</a></td>
			 </tr>
			 <%} %>
			 </table>
			</div>
			<div id="back">
				
				<h2 style="color:#fff;">�ҵ���Ϣ</h2>
				<table>
					<tr>
						<td>�˺�</td>
						<td>����</td>
						<td>�Ա�</td>
						<td>�ֻ���</td>
						<td>�ʽ����</td>
					</tr>
					<tr>
						<td><%=readerss.getPatronId() %></td>
						<td><%=readerss.getName() %></td>
						<td><% if(Integer.parseInt(readerss.getGender())==1) out.print("��");else out.print("Ů"); %></td>
						<td><%=readerss.getTel() %></td>
						<td><%=readerss.getItemcounts() %></td>
					</tr>
				</table>
				</div>
			<div id="left">
				<h2 style="color:#fff;">�Ƽ�����</h2>
				<marquee direction="up" onmouseover="this.stop()" onmouseout="this.start()" behavior="scroll" scrollamount="5" loop="-1">
					
					<a href="javascript:null;" class="marquee">�ٶ�</a><br><br>
					<a href="javascript:null;" class="marquee">�ȸ�</a><br><br>
					<a href="javascript:null;" class="marquee">��Ѷ</a><br><br>
					<a href="javascript:null;" class="marquee">����</a><br><br>
					<a href="javascript:null;" class="marquee">360</a><br><br>
					<a href="javascript:null;" class="marquee">����</a>
				</marquee>
			
			</div>
			<div id="right">
				<h2 style="color:#fff;">Ͷ�߽���</h2>
				<table>
					<tr>
						<td>��ϵ��վ��д�飺<br>
							��Ҫ�Ὠ�飺<br>
							��ҪͶ�ߣ�<br>
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
