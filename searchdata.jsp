<div>
<%@page import="java.sql.*" %>
<table border="1">
<tr><th>EMPID</th><th>EMPEMAIL</th><th>PASSWORD</th><th>FULLNAME</th><th>DESIGNATION</th></tr>
<%
String data = request.getParameter("q")+"%";
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectcrm","root","");
Statement st = con.createStatement();
ResultSet x = st.executeQuery("select * from tbl_emp where fullname like '"+data+"'");
while(x.next())
{%>
<tr><td><%= x.getString(1) %></td><td><%= x.getString(2) %></td><td><%= x.getString(3) %></td><td><%= x.getString(4) %></td><td><%= x.getString(5) %></td>
<td><a href="Findrec.jsp?q=<%= x.getString(1) %>">EDIT </a> </td><td><a href="Deleterec.jsp?q=<%= x.getString(1) %>"> DELETE</a> </td>
</tr>
<%
}
%>	
</table>
</div>