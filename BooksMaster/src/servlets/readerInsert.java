package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class readerInsert extends HttpServlet {
	public readerInsert() {
		super();
	}
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
		            
		        	String sql = "delete from reader where patron_id="+chance1+"";
		        	int i=stat.executeUpdate(sql);
		        	
		        } catch (Exception e) {
		            e.printStackTrace();
		            // TODO: handle exception
		        }
			  
		 response.sendRedirect("/BooksMaster/reader.jsp");
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//patron_id,name,gender,pwd,id,tel,itemcounts
		String name=request.getParameter("name");
		int gender=Integer.parseInt(request.getParameter("gender"));
		String pwd=request.getParameter("pwd");
		String id=request.getParameter("id");
		String tel=request.getParameter("tel");
		
		//ʹ�õ�MySQL�����������ݿ�
		String jdbcDriver="com.mysql.jdbc.Driver";
		String connUrl="jdbc:mysql://localhost:3306/bookmanager";
		String user="root";
		String mysqlPwd="aa123123";
		
		try{
			//�������ݿ�
			Class.forName(jdbcDriver);
			Connection conn=DriverManager.getConnection(connUrl,user,mysqlPwd);
            //3.����PreparedStatment ���ڴ���sql��ѯ���
        	Statement stat = conn.createStatement();
            
        	String sql = "insert into reader(name,gender,pwd,id,tel,itemcounts) values('"+name+"',"+gender+",'"+pwd+"','"+id+"','"+tel+"',3)";
        	int i=stat.executeUpdate(sql);
        	System.out.println(i);
        	
        } catch (Exception e) {
            e.printStackTrace();
        }
	
	
	
	
	
	response.sendRedirect("/BooksMaster/reader.jsp");
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
