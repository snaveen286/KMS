<Body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
      try
       {
	int qid=Integer.parseInt((String)session.getAttribute("qid"));
	String ans=request.getParameter("ans");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();

String str="Update Questions set Response='"+ans+"' where QID="+qid;
	stmt.executeUpdate(str);
	stmt.close();
	cn.close();
	out.println("<b>Response to the Query is Set....</b>");
        }
       catch(Exception e)
        {
	out.println("Error : "+e);
         }
%>
</body>