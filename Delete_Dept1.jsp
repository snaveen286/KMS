<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
	String no=request.getParameter("dno");

	if(!no.equals("--Select--"))
	 {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
String str="update Departments set Status='Deleted' where Dept_Id="+Integer.parseInt(no);
	stmt.executeUpdate(str);
	out.println("<center><br><br><b>Department Details are Deleted...</b>");
 	stmt.close();
	cn.close();
	 }
	else
	 {
            out.println("<center><br><br><b>No Department Code is Selected to Delete...</b>");
	 }
          }
         catch(Exception e)
          {
	out.println("<center><br><br><b>Error in Deleting the Department Details...");
          }
 %>