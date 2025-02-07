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
        a{
   text-decoration:none;
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
    <p>Login-Admin</p>
    <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("adminRegSuccess")){
        message="Registration successfully";
        msgColor="green";
    }
    else if(msg!=null && msg.equals("adminLoginError")){
        message="Admin Login Fail Try Again With Valid Credentials ! ";
        msgColor="red";
    }
    else if(msg!=null && msg.equals("loginFirst")){
        message="You Need To Login First !";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="centerItem">
        <form action="loginadmin" >
            <div>
            <label>Enter Membership Number</label><br><br>
            <input type="text" name="id" id="num">
            </div>
            <div>
            <br> <label>Enter Password</label><br><br>
            <input type="password" name="password" id="pass">
            </div>
            <div>
                <br><br><input type="submit" value="submit">
                 <br><br><input type="reset" value="Reset">
            </div>
        </form>
    </div>
    <a href="index.jsp">Back_To_DashBoard</a>
</body>
</html>