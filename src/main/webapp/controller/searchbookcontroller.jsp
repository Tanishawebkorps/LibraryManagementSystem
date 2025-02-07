<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.daoimpl.StudentDaoImpl"%>
<%@page import="com.liberarymanagement.dao.StudentDao"%>	
<%@page import="java.util.List" %>	
<%@page import="com.liberarymanagement.entity.Books" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{ 
            background-color: rgb(250, 240, 226);
        }
          .centerItem{
            margin-top: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
      table, th, td {
      border-collapse: collapse;
      align-items: center;
      border:1px solid black;
}
th, td {
  padding: 15px;
}
</style>
</head>
<body>
 <%  
      String authore =request.getParameter("authore");
	StudentDao daoImpl = new StudentDaoImpl();
	List <Books> lst =daoImpl.searchBook(authore);
		if(lst!=null && !lst.isEmpty()){ %>
    <div class="centerItem">
	<table>
	<thead> 
	<tr>
	<th>Name</th>
	<th>Authore</th>
	<th>Edition</th>
	<th>Description</th>
	<th>Quantity</th>
	<th>Available Book</th>
	</tr>
	</thead>
	 <tbody>  
	 <%for(Books book :lst){ %>       
	  <tr>
                        <td><%= book.getName() %></td>
                        <td><%= book.getAuthor() %></td>
                         <td><%= book.getEdition() %></td>
                        <td><%= book.getDescription() %></td>
                        <td><%= book.getQuantity() %></td>
                        <td><%= book.getRemaining() %></td>
                     </tr>
                     
                     <% } %>
               </tbody>
	</table>
	</div>	
	<a href="studentdashboard.jsp">Back to dashboard</a>	
	<% 				}
		else if(lst==null || lst.isEmpty()){ %>
		<div class="centerItem">
			<p style="color: red;" >No Book Present With This Authore Name Please Try Again ! </p>
			<a href="studentdashboard.jsp">Back to dashboard</a>
	   </div>
	<% 	}	
%>
</body>
</html>  