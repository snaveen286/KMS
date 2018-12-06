<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Set_Answers1.jsp'>
<center><h3>Response Page</h3>
<%@ page language='java' import='java.sql.*' %>
<%
         try
          {
	int qid=Integer.parseInt(request.getParameter("qid"));
	String str="Select QID,Question,Response from Questions where QID="+qid;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
	out.println("<table width='100%' border='0'>");
	out.println("<tr><th align='right'>Question Id : </th>");
out.println("<td><input type='text' name='t1' size=10 value='"+qid+"' disabled></td></tr>");
	out.println("<tr><th align='right'>Question : </th>");
	String ques=rs.getString(2);
out.println("<td><input type='text' name='t2' size=50 value='"+ques+"' disabled></td></tr>");
	out.println("<tr><th align='right'>Response  : </th>");
	//out.println("<td><textarea name='t3' value='"+rs.getString(3)+"' rows=5 cols=50></textarea></td></tr>");
	out.println("<td><input type='text' name='t3' value='"+rs.getString(3)+"' size=50></td></tr>");
	out.println("</table>");
	}
	stmt.close();
	cn.close();
             }
            catch(Exception e)
             {

             }
%>
</body>