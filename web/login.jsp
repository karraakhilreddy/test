<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
    <style type="text/css">
       fieldset {
                   height: 380px;
                   width: 300px;
                   border: 1px inset transparent;
                   text-align:inherit;
                   vertical-align: middle;
                   margin: auto;
                   background-color: whitesmoke;
                  margin-top:40px;
                    } 
                    input{
                   border: 4px solid transparent ;
                   border-radius: 4px;
                   padding: inherit;
                   background-blend-mode: color-dodge;
                   border-color:white;
                   font-size: 22px;
                   height: auto;
                   width: auto;
                   table-layout: inherit;
                   
                 
                  }
        p{
                  color: grey;
                  font-size: 14px;
               }
               fieldset button {
                   button{
                   height : 45px ;
                   width : 240px;
                   
                   border: 4px solid transparent;
                   background-color:green;
                   border-color: white;
                   color: white;
                  font-size: 15px;
                   }

               }
        
    </style>
</head>
<body >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div >
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="80" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="80" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3> <spam>Warangal-506009,Telangana</spam></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
    <nav>
         <nav>
        <div class="navbuttons">
             <ul><button class="" onclick="window.location='indexCDC.jsp'" ><li>Notifications</li></button>
                 <button class="" onclick="window.location='aboutCDC.html'" ><li>About</li></button>
                <button class="active" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                
            
            </ul>
        </div>
       
    </nav>
    
       
        </nav>

     
         
    <div class="main">    
        <center>
            <div class="mainBackground"  >
        <!-- code -->
        <center>
        <form action="loginAction.jsp" method="post" id=" ">
            <br><h3>Before login please check college code and email from <a href="masters.jsp">HERE.</a></h3>
            <fieldset>
                <img src="IMG\userimage.png" height="80" width="120" align="inherit"/><br/><br/>
            
                <label><b>College Code</b></label><input type="text" name="cCode"   style="border:none;" placeholder=" College Code" required="required" >
            

         <br/><br/>
         <label><b>Password</b></label> <input type="password" name="password"  required="required"  placeholder="Password" >
         <br/><br/>
         <input type="submit" name="button" value="login" style="background-color:deepskyblue; height : 45px ;width : 240px;color: white; border-radius:0px; cursor:pointer" >
         <p><a href="temp/forgotPassword.html" style="text-decoration:none;">Forgot/Generate Password ?</a> </p>
         <p><a href="temp/checkMail.html" style="text-decoration:none;">Check College Code & Registered Email</a> </p>
            </fieldset>
              
           
        </form>
            </center>
    </div>        
            </center>
        </div>   
        
    
    <script>
            
            function openCont(evt,contName){
              var i,tabcontent,tablinks;
                
              tabcontent=document.getElementsByClassName("tabcontent");
                for(i=0;i<tabcontent.length;i++){
                    tabcontent[i].style.display="none";
                }
                
                
                tablinks=document.getElementsByClassName("tablinks");
               for(i=0;i<tablinks.length;i++){
                    tablinks[i].className=tablinks[i].className.replace("active","");
                }
                document.getElementById(contName).style.display="block";
                evt.currentTarget.className +="active";
            }
            
        </script>
        
       
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