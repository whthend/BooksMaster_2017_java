<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="daos.DocumentDao" %>
<%@ page import="daos.ReaderDao" %>
<%@ page import="daos.StaffDao" %>
<%@ page import="beans.Document" %>
<%@ page import="beans.Reader" %>
<%@ page import="beans.Staff" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"></link>
    <link rel="stylesheet" href="css/manage.css" type="text/css"></link>
    
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
  	<script type="text/javascript" src="js/manage.js"></script>
<style>

</style>
  </head>
  
  <body >
	<div id="top" >
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
	
	<body>
	
	
	<div id="body" class="backstretch" >
  <h1 align="center" style="margin:0">������Ϣ</h1>
  <div>
    <%
    	DocumentDao docDao=new DocumentDao();
    	/* LendHistoryDao lendhisDao=new LendHistoryDao();
    	ReaderDao readerDao=new ReaderDao();
    	StaffDao staffDao=new StaffDao(); */
    	
    	ArrayList docs=docDao.searchAllBooks();
    	/* ArrayList lendhis=lendhisDao.lendHis();
    	ArrayList readers=readerDao.reader();
    	ArrayList staffs=staffDao.staff(); */
    	
    	//Document docss=(Document)docs.get(0); 
    	/* LendHistory lendss=(LendHistory)lendhis.get(0);
    	Reader readerss=(Reader)readers.get(0);
    	Staff staffss=(Staff)staffs.get(0); */
     %>
     <form id="docForm" action="servlet/DocInsert" method="post">
     <table class="pub_table" style="width: 60%;margin:auto">
     	<tr>
     		<td>����</td>
     		<td>����</td>
     		<td>������</td>
     		<td>����</td>
     		<td>�������</td>
     		<td>������</td>
     		<td>&nbsp��&nbsp&nbsp��&nbsp</td>
 
     	</tr>
     	 <%
     		for(int i=0;i<docs.size();i++){
     		Document docss=(Document)docs.get(i);
     		//out.println("a");
     		 
     	 %> 
     	 <tr>
     		<td><%=docss.getTitle() %></td>
     		<td><%=docss.getAuthor() %></td>
     		<td><%=docss.getPublisher() %></td>
     		<td><%=docss.getPrice() %></td>
     		<td><%=docss.getStack() %></td>
     		<td><%=docss.getLeftCount() %></td>
     		<td><a href="servlet/DocInsert?style=1&&nam=<%=docss.getId() %>" >ɾ��</a></td>
     	</tr> 
     	<%
     		}
     	 %>
     	 <tr id="tr">
     		<td><input name="title" type="text" /></td>
     		<td><input name="author" type="text"/></td>
     		<td><input name="publisher" type="text"/></td>
     		<td><input name="price" type="text"/></td>
     		<td><input name="stack" type="text"/></td>
     		<td><input name="leftcount" type="text"/></td>
     		<td><input id="submitButton" type="button" value="���"/></td>
     	</tr>
     </table>
  </form>
   </div>
   </div>  
   </body>
   
   
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


