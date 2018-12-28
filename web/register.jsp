<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
       
    
     <head>

          <title>Registration Page</title>
          <link rel="stylesheet" type="text/css" href="register.css">
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">   
     </head>
      <body >
          <div class="header">
              <img src="imgsrc/itsalogo.jpg">
          </div>
          <form action="loginAction.jsp" id="theForm" method="post" >
			<div class="register">
            
	
            <center>
              <h2>REGISTRATION FORM</h2>
		  <input type="text" name="cName" placeholder=" Name" id="clg" required="required" >
                  <input type="text" name="cEmail" placeholder="Email address" id="email_error" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="must contain alphanumeric and @ and alphanumeric eg:abc@def">
		  <input type="password" name="Pwd" placeholder="Password" id="password"   required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                  <input type="password" name="pwdC" placeholder="confirm password" id="confirm_password">
		  <input type="text" name="cPhNo" placeholder="phone number" id="phone" required="required" pattern="([6-9][0-9].{8,8})" 
                         title="enter 10 digit Indian  mobile number"> 
				  
                  <input type="submit" value="register" name="button" id="button" class="button">
            </center>
				</div>
            </form>
			<!-------------------------javascript---------------------------->
		<script>
		
         var password = document.getElementById("password") , confirm_password = document.getElementById("confirm_password");
            function validatePassword()  
            {
             if(password.value != confirm_password.value) 
	     {
                   confirm_password.setCustomValidity("Passwords Don't Match");
                 }
                 else
    		   {
                    confirm_password.setCustomValidity('');
                  }
            }

             password.onchange = validatePassword;
             confirm_password.onkeyup = validatePassword;
		
       
       </script>
    </body>
</html>
