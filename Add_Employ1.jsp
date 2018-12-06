<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
          try
            {
	String eno=(String)session.getAttribute("eno");
	String jdate=(String)session.getAttribute("dat");
	String ename=request.getParameter("ename");
	String des=request.getParameter("des");
	int dno=Integer.parseInt(request.getParameter("dno"));
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");

if(ename.length()!=0 && des.length()!=0 && uname.length()!=0 && pwd.length()!=0)
  {
   String str="select Dept_Name from Departments where Dept_Id="+dno;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	String dname="";
	if(rs.next())
	 {
	   	dname=rs.getString(1);
	 }

	int c=0;
               if(des.equals("Authoriser"))
	 {
	str="select * from Employ where Designation='Authoriser' and Dept_No="+dno;
	rs=stmt.executeQuery(str);
	if(rs.next())
	      c++;
                     }

	if(c==0)
	 {
                str="select * from Employ where UName='"+uname+"' or Pword='"+pwd+"'";
	rs=stmt.executeQuery(str);
	int d=0;
	if(rs.next())
	      d++;

 	if(d==0)
	 {
str="insert into Employ values("+Integer.parseInt(eno)+",'"+ename+"','"+des+"',"+dno+",'"+dname+"','"+jdate+"','Active','"+uname+"','"+pwd+"')";
	stmt.executeUpdate(str);
                out.println("<center><br><br><b>Lecturer Record Inserted Successfully...</b>");
	 }
	else
	 {
	out.println("<center><br><br><b>UserName/Password already Exists...</b>");
	 }
	 }
	else
	 {
 out.println("<center><br><br><b>Authoriser Already Available for this department....</b>");
	 }
	stmt.close();
	cn.close();
           }
          else
            {
              out.println("<center><br><br><b>InComplete Lecturer Data is Specified..</b>");
            }
             }
            catch(Exception e)
             {
	out.println("<center><br><br>InValid Lecturer Information to Add...</b>");
              }
%>