<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Alter_Student2.jsp'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
	String no=request.getParameter("dno");
	session.setAttribute("no",no);
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	String str="select * from Students where Reg_No='"+no+"'";
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
out.println("<center><h3>Department Updation Form</h3>");
	out.println("<table border='0'>");
	out.println("<tr><th align='right'>Regd. No :</th>");
out.println("<td><input type='text' name='t1' value='"+rs.getString(1)+"' size=10 disabled></td></tr>");
	out.println("<tr><th align='right'>Student Name :</th>");
out.println("<td><input type='text' name='t2' value='"+rs.getString(2)+"' size=20></td></tr>");
	out.println("<tr><th align='right'>Dept Name :</th>");
out.println("<td><input type='text' name='t3' value='"+rs.getString(3)+"' size=40></td></tr>");
	out.println("</table>");
	 }
	stmt.close();
	cn.close();
out.println("<br><br><input type='submit' value=' Update '>");
        }
      catch(Exception e)
        {
	out.println("Error : "+e);
         }
%>
</form>
</body>