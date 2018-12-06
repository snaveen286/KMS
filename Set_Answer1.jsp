<body bgcolor='maroon' text='yellow'>
<%@ page language='java' import='java.sql.*' %>
<%
         try
          {
	int qid=Integer.parseInt((String)session.getAttribute("qid"));
	String que=(String)session.getAttribute("que");
	String ans=request.getParameter("ans");

	if(ans.length()!=0)
	 {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:KMSC");
	Statement stmt=cn.createStatement();
String st="select Max(SlNo) from Responses";
	ResultSet rs=stmt.executeQuery(st);
	int no=0;
	try
	 {
	if(rs.next())
	 {	
	         no=Integer.parseInt(rs.getString(1))+1;
	 }
	}
	catch(Exception e)
	 {
	       no=1;
	 }

   String str="insert into Responses values("+no+","+qid+",'"+que+"','"+ans+"')";
	stmt.executeUpdate(str);
	out.println("<b>Response is Set Successfully...</b>");
	stmt.close();
	cn.close();
	 }
	else
	 {
	out.println("<b>Response is Not Set...</b>");
	 }
              }
             catch(Exception e)
              {
	out.println("Error : "+e);
               }
%>
</body>