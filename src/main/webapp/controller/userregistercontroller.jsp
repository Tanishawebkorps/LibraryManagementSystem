<%@page import="com.liberarymanagement.daoimpl.StudentDaoImpl"%>
<%@page import="com.liberarymanagement.dao.StudentDao"%>
<%@page import="com.liberarymanagement.helper.Helper"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<jsp:useBean id="student"
class="com.liberarymanagement.entity.Students" scope="page">
</jsp:useBean>
<jsp:setProperty property="*" name="student"/>
<%
StudentDaoImpl daoImpl=new StudentDaoImpl();
if(daoImpl.registerStudent(student)){
   session.setAttribute("studentemail",student.getStudentEmail());	
   boolean b=Helper.sendEmail(student.getStudentEmail(),"student","studentdetails");
   if(b){
   response.sendRedirect("userlogin.jsp?msg=userRegSuccess");
}
   else{
		response.sendRedirect("userregister.jsp?msg=userRegFail");
	} 
}
else{
	response.sendRedirect("userregister.jsp?msg=userRegFail");
} 
%>
 
