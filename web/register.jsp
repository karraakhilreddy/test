<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
</head>
<body >
   <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3><spam>Warangal-506009,Telangana</spam></h3><h3><b>Ph: 9440163189. drchr18@yahoo.com</b></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
    <nav>
         
        <div class="navbuttons">
             <ul><button class="tablinks" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
       
       
    
     
       
              
                  
            
                   
                   
                   
                 
         
            
    <div>
        <!-- code -->
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
			
         
    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        
        
    
    
       
         <div class="footer">
  <div id="button"></div>
<div id="container">
<div id="cont">
<div class="footer_center">
    <div > 
<div class="left">Copyrights reserved by Kakatiya University</div>
<div class="right"><a href="developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>