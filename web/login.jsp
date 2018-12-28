<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login Page</title>
        <script ></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
    </head>
    <body>
    <header>
        <center><img src="imgsrc/itsalogo.jpg"></center>
   </header>
           <div class="signin"  style="background-image:url(imgsrc/signin.jpg)" >
               <form action="loginAction.jsp" method="post">
           
              
                <p>Sign in</p>
                <input type="text" name="cCode"  value="567" required="required" >
                <input type="password" name="password" value="qwertyuiop" required="required" >
                <button type="submit" name="button" value="login">Log In</button>
        </form>
                <hr>
                 <a href="register.jsp"><button type="submit" name="register">Register</button></a>
                </div>

      
           
              
    </body>
</html>
