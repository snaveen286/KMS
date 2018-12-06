<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Delete_Student1.jsp'>
<center><h3>Students Info. Deletion Page</h3>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
String str="select Reg_No from Students where Status='Active'";
	ResultSet rs=stmt.executeQuery(str);
              out.println("<center><b>Select the Student Number : </b>");
	out.println("<select name='dno'>");
	while(rs.next())
	 {
	         String no=rs.getString(1);
                           out.println("<option value='"+no+"'>"+no+"</option>");
	 }
	out.println("</select><input type='submit' value='  Show  '>");
	stmt.close();
	cn.close();
       }
      catch(Exception e)
        {
	out.println("Error : "+e);
         }
%>
</form>
</body>