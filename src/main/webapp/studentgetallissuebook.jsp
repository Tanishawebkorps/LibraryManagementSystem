<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.liberarymanagement.entity.Books"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.liberarymanagement.dao.StudentDao"%>
<%@page import="com.liberarymanagement.daoimpl.StudentDaoImpl"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Issued Books</title>
    <style>
        *{ 
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
</head>
<body>
<%
    String email = (String) session.getAttribute("studentemail");
    System.out.println(email);
    StudentDao daoImpl = new StudentDaoImpl();
    Map<String, String> map = daoImpl.getIssuedBooks(email);

    if (map != null && !map.isEmpty()) {  // Added null and empty check for map
        Set<Entry<String, String>> eset = map.entrySet();
%>
<div class="centerItem">
    <table>
        <thead> 
            <tr>
                <th>Name</th>
                <th>Details</th>
            </tr>
        </thead>
        <tbody>  
            <% for (Entry<String, String> e : eset) { %>       
            <tr>
                <td><%= e.getKey() %></td>
                <td><%= e.getValue() %></td>
            </tr>          
            <% } %>
        </tbody>
    </table>
</div>  
<a href="studentdashboard.jsp">Back to dashboard</a>        
<% 
    } else {
        response.sendRedirect("studentdashboard.jsp?msg=noBookIssue");
    }   
%>
</body>
</html>
