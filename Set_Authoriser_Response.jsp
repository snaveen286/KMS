<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Set_Authoriser_Response1.jsp'>
<center><h3>Response Page</h3>
<%@ page language='java' import='java.sql.*' %>
<%
         try
          {
	int qid=Integer.parseInt((String)session.getAttribute("qid"));
	String que=(String)session.getAttribute("que");

	out.println("<table width='100%'>");
	out.println("<tr><th align='right'>Question Id : </th>");
out.println("<td><input type='text' name='t1' size=10 value='"+qid+"' disabled></td></tr>");
	out.println("<tr><th align='right'>Question : </th>");	
out.println("<td><input type='text' name='t2' size=50 value='"+que+"' disabled></td></tr>");
	out.println("<tr><th align='left'>Response : </th></tr>");
out.println("<tr><td></td><td><textarea name='ans' rows='5' cols='50'></textarea></td></tr>");
out.println("</table><br><br><input type='submit' value=' SET RESPONSE  '>");
             }
            catch(Exception e)
             {

             }
%>
</body>