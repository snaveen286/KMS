<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Set_Answers1.jsp'>
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
	out.println("<tr><th align='left'>Responses  : </th></tr>");
	out.println("</table>");

		out.println("<table border='1' width='90%'>");
	out.println("<tr><th>SlNo</th><th>Response</th></tr>");

	str="select SlNo,Response from Responses where QID="+qid;
	rs=stmt.executeQuery(str);
	while(rs.next())
	 {
	         out.println("<tr><th>"+rs.getString(1)+"</th>");
	out.println("<td>"+rs.getString(2)+"</td></tr>");
	 }
              out.println("</table><br><br>");

	out.println("<b>Select the Response Number :</b>");
	out.println("<select name='res'>");
	str="select SlNo from Responses where QID="+qid;
	rs=stmt.executeQuery(str);
	while(rs.next())
	 {
              	          out.println("<option>"+rs.getString(1)+"</option>");
	 }
                    out.println("<option>none</option>");
	out.println("</select><br><br>");
               out.println("<input type='submit' value=' SET RESPONSE  '>");
	 }
	stmt.close();
	cn.close();
             }
            catch(Exception e)
             {

             }
%>
</body>