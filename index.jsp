<body bgcolor='pink' text='blue' onload='clear()'>
<form name='f1' method='post' action='Verification.jsp'>
<h1 style='position:absolute;left:120pt;top:20pt;font-family:forte'>KNOWLEDGE MANAGEMENT SYSTEM</h1>
<hr color='red' style='position:absolute;top:60pt'>
<hr color='red' style='position:absolute;top:63pt'>
<table border='1' style='position:absolute;top:80pt;left:110pt' bgcolor='orange'>
<%
		session.setAttribute("eid","0");		
		session.setAttribute("logname","0");
		session.setAttribute("des","0");	
		session.setAttribute("dno","0");
		session.setAttribute("pwd","0");
		session.setAttribute("ctype","0");
out.println("<script language='javascript'>");
   out.println("function clear(){");
out.println("history.clear();}</script>");
%>
<tr>
      <th>For Lecturers & Students Only :</th>
      <th><input type='radio' name='r1' value='Lecturer'>Lecturer</th>
      <th><input type='radio' name='r1' value='Student'>Student</th>
</tr>
</table>
<table bgcolor='orange' style='position:absolute;top:100pt;left:100pt'>
<tr>
      <th align='right'>UserName :</th>
       <td><input type='text' name='uname' size=15></td>
      <th align='right'>PassWord :</th>
       <td><input type='password' name='pwd' size=15></td>
       <td><input type='submit' value=' Sign In'></td>
</tr>
</table>
</b>
<img src='Images/Sample3.jpg' width='350' height='250' style='position:absolute;top:160pt;left:100pt'></img>
<marquee direction='up' width='300' style='text-align:justfy;text-indent:25pt;position:absolute;top:100pt;right:20pt;color:blue;font-weight:bold'scrollamount='2'>
Knowledge management system refers to the System for managing of the knowledge in an Organization, support creation, capture, store and dissemination of the information. The basic idea of KMS is to eanble employes to have ready access to the organization documented base of facts, source of information and solutions.</p>
</marquee>
</form>
</body>