<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
          try
            {
	String eno=request.getParameter("eno");
	String ename=request.getParameter("ename");
	String dname=request.getParameter("dname");
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");

if(ename.length()!=0 && uname.length()!=0 && pwd.length()!=0)
  {
   String str="select * from Students where Reg_No='"+eno+"'";
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	int c=0;
	if(rs.next())
	 {
	   	c++;
	 }
	
	if(c==0)
	 {
str="insert into Students values('"+eno+"','"+ename+"','"+dname+"','"+uname+"','"+pwd+"','Active')";
	stmt.executeUpdate(str);
                out.println("<center><b>Student Information Added Successfull...</b>");
	 }
	else
	 {
	out.println("<center><b>UserName/Password already Exists...</b>");
	 }
	stmt.close();
	cn.close();
           }
          else
            {
              out.println("<center><b>InComplete Student Data is Specified..</b>");
            }
             }
            catch(Exception e)
             {
	out.println("<center><b>Invalid Student Information to Add..</b>"+e);
              }
%>