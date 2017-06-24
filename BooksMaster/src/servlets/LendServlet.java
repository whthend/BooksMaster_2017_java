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

public class LendServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LendServlet() {
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
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		
		//��ȡ��ҳ��ֵ
		int patron_id=Integer.parseInt(session.getAttribute("account").toString());
		int doc_id=Integer.parseInt(request.getParameter("doc"));
		int style=Integer.parseInt(request.getParameter("style"));
		//System.out.println("here");
		Connection conn=null;
		
		
		String jdbcDriver="com.mysql.jdbc.Driver";
		String connUrl="jdbc:mysql://localhost:3306/bookmanager?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		String user="root";
		String mysqlPwd="aa123123";
		
		try{
			
			Class.forName(jdbcDriver);
			conn=DriverManager.getConnection(connUrl,user,mysqlPwd);
			Statement stat = conn.createStatement();
			
			if(style==1){
				
				String check="select * from lend where doc_id="+doc_id+"";
				String checkEmpty="select * from document where doc_id="+doc_id+"";
				ResultSet rs=stat.executeQuery(check);
				if(rs.next())
				{
					response.sendRedirect("/BooksMaster/me.jsp");
				}
				else{
					rs=stat.executeQuery(checkEmpty);
					if(rs.next())
					{
						if(Integer.parseInt(rs.getString("count"))<1)
						{
							response.sendRedirect("/BooksMaster/index.jsp");
						}
						else
						{
							String insert="insert into lend(patron_id,doc_id,lendtime) values("+patron_id+","+doc_id+",now())";
							String update="update document set count=count-1 where doc_id="+doc_id+"";
							int a=stat.executeUpdate(insert);
							int b=stat.executeUpdate(update);
							response.sendRedirect("/BooksMaster/me.jsp");
						}
					}
				}
				rs.close();
			}
			else if(style==2)
			{
				String sql="select lend_id,patron_id,lendtime from lend where doc_id="+doc_id+"";
				ResultSet rs=stat.executeQuery(sql);
				rs.next();
				int lend_id=Integer.parseInt(rs.getString("lend_id"));
				int pa_id=Integer.parseInt(rs.getString("patron_id"));
				String lendtime=rs.getString("lendtime").toString();
				String insert="insert into lendhistory(lend_id,patron_id,doc_id,lendtime,returntime) values("+lend_id+","+pa_id+","+doc_id+",'"+lendtime+"',now())";
				String update="update document set count=count+1 where doc_id="+doc_id+"";
				String delete="delete from lend where doc_id="+doc_id+"";
				int a=stat.executeUpdate(insert);
				int b=stat.executeUpdate(update);
				int c=stat.executeUpdate(delete);
				response.sendRedirect("/BooksMaster/me.jsp");
			}
	    	
	    	
	    	
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
