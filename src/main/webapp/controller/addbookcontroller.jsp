<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.entity.Books" %>
<%@page import="com.liberarymanagement.daoimpl.AdminDaoImpl"%>
<%@page import="com.liberarymanagement.dao.AdminDao"%>
<jsp:useBean id="book" 
class="com.liberarymanagement.entity.Books" scope="page">
</jsp:useBean>
<jsp:setProperty property="*" name="book"/>
<%
AdminDaoImpl daoImpl=new AdminDaoImpl();

if(daoImpl.addBook(book)){
	response.sendRedirect("admindashboard.jsp?msg=addSuccessfully");
}
else{
	response.sendRedirect("addbook.jsp?msg=addFail");
} 
%>