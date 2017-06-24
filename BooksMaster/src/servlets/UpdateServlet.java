package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateServlet() {
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
	 * The doDelete method of the servlet. <br>
	 *
	 * This method is called when a HTTP delete request is received.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

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
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
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

		//�����Լ���Ӧʽ�ı������
				request.setCharacterEncoding("gb2312");
				response.setContentType("text/html;charset=gb2312");
				
				HttpSession session=request.getSession();
				PrintWriter out = response.getWriter();
				
				//��ȡ��ҳ��ֵ
				int updateStyle=Integer.parseInt(request.getParameter("updateStyle"));
				int gender=Integer.parseInt(request.getParameter("gender"));
				int accStaff=Integer.parseInt(session.getAttribute("account").toString());
				String pwd=request.getParameter("pwd");
				String name=request.getParameter("name");
				int tel=Integer.parseInt(request.getParameter("tel"));
				
				
				String sql=null;
				if(updateStyle==1)
				{
					int acc=Integer.parseInt(request.getParameter("account"));
					String id=request.getParameter("id");
					sql="update reader set name='"+name+"',gender="+gender+",pwd='"+pwd+"',id='"+id+"',tel="+tel+" where patron_id="+acc+"";
				}
				else
				{
					sql="update staff set name='"+name+"',gender="+gender+",pwd='"+pwd+"',tel="+tel+" where operator_id="+accStaff+"";
				}
				
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
					
					int i=stat.executeUpdate(sql);
			    	System.out.println(i);
			    	if(i==1)//�޸ĳɹ�
			    	{
			    		session.setAttribute("updateResult", 1);
			    	}
			    	else//�޸�ʧ��
			    	{
			    		session.setAttribute("updateResult", 0);
			    	}
			    	response.sendRedirect("/BooksMaster/update.jsp");
			    	
			    	stat.close();
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{//�ر�����
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
