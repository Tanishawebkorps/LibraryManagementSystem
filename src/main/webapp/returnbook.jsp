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
    <p>Return-Book</p>
    <% 
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("returnFail")){
        message="You Don't Book With This Name Please Enter Valid Book Name That You Have Try Again !";
        msgColor="red";
    }
    %>
    <p style="color:<%= msgColor %>; text-align:center"><%=message%></p>
    <div class="centerItem">
    <form action="returnbook" validate >
        <div>
            <label>Enter Book Name</label><br>
            <input type="text" name="name" id="Name"  required><br><br>
        </div>
        <div>
            <br><input type="submit" value="Return To Liberary">
             <br><br><input type="reset" value="Reset">
        </div>
    </form>
</div>
<a href="studentdashboard.jsp">Back to dashboard</a>
</body>
</html>