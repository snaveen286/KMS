<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Set1_Answer1.jsp'>
<center><h3>Response Page</h3>
<%@ page language='java' import='java.sql.*' %>
<%
         try
          {
	int qid=Integer.parseInt(request.getParameter("qid"));
	session.setAttribute("qid",String.valueOf(qid));
	String str="Select Question from Questions where QID="+qid;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
	out.println("<table width='100%'>");
	out.println("<tr><th align='right'>Question Id : </th>");
out.println("<td><input type='text' name='t1' size=10 value='"+qid+"' disabled></td></tr>");
	out.println("<tr><th align='right'>Question : </th>");
	String ques=rs.getString(1);
	session.setAttribute("que",ques);
out.println("<td><input type='text' name='t2' size=50 value='"+ques+"' disabled></td></tr>");
	out.println("<tr><th align='left'>Response : </th></tr>");
out.println("<tr><td></td><td><textarea name='ans' rows='5' cols='50'></textarea></td></tr>");
out.println("</table><br><br><input type='submit' value=' SET RESPONSE  '>");
	 }
	stmt.close();
	cn.close();
             }
            catch(Exception e)
             {

             }
%>
</body>