<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
       try
        {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	String str="select * from Departments where Status='Active'";
	ResultSet rs=stmt.executeQuery(str);
	out.println("<center><h2 style='font-family:forte'>DEPARTMENT INFORMATION</h2>");
	out.println("<table border='1' width='80%'>");
out.println("<tr><th>Dept No</th><th>Dept Name</th><th>Description</th></tr>");
	while(rs.next())
	 {
	out.println("<tr><td>"+rs.getInt(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td></tr>");
	 }
	out.println("</table>");
	stmt.close();
	cn.close();
          }
         catch(Exception e)
           {
	out.println("<b>Error in Loading the Department Information....</b>");
           }
 %>