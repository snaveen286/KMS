<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Delete_Dept1.jsp'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
String str="select Dept_Id from Departments where Status='Active'";
	ResultSet rs=stmt.executeQuery(str);
	out.println("<center><h2 style='font-family:forte'>DEPARTMENT INFORMATION</h2>");
              out.println("<center><b>Select the Department Number to Delete : </b>");
	out.println("<select name='dno'>");
	out.println("<option>--Select--</option>");
	while(rs.next())
	 {
	         String no=rs.getString(1);
                           out.println("<option value='"+no+"'>"+no+"</option>");
	 }
     out.println("</select><input type='submit' value='  DELETE   '>");
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