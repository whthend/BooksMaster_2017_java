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
		<title>����</title>
		
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"></link>
    <link rel="stylesheet" href="css/manage.css" type="text/css"></link>
    
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/manage.js"></script>
  	
	</head>
  <body>
  
  
	<div id="top">
		<div>��ӭ����&nbsp;<%=session.getAttribute("name") %>&nbsp;!</div>
		<div><a href="login.jsp" class="top">�˳�</a></div>
	</div>
	<div id="nav">
		<img alt="no" src="imgs/log.png"></img>
		<ul>
			<li><a href="document.jsp"><span class="box"><span class="font">����</span><span class="back">����</span></span></a></li>
			<li><a href="reader.jsp"><span class="box"><span class="font">����</span><span class="back">����</span></span></a></li>
			<li><a href="update.jsp"><span class="box"><span class="font">�޸�</span><span class="back">�޸�</span></span></a></li>
			<li><a href="about.jsp"><span class="box"><span class="font">����</span><span class="back">����</span></span></a></li>
		</ul>
	</div>
	<div id="body" class="backstretch">
  <h1 align="center">������Ϣ</h1>
  <div>
    <%
    	ReaderDao readerDao=new ReaderDao();
    	ArrayList readers=readerDao.reader();
     %>
     
     <form name="reader" action="servlet/readerInsert" method="post">
     <table class="pub_table" style="width: 60%;margin:auto">
     	<tr>
     		<td>�����˺�</td>
     		<td>��������</td>
     		<td>�Ա�</td>
     		<td>����</td>
     		<td>���֤��</td>
     		<td>�绰����</td>
     		<td>�ʽ����</td>
     		<td>&nbsp��&nbsp&nbsp��&nbsp</td>
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
     			if(a==1) out.println("��");
     			else out.println("Ů");
     		 %></td>
     		 <td>********</td>
     		<td><%=readerss.getId() %></td>
     		<td><%=readerss.getTel() %></td>
     		<td><%=readerss.getItemcounts() %></td>
     		<td><a href="servlet/readerInsert?style=1&&nam=<%=readerss.getPatronId() %>" >ɾ��</a></td>
     	</tr> 
     	<%
     		}
     	 %>
   		<tr>
     		<td style="background-color:#999">�����˺��Զ�����</td>
     		<td><input name="name" type="text" ></td>
     		<td>��<input name="gender" type="radio" value="1" checked><input name="gender" type="radio" value="0">Ů</td>
     		<td><input name="pwd" type="password"></td>
     		<td><input name="id" type="text"></td>
     		<td><input name="tel" type="text"></td>
     		<td style="background-color:#999">3</td>
     		<td><input type="submit" value="���"></td>
    	</tr>  
     	</td></</tr>
     </table></form>
  </div>
   </div>
   
   
   
   
   
   
   
   
   <div id="mfooter">
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
