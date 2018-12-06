<%@ page language='java' import='java.sql.*' %>
<%
        try
          {
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
	String r1=request.getParameter("r1");

	if(uname.length()!=0 && pwd.length()!=0)
	 {
	if(uname.equals("Admin") && pwd.equals("Admin"))
	  {
          		session.setAttribute("logname","Administrator");
		response.sendRedirect("AdminForm.jsp");		
	   }
	else if(r1.equals("Student"))
	 {
	   int c=0;
	    try
	      {
String str="select Reg_No,SName,Dept_Name from Students where UName='"+uname+"' and PWord='"+pwd+"' and Status='Active'";
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	
	if(rs.next())
	 {
		c++;
		session.setAttribute("eid",rs.getString(1));		
		session.setAttribute("logname1",rs.getString(2));
		session.setAttribute("dno",rs.getString(3));
		session.setAttribute("des","Student");	
		session.setAttribute("pwd",pwd);
		session.setAttribute("ctype","Student");
  	}
	stmt.close();
	cn.close();
	       }
	      catch(Exception e)
	       {

	        }

	if(c==0)
	 {
session.setAttribute("msg","Invalid UserName/Password are Entered...");
		response.sendRedirect("ErrorPage.jsp");	
	 }
                    else
	  {
	           response.sendRedirect("StudentsForm.jsp");
	 }
	 }
	else if(r1.equals("Lecturer"))
	 {
	   int c=0;
	    try
	      {
String str="select Emp_Id,EName,Designation,DName from employ where UName='"+uname+"' and PWord='"+pwd+"' and Status='Active'";
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	
	if(rs.next())
	 {
		c++;
		session.setAttribute("eid",rs.getString(1));		
		session.setAttribute("logname",rs.getString(2));
		session.setAttribute("des",rs.getString(3));	
		session.setAttribute("dno",rs.getString(4));
		session.setAttribute("pwd",pwd);
		session.setAttribute("ctype","Employ");
  	}
	stmt.close();
	cn.close();
	       }
	      catch(Exception e)
	       {

	        }

	if(c==0)
	 {
session.setAttribute("msg","Invalid UserName/Password are Entered...");
		response.sendRedirect("ErrorPage.jsp");	
	 }
                    else
	  {
	            String st=(String)session.getAttribute("des");
	          if(st.equals("Lecturer"))
	                 response.sendRedirect("LecturerForm.jsp");
	          else
			response.sendRedirect("HODForm.jsp");

	 }
                   }
	else
	 {
session.setAttribute("msg","Invalid UserName/Password are Entered...");
		response.sendRedirect("ErrorPage.jsp");	
	 }
	 }
                   else
	 {

          session.setAttribute("msg","UserName/PassWord Not Entered...");
		response.sendRedirect("ErrorPage.jsp");
	 }
           }
          catch(Exception e)
           {

session.setAttribute("msg","Invalid UserName/Password are Entered...");
		response.sendRedirect("ErrorPage.jsp");	
           }
%>