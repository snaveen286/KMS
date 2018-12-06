<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='View_Articles1.jsp'>
<center><h3>Posted Articles</h3>
<%@ page language='java' import='java.sql.*' %>
<%
         try
          {
	String eid=(String)session.getAttribute("eid");
	java.util.Date dt=new java.util.Date();
String[] mon={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String st1=dt.getDate()+"-"+mon[dt.getMonth()]+"-"+(dt.getYear()+1900);
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
String str="select Article_Id,Subject from Articles where DeptName=(Select Dept_Name from Students where Reg_No='"+eid+"')";
	ResultSet rs=stmt.executeQuery(str);
	out.println("<table border='1' width='90%'>");
out.println("<tr><th>Article Id</th><th>Subject</th></tr>");
	while(rs.next())
	{
	 out.println("<tr><th>"+rs.getInt(1)+"</th>");
	out.println("<td>"+rs.getString(2)+"</td></tr>");
	 }
	out.println("</table>");

str="select Article_Id from Articles where DeptName=(Select Dept_Name from Students where Reg_No='"+eid+"')";
	 rs=stmt.executeQuery(str);
	out.println("<br><b>Select the Article Id to View :</b>");
	out.println("<select name='qid'>");
	while(rs.next())
	 {
 	           out.println("<option>"+rs.getString(1)+"</option>");
	 }
	out.println("</select>");
	stmt.close();
	cn.close();
	out.println("<br><br>");
out.println("<input type='submit' value=' View Article  '>");
          }
         catch(Exception e)
          {
	out.println("Error : "+e);
           }
%> 
</form>
</body>