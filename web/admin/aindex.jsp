<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@ page import="java.io.*"%>
<%@page import="com.lowagie.text.*,com.lowagie.text.pdf.*"%>;
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="../CSS/indexCSS.css">
</head>
<body style="background: black">
 <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="../IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="../IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;" >Online Services</h2>
          <h1 style="color:black; text-shadow: 2px 2px 50px orange; font-family: Bookman Old Style;"><b>KAKATIYA UNIVERSITY</b></h1>
          <h4>Warangal,506009</h4>

      </div>
      <a href="login.php">
       <p style="color:black; border-style: white; text-align: center; background-color: deepskyblue;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To Online Services-Kakatiya University</i></b></marquee></p></a>
  </div> 
    <nav>
        <div class="navbuttons">
             <ul>
                <button class="tablinks" onclick="window.location='../home.jsp'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='../login.jsp'"><li>College Login</li></button>
                <button class="active" onclick="window.location='../admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='../dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='../help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
    <div class="main">    
        <center>
    <div class="mainBackground">
        
        <form action="../loginAction.jsp" method="post" >
           
            <table>
                <tr>
                    <td> <p >Admin Email</p></td>
                    <td><input type="text" name="aEmail"  value="a@g.c" required="required" ></td>
                </tr>
                 <tr>
                    <td><p>Password</p></td>
                    <td><input type="password" name="apassword" value="qwertyuiop" required="required" ></td>
                </tr>
                <tr>
                    <td><button name="button" value="alogin" type="submit">Login</button></td>
                    
                    <td><p><a href="temp/forgotPassword.html">Forgot/Generate Password</a> </p></td>
                </tr>
               
            
            </table>
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
<div class="right"><a href="developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>