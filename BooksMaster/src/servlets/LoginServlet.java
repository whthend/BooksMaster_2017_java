package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
		
		//�����Լ���Ӧʽ�ı������
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		
		//��ȡ��ҳ��ֵ
		String account=request.getParameter("account");
		String pwd=request.getParameter("pwd");
		int iden=Integer.parseInt(request.getParameter("identity"));
		
		Connection conn=null;
		
		//ʹ�õ�MySQL�����������ݿ�
		String jdbcDriver="com.mysql.jdbc.Driver";
		String connUrl="jdbc:mysql://localhost:3306/bookmanager?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		String user="root";
		String mysqlPwd="aa123123";
		
		try{
			//�������ݿ�
			Class.forName(jdbcDriver);
			conn=DriverManager.getConnection(connUrl,user,mysqlPwd);
			Statement stat = conn.createStatement();
			String sql=null;
			if(iden==1)
			{
				sql="select * from staff where operator_id="+account+" and pwd='"+pwd+"'";
			}
	    	
			else{
				sql="select * from Reader where patron_id="+account+" and pwd='"+pwd+"'";
			}
	    	ResultSet rs=stat.executeQuery(sql);//得到符合搜索的行数
	    	
	    	if(rs.next())
	    	{
	    		String acc_name=rs.getString("name");
	    		session.setAttribute("account", account);
	    		session.setAttribute("name", acc_name);
	    		
	    		if(iden==1)
	    		{
	    			response.sendRedirect("/BooksMaster/document.jsp");
	    		}
	    		else
	    			response.sendRedirect("/BooksMaster/index.jsp");
	    	}
	    	else
	    	{
	    		response.sendRedirect("/BooksMaster/login.jsp");
	    	}
	    	
	    	rs.close();
	    	stat.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null)
				{
					conn.close();
					conn=null;
				}
			}catch(Exception ex){
				
			}
		}
		
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
