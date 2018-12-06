<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Set1_Answer.jsp'>
<center><h3>Posted Queries</h3>
<%@ page language='java' import='java.sql.*' %>
<%
         try
          {
	int eid=Integer.parseInt((String)session.getAttribute("eid"));

	java.util.Date dt=new java.util.Date();
String[] mon={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String st1=dt.getDate()+"-"+mon[dt.getMonth()]+"-"+(dt.getYear()+1900);
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	String dno=(String)session.getAttribute("dno");
String str="select QID,Question from Questions where Dept_Name='"+dno+"' and Response='Active' and Res_Date>#"+st1+"#";
	//out.println(str);
	ResultSet rs=stmt.executeQuery(str);
	out.println("<table border='1' width='90%'>");
out.println("<tr><th>Question Id</th><th>Question</th></tr>");
	while(rs.next())
	{
	 out.println("<tr><th>"+rs.getInt(1)+"</th>");
	out.println("<td>"+rs.getString(2)+"</td></tr>");
	 }
	out.println("</table>");

str="select QID from Questions where Dept_Name='"+dno+"' and Response='Active' and Res_Date>#"+st1+"#";
	 rs=stmt.executeQuery(str);
	out.println("<br><b>Select the Question Id to Answer :</b>");
	out.println("<select name='qid'>");
	while(rs.next())
	 {
 	           out.println("<option>"+rs.getString(1)+"</option>");
	 }
	out.println("</select>");
	stmt.close();
	cn.close();
	out.println("<br><br>");
out.println("<input type='submit' value=' SET ANSWER  '>");
          }
         catch(Exception e)
          {
	out.println("Error : "+e);
           }
%> 
</form>
</body>