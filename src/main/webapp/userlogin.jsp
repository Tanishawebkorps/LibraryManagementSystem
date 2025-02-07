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
    <p>Login-Student</p>
    <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("userRegSuccess")){
        message="Registration successfully !";
        msgColor="green";
    }
    else if(msg!=null && msg.equals("userLoginFail")){
        message="Login Fail Please Try Again With Valid Credentials !";
        msgColor="Red";
    }
    else if(msg!=null && msg.equals("loginFirst")){
        message="You Need To Login First ! ";
        msgColor="Red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="centerItem">
        <form action="loginstudent" validate>
            <div>
            <label>Enter Membership Number</label><br><br>
            <input type="text" name="id" id="num" required>
            </div>
            <div>
            <br> <label>Enter Password</label><br><br>
            <input type="password" name="password" id="pass" required>
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