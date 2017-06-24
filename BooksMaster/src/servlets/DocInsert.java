package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DocInsert extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DocInsert() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int chance1=Integer.parseInt(request.getParameter("nam"));
		int chance=Integer.parseInt(request.getParameter("style"));
		//int b=Integer.parseInt(request.getParameter("doc_id"));
		//String chance2=request.getParameter("style");
		//out.println(chance2);
		if(chance==1){
			
			//ʹ�õ�MySQL�����������ݿ�
			String jdbcDriver="com.mysql.jdbc.Driver";
			String connUrl="jdbc:mysql://localhost:3306/bookmanager?useUnicode=true&characterEncoding=utf-8&useSSL=false";
			String user="root";
			String mysqlPwd="aa123123";
			
			try{
				//�������ݿ�
				Class.forName(jdbcDriver);
				Connection conn=DriverManager.getConnection(connUrl,user,mysqlPwd);
		            //3.����PreparedStatment ���ڴ���sql��ѯ���
		        	Statement stat = conn.createStatement();
		            
		        	String spl="select * from document where doc_id="+chance1+"";
		        	ResultSet rs=stat.executeQuery(spl);
		        	if(rs.next()){
		        		
		        		int doc_id=Integer.parseInt(rs.getString("doc_id"));
		        		String title=rs.getString("title");
		        		String author=rs.getString("author");
		        		String publisher=rs.getString("publisher");
		        		String price=rs.getString("price");
		        		String sql = "insert into DelDoc(doc_id,title,author,publisher,price,operator_id) values("+doc_id+",'"+title+"','"+author+"','"+publisher+"','"+price+"',2);";
			        	int i=stat.executeUpdate(sql);
	
		        	}
		        	
		        	String sql = "delete from document where doc_id="+chance1+"";
		        	int i=stat.executeUpdate(sql);
		        	
		        } catch (Exception e) {
		            e.printStackTrace();
		            // TODO: handle exception
		        }
			  
		 response.sendRedirect("/BooksMaster/document.jsp");
		}
		
		
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
			String title=request.getParameter("title");
			String author=request.getParameter("author");
			String publisher=request.getParameter("publisher");
			String price=request.getParameter("price");
			String stack=request.getParameter("stack");
			//String leftcount=request.getParameter("leftcount");
			System.out.println(title);
			System.out.println(stack);
			
			
			int leftcount=Integer.parseInt(request.getParameter("leftcount"));
			
			//ʹ�õ�MySQL�����������ݿ�
			String jdbcDriver="com.mysql.jdbc.Driver";
			String connUrl="jdbc:mysql://localhost:3306/bookmanager";
			String user="root";
			String mysqlPwd="1234";
			
			try{
				//�������ݿ�
				Class.forName(jdbcDriver);
				Connection conn=DriverManager.getConnection(connUrl,user,mysqlPwd);
	        	if(conn !=null) 
	        		System.out.println("hello !");
	            //3.����PreparedStatment ���ڴ���sql��ѯ���
	        	Statement stat = conn.createStatement();
	            
	        	String sql = "insert into document(title,author,publisher,price,stack,count) values('"+title+"','"+author+"','"+publisher+"','"+price+"','"+stack+"',"+leftcount+");";
	        	int i=stat.executeUpdate(sql);
	        	
	        } catch (Exception e) {
	            e.printStackTrace();
	            // TODO: handle exception
	        }
		
		
		
		
		System.out.println("hello word !");
		response.sendRedirect("/BooksMaster/document.jsp");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
