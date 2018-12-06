<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
                  String no=(String)session.getAttribute("no");

String str="update Students set Status='Deleted' where Reg_No='"+no+"'";
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	stmt.executeUpdate(str);
  out.println("<b><br><br>Students Details Deleted Successfully....");
	stmt.close();
	cn.close();
         }
      catch(Exception e)
        {
	out.println("Error : "+e);
         }
%>
</body>                