<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
   <link rel="stylesheet" type="text/css" href="../CSS/indexCSS.css">
    <link rel="stylesheet" type="text/css" href="../CSS/breakDown.css">
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
                    <td>Application for Extension of Affiliation</td>
   
                    <td><button name ="button" value="Basic" type="submit">Download Application</button></td> 
                </tr>
                <tr>
                    <td>Upload Documents</td>
   
                    <td><button name ="button" formaction="uploadDocuments.jsp" type="submit">Upload</button></td> 
                </tr>
                <tr>
                    <td>Course Details</td>
                    <td><button name ="button" value="Course" type="submit">Get Details</button></td> 

                </tr>
                <tr>
                    <td>Faculty details</td>
                    <td><button name ="button" value="Faculty" type="submit">Get Details</button></td>
                </tr>
                <tr>
                    <td>Transactions</td>
                    <td><button name ="button" value="Transactions" type="submit">Get Details</button></td>
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
<div class="right"><a href="../developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>