<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
     {
	String eid=(String)session.getAttribute("eid");
	String dno=(String)session.getAttribute("dno");
	int aid=Integer.parseInt((String)session.getAttribute("qno"));
	String qdate=(String)session.getAttribute("dat");
	String sub=request.getParameter("t3");
	String art=request.getParameter("t4");

                if(sub.length()!=0 && art.length()!=0)
	{
	String st="Select Dept_Id from departments where Dept_Name='"+dno+"'";
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
	ResultSet rs=stmt.executeQuery(st);	
	int no=0;
	if(rs.next())
	 {	
		no=rs.getInt(1);
	 }

	String str="insert into Articles values("+aid+",'"+eid+"','"+dno+"','"+qdate+"','"+sub+"','"+art+"')";
	//out.println(str);
	stmt.executeUpdate(str);
	stmt.close();
	cn.close();
	out.println("<b>Article Submitted Successfully....</b>");
                   }
                 else
	 {
		out.println("<b>InComplete Article Details to Submit...</b>");
	 }
      }
     catch(Exception e)
       {
	out.println("<b>Error : "+e);
        }
%>
</body>