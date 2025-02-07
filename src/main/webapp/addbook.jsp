<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>add book</title>
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
    <p>Add-New-Book</p>
    <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("addFail")){
        message="Book Already Present With This Name Please Add Any Other Book !";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="centerItem">
    <form action="addbook" validate >
        <div>
            <label>Enter Book Name</label><br>
            <input type="text" name="name" id="Name"  required><br><br>
        </div>
        <div>
            <label>Enter Authore Name</label><br>
            <input type="text" name="author" id="author"  required><br><br>
        </div>
        <div>
            <label>Enter Edition </label><br>
            <input type="text" name="edition" id="edition" ><br><br>
        </div>
        <div>
            <label>Enter Description (Max Characters 50)</label><br>
            <input type="text" name="description" id="description" maxlength="50"  required><br><br>
        </div>
        <div>
            <label>Enter Quantity</label><br>
            <input type="text" name="quantity" id="quantity" required><br><br>
        </div>
        <div>
            <br><input type="submit" value="Add To Stock">
             <br><br><input type="reset" value="Reset">
        </div>
    </form>
</div>
<a href="admindashboard.jsp">Back to dashboard</a>		
</body>
</html>