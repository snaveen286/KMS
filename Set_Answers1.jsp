<body bgcolor='maroon' text='yellow'>
<%
          String res=request.getParameter("res");

         if(!res.equals("none"))
          {
	session.setAttribute("res",res);
	 response.sendRedirect("Set_Response.jsp");
           }
          else
           {
	response.sendRedirect("Set_Authoriser_Response.jsp");
            }
%>
</body>