<body bgcolor='maroon' text='yellow'>
<form name='f1' method='get' action='Set_Article1.jsp'>
<%@ page language='java' import='java.sql.*' %>
<%
    int no=0;
      Connection cn=null;
       Statement stmt=null;
       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        cn=DriverManager.getConnection("jdbc:odbc:KMSC");
         stmt=cn.createStatement();
    try
     {
	String str="select Max(Article_Id) from Articles";
	ResultSet rs=stmt.executeQuery(str);
	if(rs.next())
	 {
	        no=Integer.parseInt(rs.getString(1))+1;
	 }
      }
     catch(Exception e)
     {
	no=1;
      }
        session.setAttribute("qno",String.valueOf(no));

          java.util.Date dt=new java.util.Date();
         String[] mon={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String st1=dt.getDate()+"-"+mon[dt.getMonth()]+"-"+(dt.getYear()+1900);

        session.setAttribute("dat",st1);
%>
<center>
<table>
     <tr>
	<th align='right'>Article Id :</th>
<% out.println("<td><input type='text' name='t1' size=10 disabled value='"+no+"'></td>");   %>
      </tr>
     <tr>
	<th align='right'>Entry Date :</th>
<%  out.println("<td><input type='text' name='t2' size=15 disabled value='"+st1+"'></td>");  %>
      </tr>
     <tr>
	<th align='right'>Article Subject :</th>
	<td><input type='text' name='t3' size='40'></td>
      </tr>
     <tr>
	<th align='right'>Article :</th>
	<td><textarea name='t4' rows=5 cols=40></textarea></td>
      </tr>
</table>
<br>
<input type='submit' value='  SUBMIT  '>
</form>
</body>