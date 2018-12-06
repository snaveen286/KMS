<%
     String st=(String)session.getAttribute("logname");
      if(st!="0")
       {
out.println("<frameset rows='23%,77%' border='1'>");
        out.println("<frame name='f1' noresize src='Heading.jsp'>");
       out.println(" <frameset cols='25%,75%'>");
out.println("<frame name='f2' noresize src='AdminList.jsp'>");
	out.println("<frame name='f3' noresize src='Welcome.jsp'>");
out.println("</frameset></frameset>");
       }
      else
       {
	response.sendRedirect("index.jsp");
        }
%>