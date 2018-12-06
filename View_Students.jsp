<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
       try
        {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	String str="select * from Students where Status='Active' order by Reg_No";
	ResultSet rs=stmt.executeQuery(str);
	out.println("<center><h3>Students Details</h3>");
	out.println("<table border='1' width='80%'>");
out.println("<tr><th>Reg No</th><th>Student Name</th><th>Dept Name</th></tr>");
	while(rs.next())
	 {
	out.println("<tr><td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td></tr>");
	  }
	out.println("</table>");
	stmt.close();
	cn.close();
          }
         catch(Exception e)
           {

           }
 %>