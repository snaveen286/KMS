<body bgcolor='maroon' text='yellow'>
<center><h3>Student's profile</h3>
<%@ page language='java' import='java.sql.*' %>
<%
    try
     {
	String eid=(String)session.getAttribute("eid");
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
         Statement stmt=cn.createStatement();
	String str="Select * from Students where Reg_No='"+eid+"'";
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
%>
<table border='0'>
   <tr>
	<th align='right'>Student Id : </th>
<%    out.println("<td>"+rs.getString(1)+"</td>");    %>
      </tr>
   <tr>
	<th align='right'>Student Name : </th>
<% out.println("<td>"+rs.getString(2)+"</td>"); %>
      </tr>
   <tr>
	<th align='right'>Department Name : </th>
<% out.println("<td>"+rs.getString(3)+"</td>"); %>
      </tr>
<%
	}
                stmt.close();
	cn.close();
       }
      catch(Exception e)
       {

       }
%>      
</table>
</form>
</body>
</body>