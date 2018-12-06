<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Add_Employ1.jsp'>
<center><h2 style='font-family:forte'>STAFF INFORMATION</h2>
<%@ page language='java' import='java.sql.*,java.text.*' %>
<%
    int no=0;
      Connection cn=null;
       Statement stmt=null;
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
       cn=DriverManager.getConnection("jdbc:odbc:KMSC");
         stmt=cn.createStatement();
    try
     {
	String str="select Max(Emp_Id) from Employ";

	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
	        no=Integer.parseInt(rs.getString(1))+1;
	 }
      }
     catch(Exception e)
     {
	no=10001;
      }
        session.setAttribute("eno",String.valueOf(no));

     SimpleDateFormat sd=new SimpleDateFormat("dd-MMM-yyyy");
      String st1=sd.format(new java.util.Date()).toString();

        session.setAttribute("dat",st1);
%>
<table border='0'>
   <tr>
	<th align='right'>Lecturer Id : </th>
<%    out.println("<td><input type='text' name='eno' value="+no+" size=10 disabled></td>");    %>
      </tr>
   <tr>
	<th align='right'>Lecturer Name : </th>
	<td><input type='text' name='ename' size=20></td>
      </tr>
   <tr>
	<th align='right'>Designation : </th>
	<td><select name='des'>
	          <option>Lecturer</option>
	          <option>HOD</option></select></td>
      </tr>
   <tr>
	<th align='right'>Department Number : </th>
	<td><select name='dno'>
<%
                try
	{
          String st="select Dept_Id from Departments where Status='Active'";
	ResultSet rs1=stmt.executeQuery(st);
	while(rs1.next())
	 {
	out.println("<option>"+rs1.getInt(1)+"</option>");
	 }
	
	}
                 catch(Exception e)
                  {   }
%>
	</select></td>
      </tr>
   <tr>
	<th align='right'>Date of Joining : </th>
<% out.println("<td><input type='text' name='jdate' size=10 value='"+st1+"' disabled></td>");   %>
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