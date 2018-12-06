<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Set_Answer1.jsp'>
<center><h3>Article Information</h3>
<%@ page language='java' import='java.sql.*' %>
<%
         try
          {
	int qid=Integer.parseInt(request.getParameter("qid"));
	session.setAttribute("qid",String.valueOf(qid));
	String str="Select Subject,Description from Articles where Article_Id="+qid;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
	out.println("<table width='100%'>");
	out.println("<tr><th align='right'>Article Id : </th>");
out.println("<td><input type='text' name='t1' size=10 value='"+qid+"' disabled></td></tr>");
	out.println("<tr><th align='right'>Subject : </th>");
	String ques=rs.getString(1);
	session.setAttribute("que",ques);
out.println("<td><input type='text' name='t2' size=40 value='"+ques+"' disabled></td></tr>");
	out.println("<tr><th align='right'>Article : </th>");
out.println("<td><input type='text' size=60 value='"+rs.getString(2)+"'></td></tr>");
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