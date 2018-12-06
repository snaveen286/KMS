<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
     {
	String qid=request.getParameter("qid");
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	String str="Select QID,Question,Response from Questions where QID="+qid;
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
	out.println("<center><h3>Query Searching Form</h3>");
	out.println("<br><table><tr><th>Question Id :</th>");
out.println("<td><input type='text' value='"+rs.getInt(1)+"'></td></tr>");
	out.println("<tr><th>Question :</th>");
	out.println("<td><input type='text' value='"+rs.getString(2)+"' size=40></td></tr>");
	out.println("<tr><th>Answer :</th>");
	out.println("<td><input type='text' value='"+rs.getString(3)+"' size=50></td></tr>");
	 }
	stmt.close();
	cn.close();
         }
        catch(Exception e)
         {

          }
%>