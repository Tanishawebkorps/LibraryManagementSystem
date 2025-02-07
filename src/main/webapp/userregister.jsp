<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Cache-Control" content="no-cache">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
* {
	background-color: rgb(250, 240, 226);
}
a{
   text-decoration:none;
}
.centerItem {
	margin-top: 200px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
</style>
</head>

<body>
	<p>REGISTER-STUDENT</p>
	<%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("userRegFail")){
        message="Registration fail Please Try Again";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
	<div class="centerItem">
		<form action="registeruser" validate autocomplete="off">
			<div>
				<label>Enter Name</label><br> 
				<input type="text" name="studentName" id="Name"><br><br>
			</div>
			<div>
				<label>Enter Email</label><br>
				<br> <input type="email" name="studentEmail" id="Email"><br><br>
			</div>
			<div>
				<label>Enter Password</label><br>
				<br> <input type="password" name="studentPassword"
					id="Password"><br><br>
			</div>
			<div>
				<br>
				<input type="submit" value="submit"><br>
				  <br><input type="reset" value="Reset">
			</div>
		</form>
	</div>
	<a href="index.jsp">Back_To_DashBoard</a>
</body>
</html>