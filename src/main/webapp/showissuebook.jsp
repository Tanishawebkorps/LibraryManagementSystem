<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.entity.Books"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.liberarymanagement.dao.AdminDao"%>
<%@page import="com.liberarymanagement.daoimpl.AdminDaoImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Issued Books</title>
<style>
* {
	background-color: rgb(250, 240, 226);
}

.centerItem {
	margin-top: 200px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

table, th, td {
    border-collapse: collapse;
	align-items: center;
	border: 1px solid black;
}
th, td {
  padding: 15px;
}
</style>
<script>
function showStudent(stuemail, btn) {
	 var emailText = document.createTextNode(" " + stuemail);  // Adding space before email for separation
	    
	    // Insert the student's email just after the button
	    btn.parentNode.insertBefore(emailText, btn.nextSibling);
	    
	    // Disable the button after it's clicked
	    btn.disabled = true;
}
</script>
</head>
<body>
	<%
	AdminDao daoImpl = new AdminDaoImpl();
	Map<String, String> map = daoImpl.getIssuedBooks();
	if (map != null && !map.isEmpty()) {
	%>

	<div class="centerItem">
		<%
		Set<Entry<String, String>> set = map.entrySet();
		for (Entry<String, String> e : set) {
		%>
		<!-- The button displays the book name, and on click it shows the student name and disables the button -->
		<button onclick="showStudent('<%= e.getValue() %>', this)"> <%= e.getKey() %> </button>
		<%
		}
		%>
	</div>
	<a href="admindashboard.jsp">Back to dashboard</a>

	<%
	} else {
		response.sendRedirect("admindashboard.jsp?msg=noBookIssue");
	}
	%>
</body>
</html>
