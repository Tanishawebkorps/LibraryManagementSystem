<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.daoimpl.StudentDaoImpl"%>
<%@page import="com.liberarymanagement.dao.StudentDao"%>			
<% 
System.out.println("renew book"+session.getAttribute("studentemail"));
      String name=request.getParameter("name");
      String stuemail =(String)session.getAttribute("studentemail"); 
      int extended_days =Integer.parseInt(request.getParameter(" extended_days"));
     if(extended_days<=5){
	StudentDao daoImpl = new StudentDaoImpl();
		if(daoImpl.renewBook(name, stuemail, extended_days)){
			response.sendRedirect("studentdashboard.jsp?msg=renewSuccess");
		}
		else{
			response.sendRedirect("renew.jsp?msg=renewFail");
		}
		}
     else{
    	 response.sendRedirect("renew.jsp?msg=renewmax");
     }
%>  