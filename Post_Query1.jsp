<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
    try
     {
	String eid=(String)session.getAttribute("eid");
	String dno=(String)session.getAttribute("dno");
	int qno=Integer.parseInt((String)session.getAttribute("qno"));
	String qdate=(String)session.getAttribute("dat");
	String quo=request.getParameter("t3");
	String dname=request.getParameter("dname");

                if(quo.length()!=0)
	{
	java.util.Date dt=new java.util.Date();
	dt.setDate(dt.getDate()+2);

String[] mon={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String dt1=dt.getDate()+"-"+mon[dt.getMonth()]+"-"+(dt.getYear()+1900);
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

	String str="insert into Questions(QID,Question,Q_Date,Emp_ID,Dept_No,Dept_Name,Response,Res_Date) values("+qno+",'"+quo+"','"+qdate+"','"+eid+"','"+no+"','"+dname+"','Active','"+dt1+"')";
	//out.println(str);
	stmt.executeUpdate(str);
	stmt.close();
	cn.close();
	out.println("<b>Query Posted Successfully....</b>");
                   }
                 else
	 {
		out.println("<b>Query Not Specified...</b>");
	 }
      }
     catch(Exception e)
       {
	out.println("<b>Error : "+e);
        }
%>
</body>