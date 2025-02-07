<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
     </style>
</head>
<body>
    <p>Delete-Book</p>
    <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("deleteFail")){
        message="Book Is Not Present With This Name Please Try Again With Valid Book Name That Exist !";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="centerItem">
    <form action="deletebook" validate >
        <div>
            <label>Enter Book Name</label><br>
            <input type="text" name="name" id="Name"  required><br><br>
        </div>
        <div>
            <br><input type="submit" value="Delete Book">
             <br><br><input type="reset" value="Reset">
        </div>
    </form>
    </div>
    <a href="admindashboard.jsp">Back to dashboard</a>		
</body>
</html>