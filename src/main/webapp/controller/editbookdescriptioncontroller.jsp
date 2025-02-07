<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.daoimpl.AdminDaoImpl"%>
<%@page import="com.liberarymanagement.dao.AdminDao"%>

<%
String name=request.getParameter("name");
String description =request.getParameter("description");
String author=request.getParameter("author");
String edition =request.getParameter("edition");
int quantity=0;
String squantity=request.getParameter("quantity");
if(squantity!=null && !squantity.isEmpty()){
	quantity=Integer.parseInt(request.getParameter("quantity"));
}
AdminDaoImpl daoImpl=new AdminDaoImpl();

if(daoImpl.editBookDescriptions(name , description ,author, edition , quantity)){
	response.sendRedirect("admindashboard.jsp?msg=editSuccess");
}
else{
	response.sendRedirect("editbookdescription.jsp?msg=editFail");
} 
%>