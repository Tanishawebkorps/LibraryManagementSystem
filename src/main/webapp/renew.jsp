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
    <p>Renew-Book</p>
    <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("renewFail")){
        message="You Don't Have This Book Please Try Again With Book You Already Have !";
        msgColor="red";
    }
    if(msg!=null && msg.equals("renewmax")){
        message="You Can Reissue BooK Only For 5 Days Please Try Again !";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="centerItem">
    <form action="renewbook" validate >
        <div>
            <label>Enter Book Name</label><br>
            <input type="text" name="name" id="Name"  required><br><br>
        </div>
        <div>
            <label>Enter No of Days You Want To Extend (Max Days 5)</label><br>
            <input type="text" name=" extended_days" id="days"  required><br><br>
        </div>
        <div>
            <br><input type="submit" value="ReIssue Book">
             <br><br><input type="reset" value="Reset">
        </div>
    </form>
</div>
<a href="studentdashboard.jsp">Back to dashboard</a>		
</body>
</html>