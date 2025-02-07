
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
            margin-top: 80px;
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
        .tag {
	color: white;
	font-size: larger;
	font-family: cursive;
	margin-top: 150px;
}

.tagline {
	color: white;
	/* margin-top: -20px; */
	font-size: 45px;
	font-family: cursive;
}
     </style>
</head>
<body>
    <nav>
        <img src="liberarylogo.png" alt="liberary">
        <div class="navlinks">
            <li><a href="adminregister.jsp">Register-Admin</a></li>
            <li><a href="adminlogin.jsp">Login-Admin</a></li>
            <li><a href="userregister.jsp">Register-Student</a></li>
            <li><a href="userlogin.jsp">Login-Student</a></li>
        </div>
    </nav>
    <%
    String msg=request.getParameter("msg");
    String message="" , msgColor="";
    if(msg!=null && msg.equals("logoutSuccess")){
        message="User Logout successfully";
        msgColor="green";
    }
    if(msg!=null && msg.equals("adminlogoutSuccess")){
        message="Admin Logout successfully";
        msgColor="green";
    }
    %>
    <p style="color:<%=msgColor%>; text-align:center"><%=message%></p>
    <p class="tag">WelCome To Liberary-Management-Application</p>
	<pre class="tagline">
         Discover More than Just Books,
         Knowledge at Your Fingertips
    </pre>
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