<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href=
"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />

    <!-- Bootstrap Font Icon CSS -->
    <link rel="stylesheet" href=
"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <style>
        .social{
            margin-top: 10px;
            display: flex;
            gap: 50px;
        }
        footer{
            margin-top: 150px;
            color: white;
            display: flex;
            flex-direction: row;
            gap:100px;
        }
        body{ 
            align-items: center;
            display: flex;
            flex-direction: column;
            background-image: linear-gradient(to top left, rgb(228, 222, 232), rgb(164, 89, 197));
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
            overflow-y: hidden;
        }
        a {
            color:rgb(255, 255, 255);
            text-decoration: none;    
        }
        li{
            list-style: none;
        }
         nav{
            margin-top: 50px;
            display: flex;
            gap:40px;
        }
        .navlinks{
            margin-top: 10px;
            display: flex;
            gap: 70px;
        }
        img{
            
            height: 50px;
            border-radius:100px ;
            border: 1px solid rgb(63, 10, 100);
        }
        .tagline{
        color: white;
         margin-top: 200px; 
        font-size: 45px;
        font-family: cursive;
       }
     </style>
</head>
<body>
    <nav>
        <img src="liberarylogo.png" alt="liberary">
        <div class="navlinks">
            <li><a href="studentissuebook.jsp">Issue-Book</a></li>
            <li><a href="searchbook.jsp">Search Books</a></li>
            <li><a href="sviewbook.jsp">Check All Books In Library</a></li>
            <li><a href="studentgetallissuebook.jsp">Get All Issued Books</a></li>
            <li><a href="renew.jsp">Renew Books</a></li>
            <li><a href="returnbook.jsp">Return Books</a></li>
            <li><a href="userlogout.jsp">Logout</a></li>
        </div>
    </nav>
    <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("userLoginSuccess")){
        message="User Login Successfully !";
        msgColor="green";
    }
    else if(msg!=null && msg.equals("issueSuccess")){
        message="Book Issued Successfully !";
        msgColor="green";
    }
    else if(msg!=null && msg.equals("returnSuccess")){
        message="Book Returned Successfully !";
        msgColor="green";
    }
    else if(msg!=null && msg.equals("renewSuccess")){
        message="Book ReIssued Successfully !";
        msgColor="green";
    }
    else if(msg!=null && msg.equals("noBook")){
        message="No Book Available  With This Name !";
        msgColor="red";
    }
    else if(msg!=null && msg.equals("noBookIssue")){
        message="No Book Issued Yet !";
        msgColor="red";
    }
    else if(msg!=null && msg.equals("noBookInLib")){
        message="No Book Present In Liberary !";
        msgColor="red";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <div class="tagline">
        <p>Welcome to Student Home Page</p>
    </div>
    <footer>
        <div class="social">
        <li> <a href="#" class="bi bi-facebook"></a></li>
        <li> <a href="#" class="bi bi-instagram"></a></li>
        <li> <a href="#" class="bi bi-linkedin"></a></li>
        <li> <a href="#" class="bi bi-whatsapp"></a></li>
    </div>
        <div>copyright &copy; 2003<div>
        <div> <a href="mailto:librarymanagementsystem22@gmail.com">liberarymanagement@gmail.com</a></div>
    </footer>
</body>
</html>