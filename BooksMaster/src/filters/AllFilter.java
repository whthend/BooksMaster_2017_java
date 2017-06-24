package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AllFilter implements Filter{
	public void init(FilterConfig config) throws ServletException{}
	public void destroy(){}
	public void doFilter(ServletRequest req,ServletResponse res,FilterChain chain) throws IOException,ServletException{
		
		req.setCharacterEncoding("gb2312");
		res.setCharacterEncoding("gb2312");
		
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		HttpSession session=request.getSession();
		
		String url=request.getRequestURI().toString();
		//session中account的值为空，且又不是login.jsp页面
		if(session.getAttribute("account")==null&&!url.contains("login.jsp")&&!url.contains("servlet/LoginServlet")){
			System.out.println(url);
			session.setAttribute("account", "");
			session.setAttribute("name","");
			response.sendRedirect("login.jsp");
		}
		else{
			chain.doFilter(req, res);
		}
			
	}
}
