<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
            if(!session.isNew() || session.getAttribute("ADMIN") != null){
            	session.setAttribute("ADMIN", null);
            	session.invalidate();
            	
            	response.sendRedirect("index.jsp?msg=adminlogoutSuccess");
            }
            else {
            	response.sendRedirect("adminlogin.jsp?msg=loginFirst");
            }
            %>