<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="../CSS/indexCSS.css">
</head>
<body >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
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
   
    
     <div class="main">    
        <center>
    <div class="mainBackground">
        <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = '../basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = '../facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button  onclick="location.href = '../courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = '../inspectionCalculation.jsp'">INSPECTION DETAILS</button></td>
                                 <td><button onclick="location.href = '../affiliationCalculation.jsp'">AFFILIATION</button></td>
                                 <td><button class="active" onclick="location.href = '../Reports/reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = '../logout.jsp'">LOGOUT</button></td>
                                 
                            </tr>
                        </table>
                    </nav>
        <br>
         <br>
        
      
        
        <form action="generateReportsPDF.jsp" method="post">
            <table border="10" style="background-color: #b9b992">
                <tr>
                    <td>Basic Details</td>
                    <td><input id="reportbutton" type="submit" name="button" value="Basic" style=" background-color: deepskyblue;height : 45px ;width : 120px;color: white; cursor:pointer"></td>
                </tr>
                <tr>
                    <td>Course Details</td>
                    <td><input id="reportbutton" type="submit" name="button" value="Course" style="background-color: deepskyblue; height : 45px ;width : 120px;color: white; cursor:pointer"></td>
                </tr>
                <tr>
                    <td>Faculty details</td>
                    <td><input id="reportbutton" type="submit" name="button" value="Faculty" style="background-color: deepskyblue; height : 45px ;width : 120px;color: white; cursor:pointer"></td>
                </tr>
                <tr>
                    <td>Transactions</td>
                    <td><input  id="reportbutton" type="submit" name="button" value="Transactions" style="background-color: deepskyblue; height : 45px ;width : 120px;color: white; cursor:pointer"> </td>
                </tr>
            </table>
            
            
            
        </form>
            
        
        
        
    </div>
        </center></div>
       
              
                  
            
                   
                
        
       
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