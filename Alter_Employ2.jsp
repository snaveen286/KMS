<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
        String no=(String)session.getAttribute("no");
	String ename=request.getParameter("t2");
	String des=request.getParameter("t3");
	String dno=request.getParameter("t4");
	String dname=request.getParameter("t5");
String str="update Employ set EName='"+ename+"',Designation='"+des+"',Dept_No="+dno+",DName='"+dname+"' where Emp_Id='"+no+"'";
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	stmt.executeUpdate(str);
  out.println("<center><b><br><br>Lecturer Details Updated Successfully....");
	stmt.close();
	cn.close();
        }
        catch(Exception e)
        {
         out.println("Error : "+e);
         }
%>
</body>