<%@include file="header.jsp" %> 
<style type="text/css">

section ul
{
list-style-type: none;
}
section ul li
{
    margin-top:10px;
	background-color: blue;
	width:650px;
	height:30px;
	text-align:center;
	border-radius:10px;
	padding:5px;
		

}
input[type="text"],input[type="password"]
{
   width:250px;
   height:30px;
}
input[type="submit"]
{
height:30px;
width:200px;
background-color: blue;
}
</style>
<section>

<%
String u = "";
String p = "";
if(request.getCookies()!=null)
{
Cookie c[] = request.getCookies();

for(int i=0;i<c.length;i++)
{
	if(c[i].getName().equals("cuid"))
	{
		u=c[i].getValue();
	}
	if(c[i].getName().equals("cpwd"))
	{
		p=c[i].getValue();
	}
}

}
%>
<h1>Welcome in Project CRM Application</h1>
<div style="margin-top:100px;float:left;width:50%;">
<h1>Login here</h1>
<form name="frmlogin" action="LoginSer" method="post">

<input type="text" name="txtemail" placeholder="Enter email" value="<%= u %>" />
<br><br>
<input type="password" name="txtpass" placeholder="Enter password" value="<%= p %>" />
<br><br>
<input type="checkbox" name="chk" value="remember me" <% if(u!=""){out.print("checked");}  %>  /> Remember me
<br><br>
<input type="submit" name="btnsubmit" value="Login"  />
<br><br>


</form>
<%
if(request.getParameter("q1")!=null)
{
	out.print(request.getParameter("q1"));
}


%>
</div>
<div style="margin-top:100px;float:left;width:50%;">
<h1>Register here</h1>
<form name="frmreg" action="RegSer" method="post">

<input type="text" name="txtemail" placeholder="Enter email" />
<br><br>
<input type="text" name="txtpass" placeholder="Enter password" />
<br><br>
<input type="text" name="txtfname" placeholder="Enter fullname" />
<br><br>
<input type="text" name="txtmobile" placeholder="Enter mobileno" />
<br><br>
<input type="submit" name="btnsubmit" value="Register"  />
</form>

<%
if(request.getParameter("q")!=null)
{
	out.print(request.getParameter("q"));
}


%>
</div>
</section>

<%@include file="footer.jsp" %> 