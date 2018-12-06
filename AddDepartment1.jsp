<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
	String x=(String)session.getAttribute("dno");
	int no=Integer.parseInt(x);
	String dname=request.getParameter("dname");
	String work=request.getParameter("work");

	if(dname.length()!=0 && work.length()!=0)
	 {
String str="insert into Departments values("+no+",'"+dname+"','"+work+"','Active')";
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	stmt.executeUpdate(str);
        out.println("<center><br><br><b>Department Details Registered Successfully...</b></center>");
	stmt.close();
	cn.close();
	 }
	else
	 {
         out.println("<b>InComplete Department Details are passed..</b>");
	 }
        }
       catch(Exception e)
        {
                 out.println("<b>InValid Department Information to Add...");
         }
%>