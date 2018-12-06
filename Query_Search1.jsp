<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Query_Search2.jsp'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
     {
	String cri=request.getParameter("t1");
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	String str="Select QID,Question from Questions where Question like '%"+cri+"%' order by QID";
	ResultSet rs=stmt.executeQuery(str);
	out.println("<center><h3>Query Searching Form</h3>");
	out.println("<table border='1' width='80%'>");
             out.println("<tr><th>Question Id</th><th>Question</th></tr>");
	while(rs.next())
	 {
	        out.println("<tr><td>"+rs.getInt(1)+"</td>");
	        out.println("<td>"+rs.getString(2)+"</td></tr>");
	 }
	out.println("</table>");
	str="Select QID from Questions where Question like '%"+cri+"%' order by QID";
	rs=stmt.executeQuery(str);
out.println("<br><b>Select the Question Id to View the Answer : </b>");
	out.println("<select name='qid'>");
	while(rs.next())
	 {
	out.println("<option>"+rs.getString(1)+"</option>");
	 }
	out.println("</select><br><br><input type='submit' value=' View Answer  '>");
	stmt.close();
	cn.close();
      }
     catch(Exception e)
      {

      }
%>
</body>