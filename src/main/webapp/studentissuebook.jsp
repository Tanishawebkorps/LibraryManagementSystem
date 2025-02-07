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
    <p>Issue-Book</p>
    <% 
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("issueFail")){
        message="Book is Already Issued Please try Again ! ";
        msgColor="red";
    }
    if(msg!=null && msg.equals("issuemax")){
        message="You Can Only Issue Book For 10 Days! ";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="centerItem">
    <form action="issuebook" validate >
        <div>
            <label>Enter Book Name</label><br><br>
            <input type="text" name="name" id="name"  required><br>
        </div>
        <div>
            <label>Enter Days (You Want To Keep Book Max Of Days (10) )</label><br><br>
            <input type="text" name="days" id="days" ><br>
        </div>
        <div>
            <br><input type="submit" value="Issue Book"> 
            <br><br><input type="reset" value="Reset">
            
        </div>
    </form>
</div>
<a href="studentdashboard.jsp">Back to dashboard</a>
</body>
</html>