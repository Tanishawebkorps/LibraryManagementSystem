<%@page import="com.liberarymanagement.daoimpl.AdminDaoImpl"%>
<%@page import="com.liberarymanagement.dao.AdminDao"%>
<%@page import="com.liberarymanagement.helper.Helper"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<jsp:useBean id="admin"
class="com.liberarymanagement.entity.Admin" scope="page">
</jsp:useBean>
<jsp:setProperty property="*" name="admin"/>
<%
AdminDaoImpl daoImpl=new AdminDaoImpl();

if(daoImpl.registerAdmin(admin)){
	    session.setAttribute("adminemail",admin.getAdminEmail());	
	    boolean b=Helper.sendEmail(admin.getAdminEmail(),"admin","admindetails");
	    if(b){
        response.sendRedirect("adminlogin.jsp?msg=adminRegSuccess");
}
}
	    else{
	    	response.sendRedirect("adminregister.jsp?msg=adminRegFail");
	    } 

%>
 
