<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
   try
    {
	String str="select QID,Question,Response from Questions where Response not in ('Active') order by QID";

//String str="Select Dept_Name from Departments where Dept_Id="+dno;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	out.println("<center><h3>Queries & Responses</h3>");
	out.println("<table border='1' width='90%'>");
	out.println("<tr><th>Question Id</th><th>Question</th>");
	out.println("<th>Response</th></tr>");
	while(rs.next())
	 {
	out.println("<tr><td>"+rs.getInt(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td></tr>");
	 }
	out.println("</table>");

     }
    catch(Exception e)
     {

      }
%>
</body>