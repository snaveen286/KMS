<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Add_Student1.jsp'>
<center><h2>New Students Informatin Page</h2>
<%@ page language='java' import='java.sql.*' %>
<%
      Connection cn=null;
       Statement stmt=null;
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
cn=DriverManager.getConnection("jdbc:odbc:KMSC");
         stmt=cn.createStatement();  
%>
<table border='0'>
   <tr>
	<th align='right'>Student Roll No : </th>
<%    out.println("<td><input type='text' name='eno' size=15></td>");    %>
      </tr>
   <tr>
	<th align='right'>Student Name : </th>
	<td><input type='text' name='ename' size=20></td>
      </tr>
   <tr>
	<th align='right'>Department Name : </th>
	<td><select name='dname'>
<%
                try
	{
          String st="select Dept_Name from Departments where Status='Active'";
	ResultSet rs1=stmt.executeQuery(st);
	while(rs1.next())
	 {
	out.println("<option>"+rs1.getString(1)+"</option>");
	 }
	
	}
                 catch(Exception e)
                  {   }
%>
	</select></td>
      </tr>
   <tr>
	<th align='right'>User Name : </th>
	<td><input type='text' name='uname' size=20></td>
      </tr>
   <tr>
	<th align='right'>PassWord : </th>
	<td><input type='password' name='pwd' size=20></td>
      </tr>
</table>
<br><br>
<input type='submit' value='  Submit  '>
</form>
</body>