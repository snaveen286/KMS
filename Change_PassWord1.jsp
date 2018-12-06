<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
   try
    {
	String t1=request.getParameter("t1");
	String t2=request.getParameter("t2");
	String t3=request.getParameter("t3");

        if(t1.length()!=0 && t2.length()!=0 && t3.length()!=0)
         {
      Connection cn=null;
       Statement stmt=null;
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
cn=DriverManager.getConnection("jdbc:odbc:KMSC");
         stmt=cn.createStatement();

	String pwd=(String)session.getAttribute("pwd");
	String ctype=(String)session.getAttribute("ctype");
	if(pwd.equals(t1))
	 {
	         if(t2.equals(t3))
	          {
		if(ctype.equals("Employ"))
	                   {
	String eid=(String)session.getAttribute("eid");
	String str="Select * from Employ where PWord='"+t2+"'";
	ResultSet rs=stmt.executeQuery(str);
	int c=0;
	if(rs.next())
	   c++;
	
	 if(c==0)
	  {
       str="update Employ set PWord='"+t2+"' where Emp_Id='"+eid+"'";
	stmt.executeUpdate(str);
	out.println("<b>PassWord is Changed Successfully...</b>");
	session.setAttribute("pwd",t2);
	  }
	else
	 {
	out.println("<b>PassWord Already Exists....</b>");	
	 }
		 }
		else
		 {
	String eid=(String)session.getAttribute("eid");
	String str="Select * from Students where PWord='"+t2+"'";
	ResultSet rs=stmt.executeQuery(str);
	int c=0;
	if(rs.next())
	   c++;
	
	 if(c==0)
	  {
str="update Students set PWord='"+t2+"' where Reg_No='"+eid+"'";
	stmt.executeUpdate(str);
	out.println("<b>PassWord is Changed Successfully...</b>");
	session.setAttribute("pwd",t2);
	  }
	else
	 {
	out.println("<b>PassWord Already Exists....</b>");	
	 }
		 }
   	           }
	          else
	            {
	out.println("<b>New PassWord/Confirm PassWord Does Not Match...</b>");
	             }
	 }
	else
	 {
	out.println("<b>Old PassWord Does Not Match...</b>");
	 }
          }
         else
          {
              out.println("<b>InComplete Values to Change PassWord..</b>");
          }
      }
     catch(Exception e)
      {
	out.println("<b>Error : "+e+"</b>");
      }
%>
</body>