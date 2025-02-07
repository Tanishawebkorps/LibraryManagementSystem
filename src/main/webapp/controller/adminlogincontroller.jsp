<%@page import="com.liberarymanagement.daoimpl.AdminDaoImpl"%>
<%@page import="com.liberarymanagement.dao.AdminDao"%>	
<%@page import="java.util.regex.*" %>			
<% 
Long id=0l;
String i=request.getParameter("id");
if( i.matches("[0-9]+")){
  id=Long.parseLong(i);
}
String password =request.getParameter("password");
AdminDao daoImpl = new AdminDaoImpl();
       if( id instanceof Long){   
		if(daoImpl.loginAdmin(id, password)){
			session.setAttribute("ADMIN", id);
			response.sendRedirect("admindashboard.jsp?msg=adminLoginSuccess");
		}
		else{
			response.sendRedirect("adminlogin.jsp?msg=adminLoginError");
		}
       }
		else{
			response.sendRedirect("adminlogin.jsp?msg=adminLoginError");
		}	
%>