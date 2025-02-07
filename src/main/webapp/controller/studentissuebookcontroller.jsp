<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.daoimpl.StudentDaoImpl"%>
<%@page import="com.liberarymanagement.dao.StudentDao"%>			
<% 
String name =request.getParameter("name");
String studentemail =(String)session.getAttribute("studentemail");   
int days =Integer.parseInt(request.getParameter("days"));
if(days<=10){
	StudentDao daoImpl = new StudentDaoImpl();
	
		if(daoImpl.issueBook(name, studentemail, days)){
			response.sendRedirect("studentdashboard.jsp?msg=issueSuccess");
		}
		else{
			response.sendRedirect("studentissuebook.jsp?msg=issueFail");
		}
}
else{
	response.sendRedirect("studentissuebook.jsp?msg=issuemax");
}
%>  