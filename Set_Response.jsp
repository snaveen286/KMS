<Body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
      try
       {
	int res=Integer.parseInt((String)session.getAttribute("res"));
	int qid=Integer.parseInt((String)session.getAttribute("qid"));

String str="select Response from Responses where SlNo="+res+" and QID="+qid;

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	rs.next();
	String ans=rs.getString(1);

          str="Update Questions set Response='"+ans+"' where QID="+qid;
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