<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='AddDepartment1.jsp'>
<center><h2>New Department Info Page</h2>
<%@ page language='java' import='java.sql.*' %>
<%
    int no=0;
      Connection cn=null;
       Statement stmt=null;
    try
     {
	String str="select Max(Dept_Id) from Departments";
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
	        no=Integer.parseInt(rs.getString(1))+1;
	 }
	stmt.close();
	cn.close();
      }
     catch(Exception e)
     {
	stmt.close();
	cn.close();
	no=1001;
      }
        session.setAttribute("dno",String.valueOf(no));
%>
<table border='0'>
   <tr>
	<th align='right'>Department Id : </th>
<%    out.println("<td><input type='text' name='dno' value="+no+" size=10 disabled></td>");    %>
      </tr>
   <tr>
	<th align='right'>Department Name : </th>
	<td><input type='text' name='dname' size=20></td>
      </tr>
   <tr>
	<th align='right'>Mode of Work : </th>
	<td><textarea name='work' rows='4' cols='30'></textarea></td>
      </tr>
</table>
<br><br>
<input type='submit' value='  Submit  '>
</form>
</body>