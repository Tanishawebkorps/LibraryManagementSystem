<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.daoimpl.AdminDaoImpl"%>
<%@page import="com.liberarymanagement.dao.AdminDao"%>			
<% 
      String name =request.getParameter("name");
	AdminDao daoImpl = new AdminDaoImpl();
		if(daoImpl.deleteBook(name)){
			response.sendRedirect("admindashboard.jsp?msg=deleteSuccess");
		}
		else{
			response.sendRedirect("deletebook.jsp?msg=deleteFail");
		}	
%>