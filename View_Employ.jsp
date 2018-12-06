<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
       try
        {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	String str="select * from Employ where Status='Active'";
	ResultSet rs=stmt.executeQuery(str);
	out.println("<center><h2 style='font-family:forte'>STAFF INFORMATION</h2>");
	out.println("<table border='1' width='100%'>");
out.println("<tr><th>Emp No</th><th>EmpName</th><th>Designation</th><th>Dept No</th><th>Dept Name</th><th>Joined Date</th></tr>");
	while(rs.next())
	 {
	out.println("<tr><td>"+rs.getInt(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getInt(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
          java.util.Date dt=rs.getDate(6);
         String[] mon={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String st1=dt.getDate()+"-"+mon[dt.getMonth()]+"-"+(dt.getYear()+1900);
	out.println("<td>"+st1+"</td></tr>");
	 }
	out.println("</table>");
	stmt.close();
	cn.close();
          }
         catch(Exception e)
           {

           }
 %>