<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.daoimpl.StudentDaoImpl"%>
<%@page import="com.liberarymanagement.dao.StudentDao"%>
<%@page import="java.util.regex.*" %>			
<% 
Long id=0l;
String i=request.getParameter("id");
if( i.matches("[0-9]+")){
  id=Long.parseLong(i);
}
     String password =request.getParameter("password");
	StudentDao daoImpl = new StudentDaoImpl();
	String e=daoImpl.loginStudent(id, password);
		if(e!=null && id instanceof Long){
			session.setAttribute("studentemail",e);	
			session.setAttribute("USER", id);
			response.sendRedirect("studentdashboard.jsp?msg=userLoginSuccess");
		}
		else{
			response.sendRedirect("userlogin.jsp?msg=userLoginFail");
		}	
%>  