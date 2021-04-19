


import java.io.IOException;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegSer
 */
@WebServlet("/LoginSer")
public class LoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectcrm","root","");
			Statement st = con.createStatement();
			ResultSet x = st.executeQuery("select * from tbl_hr where email='"+request.getParameter("txtemail")+"' and password='"+request.getParameter("txtpass")+"'");
			if(x.next())
			{
				HttpSession session = request.getSession();
				session.setAttribute("uid",request.getParameter("txtemail"));
				
				if(request.getParameter("chk")!=null)
				{
				Cookie c = new Cookie("cuid",request.getParameter("txtemail"));
				c.setMaxAge(5000);
				response.addCookie(c);
				Cookie c1 = new Cookie("cpwd",request.getParameter("txtpass"));
				c1.setMaxAge(5000);
				response.addCookie(c1);
				}
				response.sendRedirect("hr/dashboard.jsp");
			}
			else
			{
				response.sendRedirect("hr.jsp?q1=invalid emailid and password");
			}
			con.close();
		}
		catch(Exception ex)
		{
			
		}
		
		
	}

}
