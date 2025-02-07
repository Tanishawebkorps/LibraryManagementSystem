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
    <p>REGISTER-ADMIN</p>
    <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("adminRegFail")){
        message="Registration fail Please Try Again";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="centerItem">
    <form action="registerAdmin" validate >
        <div>
            <label>Enter Name</label><br>
            <input type="text" name="adminName" id="Name"><br><br>
        </div>
        <div>
            <label>Enter Name Of Liberary</label><br>
            <input type="text" name="liberaryName" id="Liberary"><br><br>
        </div>
         <div>
            <label>Enter Password</label><br>
            <input type="password" name="adminPassword" id="Password"><br><br>
        </div>
         <div>
            <label>Enter Address</label><br>
            <input type="text" name="adminAddress" id="Address"><br><br>
        </div>
        <div>
            <label>Enter Email</label><br>
            <input type="email" name="adminEmail" id="Email"><br><br>
        </div>
        <div>
            <br><input type="submit" value="submit"><br><br>
            <input type="reset" value="Reset">
        </div>
    </form>
</div>
<a href="index.jsp">Back_To_DashBoard</a>
</body>
</html>