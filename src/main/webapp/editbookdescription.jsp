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
    <p>Edit-Description</p>
        <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("editFail")){
        message="Book Description Is Not Edit Please Try Again !";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="centerItem">
    <form action="editbookdescription" validate >
        <div>
            <label>Enter Book Name</label><br>
            <input type="text" name="name" id="Name"  required><br><br>
        </div>
        <div>
            <label>Enter New Author</label><br>
            <input type="text" name="author" id="author"  ><br><br>
        </div>
        <div>
            <label>Enter New Edition</label><br>
            <input type="text" name="edition" id="edition"  ><br><br>
        </div>
         <div>
            <label>Enter New Quantity</label><br>
            <input type="text" name="quantity" id="quantity"  ><br><br>
        </div>
        <div>
            <label>Enter New Description (Max Characters 50)</label><br>
            <input type="text" name="description" id="description" ><br><br>
        </div>
        <div>
            <br><input type="submit" value="Edit Description">
             <br><br><input type="reset" value="Reset">
        </div>
    </form>
    </div>
    <a href="admindashboard.jsp">Back to dashboard</a>		
</body>
</html>