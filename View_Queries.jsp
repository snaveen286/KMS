<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='View_Answers.jsp'>
<center><h3>Posted Queries</h3>
<%@ page language='java' import='java.sql.*,java.text.*' %>
<%
         try
          {
	String eid=(String)session.getAttribute("eid");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	java.util.Date dt=new java.util.Date();
	dt.setDate(dt.getDate()-2);
	SimpleDateFormat sd=new SimpleDateFormat("dd-MMM-yyyy");
	String st=sd.format(dt).toString();
String str="select QID,Question from Questions where Dept_Name=(Select DName from Employ where Emp_Id='"+eid+"') and Response='Active' and Q_Date=#"+st+"#";
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

str="select QID from Questions where Dept_Name=(Select DName from Employ where Emp_Id='"+eid+"') and Response='Active' and Q_Date=#"+st+"#";
//str="select QID from Questions where Dept_Name=(Select DName from Employ where Emp_Id='"+eid+"') and Response='Active'";
	//out.println(str);
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
out.println("<input type='submit' value=' VIEW ANSWER  '>");
          }
         catch(Exception e)
          {
	out.println("Error : "+e);
           }
%> 
</form>
</body>