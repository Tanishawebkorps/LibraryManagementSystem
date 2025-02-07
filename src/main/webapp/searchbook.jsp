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
    <p>Search-Book</p>
    <div class="centerItem">
    <form action="searchbook" validate >
        <div>
            <label>Enter Authore Name</label><br><br>
            <input type="text" name="authore" id="authore"  required><br>
        </div>
        <div>
            <br><input type="submit" value="Search">
             <br><br><input type="reset" value="Reset">
        </div>
    </form>
    <a href="studentdashboard.jsp">Back to dashboard</a>
</div>
</body>
</html>