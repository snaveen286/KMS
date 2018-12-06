<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
                  String no=(String)session.getAttribute("no");
	String sname=request.getParameter("t2");
	String dname=request.getParameter("t3");

String str="update Students set SName='"+sname+"',Dept_Name='"+dname+"' where Reg_No='"+no+"'";
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	stmt.executeUpdate(str);
  out.println("<b><br><br>Students Details Updated Successfully....");
	stmt.close();
	cn.close();
         }
      catch(Exception e)
        {
	out.println("Error : "+e);
         }
%>
</body>                