<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='View_Response1.jsp'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
     {
	String eid=(String)session.getAttribute("eid");
    String str="select QID,Question from Questions where Emp_Id='"+eid+"' and Response not in ('Active') order by QID";

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	out.println("<center><h3>Queries & Responses</h3>");
	out.println("<table border='1' width='90%'>");
             out.println("<tr><th>Question Id</th><th>Question</th></tr>");
	while(rs.next())
	 {
	out.println("<tr><td>"+rs.getInt(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	 }
	out.println("</table>");

	str="select QID from Questions where Emp_Id='"+eid+"' and Response not in ('Active') order by QID";
	rs=stmt.executeQuery(str);
	out.println("<br><b>Select the Question Id :</b>");
	out.println("<select name='qid'>");
	while(rs.next())
	 {
	out.println("<option>"+rs.getString(1)+"</option>");
	 }
	out.println("</select>");
                out.println("<br><br><input type='submit' value='  Show  '>");
	stmt.close();
	cn.close();
      }
     catch(Exception e)
       {
 	out.println("Error : "+e);
        }
%>
</form>
</body>