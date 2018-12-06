<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Alter_Dept3.jsp'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
	String no=request.getParameter("dno");
	if(!no.equals("--Select--"))
	 {
	session.setAttribute("no",no);
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	String str="select * from Departments where Dept_Id="+Integer.parseInt(no);
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
out.println("<center><h2 style='font-family:forte'>DEPARTMENT INFORMATION</h2>");
	out.println("<table border='0'>");
	out.println("<tr><th align='right'>Dept. No :</th>");
out.println("<td><input type='text' name='t1' value='"+rs.getInt(1)+"' size=10 disabled></td></tr>");
	out.println("<tr><th align='right'>Dept. Name :</th>");
out.println("<td><input type='text' name='t2' value='"+rs.getString(2)+"' size=20></td></tr>");
	out.println("<tr><th align='right'>Description :</th>");
out.println("<td><input type='text' name='t3' value='"+rs.getString(3)+"' size=40></td></tr>");
	out.println("</table>");
	 }
	stmt.close();
	cn.close();
out.println("<br><br><input type='submit' value=' UPDATE '>");
	 }
	else
	 {
	out.println("<center><br><br><b>No Dept Code is Specified to Load...</b>");
	 }
        }
      catch(Exception e)
        {
	out.println("Error : "+e);
         }
%>
</form>
</body>