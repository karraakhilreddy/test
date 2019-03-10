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
        
        <nav class="nav2">
                        <table>
                             <tr>
                                 
                                 <td><button onclick="location.href = '../aWelcome.jsp'">Home</button></td>
                                 <td><button onclick="location.href = '../logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
         <h1>Reports</h1>
        <form action="generateReportsPDF.jsp" method="post">
        <table>
            <tr>
                <td>Complete college-course-faculty</td>
                <td><button type="submit" name="button" value="adminCollege">Download</button></td>
            </tr>
            <tr>
                <td>College-course</td>
                
                <td><button type="submit" name="button" value="adminCollegeCourse">View</button></td>
            </tr>
            <tr>
                <td>College-Amount</td>
               
                <td><button type="submit" name="button" value="adminCollegeAmount">View</button></td>
            </tr>
            <tr>
                <td>Logs</td>
                
                <td><button type="submit" name="button" value="cLogs">View</button></td>
            </tr>
            <tr>
                <td>Upload Notification</td>
                <td><button onclick="location.href='uploadNotification.jsp'" type="button">Upload</button></td>
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
<div class="right"><a href="../../developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>