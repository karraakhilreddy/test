<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@ page import="java.io.*"%>
<%@page import="com.lowagie.text.*,com.lowagie.text.pdf.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="../CSS/indexCSS.css">
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
           <div ><img src="../IMG/1.png" height="150" width="150" align="left" hspace="80" ></div>
            <div ><img src="../IMG/2.png" height="150" width="200" align="right" hspace="80" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3> <spam>Warangal-506009,Telangana</spam></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
             <ul>
                <button class="" onclick="window.location='../indexCDC.jsp'" ><li>Notifications</li></button>
                 <button class="" onclick="window.location='../aboutCDC.html'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='../login.jsp'"><li>College Login</li></button>
                <button class="active" onclick="window.location='../admin/aindex.jsp'"><li>Admin Login</li></button>
                
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                
            
            </ul>
        </div>
       
    </nav>
    
    <div class="main">    
        <center>
            <div class="mainBackground" >
        
        <form action="../loginAction.jsp" method="post" >
            <fieldset>
                <img src="../IMG\userimage.png" height="80" width="120" align="inherit"/><br/><br/>
            
                <label><b>Admin Login</b></label><input type="text" name="aEmail"  value="a@g.c" required="required" style="border:none;" placeholder=" College Code" required="required" >
            

         <br/><br/>
         <label><b>Password</b></label> <input type="password" name="apassword" value="qwertyuiop" required="required"  placeholder="Password" >
         <br/><br/>
         <button name="button" value="alogin" type="submit" style=" height : 45px ;width : 240px;">Login</button>
         <p><a href="temp/forgotPassword.html" style="text-decoration:none;">Forgot/Generate Password ?</a> </p>
            </fieldset>
           
           
        </form>
       
        
        
    </div>
            
        </center>
            
    </div>
       
              
                  
            
                   
                
        
       
        <div class="footer">
  <div id="button"></div>
<div id="container">
<div id="cont">
<div class="footer_center">
    <div > 
<div class="left">Copyrights reserved by Kakatiya University</div>
<div class="right"><a href="../developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>