<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@ page import="java.io.*"%>
<%@page import="com.lowagie.text.*,com.lowagie.text.pdf.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="../../CSS/indexCSS.css">
</head>
<body >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div >
           <div ><img src="../../IMG/1.png" height="150" width="150" align="left" hspace="80" ></div>
            <div ><img src="../../IMG/2.png" height="150" width="200" align="right" hspace="80" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3> <spam>Warangal-506009,Telangana</spam></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
    
    
     <div class="main">    
        <center>
    <div class="mainBackground">
        
        
         
         <center>
        <h1>File Upload to Database Demo</h1>
        <%
                String message=request.getParameter("message");
                if(request.getParameter("message")!=null){
                    %>
                    <h1>Uploaded Successfully</h1>
        <%
                }
        %>
        
        <form method="post" action="../../uploadServlet" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>Notification</td>
                    <td><textarea rows="4" cols="50" name="firstName"></textarea>
                    </td>
                        
                </tr>
                <tr>
                    <td><lable hidden>Last Name: </lable></td>
                    <td>
                        <input type="text" name="lastName" size="50" value="CDC" hidden/>
                        <input type="text" name="fileType" size="50" value="Notification" hidden/>
                    </td>
                </tr>
                <tr>
                    <td>Select File (PDF only): </td>
                    <td><input accept="application/pdf" type="file" name="photo" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save">
                    </td>
                </tr>
            </table>
        </form>
    </center>
        
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