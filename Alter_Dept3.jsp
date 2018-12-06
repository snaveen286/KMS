<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
      {
                  String no=(String)session.getAttribute("no");
	String dname=request.getParameter("t2").trim();
	String desc=request.getParameter("t3").trim();

	if(dname.length()!=0 && desc.length()!=0)
	 {
String str="update Departments set Dept_Name='"+dname+"',Work='"+desc+"' where Dept_Id="+Integer.parseInt(no);
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	stmt.executeUpdate(str);
  out.println("<CENTER><b><br><br>Department Details Updated Successfully....");
	stmt.close();
	cn.close();
	 }
	else
	 {
     out.println("<center><br><br><b>InComplete Department Information to Update...</b>");
	 }
         }
      catch(Exception e)
        {
          out.println("<center><br><br><b>InValid Department Information to Update...</b>");
         }
%>
</body>