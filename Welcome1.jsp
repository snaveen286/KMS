<body bgcolor='maroon' text='yellow'>
<center><h3>HOD profile</h3>
<%@ page language='java' import='java.sql.*' %>
<%
    try
     {
	int eid=Integer.parseInt((String)session.getAttribute("eid"));
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
         Statement stmt=cn.createStatement();
	String str="Select * from Employ where Emp_Id="+eid;
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
          java.util.Date dt=new java.util.Date();
         String[] mon={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String st1=dt.getDate()+"-"+mon[dt.getMonth()]+"-"+(dt.getYear()+1900);
%>
<table border='0'>
   <tr>
	<th align='right'>HOD Id : </th>
<%    out.println("<td>"+rs.getInt(1)+"</td>");    %>
      </tr>
   <tr>
	<th align='right'>HOD Name : </th>
<% out.println("<td>"+rs.getString(2)+"</td>"); %>
      </tr>
   <tr>
	<th align='right'>Designation : </th>
<% out.println("<td>"+rs.getString(3)+"</td>"); %>
      </tr>
   <tr>
	<th align='right'>Department Number : </th>
<%  out.println("<td>"+rs.getInt(4)+"</td>"); %>
   </tr>
   <tr>
	<th align='right'>Date of Joining : </th>
<% out.println("<td>"+st1+"</td>");   %>
      </tr>
   <tr>
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