<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.daoimpl.StudentDaoImpl"%>
<%@page import="com.liberarymanagement.dao.StudentDao"%>			
<% 

if(session.getAttribute("studentemail")!=null){
      String name=request.getParameter("name");
      String stuemail =(String)session.getAttribute("studentemail"); 
	StudentDao daoImpl = new StudentDaoImpl();
		if(daoImpl.returnBook(name, stuemail)){
			response.sendRedirect("studentdashboard.jsp?msg=returnSuccess");
		}
		else{
			response.sendRedirect("returnbook.jsp?msg=returnFail");
		}
}
else{
	response.sendRedirect("index.jsp?msg=loginfirst");
}
%>  