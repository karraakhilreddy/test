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
     
     <link rel="stylesheet" type="text/css" href="../CSS/Help.css">
     <link rel="stylesheet" type="text/css" href="../CSS/breakDown.css">
    
     <style>
         table, th, td{
    
    
    align-content: center;
     padding: 10px;
  text-align: left;
  
  
    
}
table {
  border-collapse: collapse;
  
  background-color:white;
  color:black;
  
}
tr:hover 
{
    background-color:deepskyblue;
    color: white ;
}

th{
    font-weight: 900;
}
a{
    text-decoration: none;
}

     </style>
     <script>
        
        
            function openCont(evt, contName,from) {
                    // Declare all variables
                    var i, tabcontent, tablinks;

                    // Get all elements with class="tabcontent" and hide them
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }

                    // Get all elements with class="tablinks" and remove the class "active"
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }

                    // Show the current tab, and add an "active" class to the button that opened the tab
                    document.getElementById(contName).style.display = "block";
                    evt.currentTarget.className += " active";
                    if(from==='but1')
                        button1.className +=" active";
                    
            }
        function openCont1(evt, contName,from) {
                    // Declare all variables
                    var i, tabcontent1, tablinks1;

                    // Get all elements with class="tabcontent" and hide them
                    tabcontent1 = document.getElementsByClassName("tabcontent1");
                    for (i = 0; i < tabcontent1.length; i++) {
                        tabcontent1[i].style.display = "none";
                    }

                    // Get all elements with class="tablinks" and remove the class "active"
                    tablinks1 = document.getElementsByClassName("tablinks1");
                    for (i = 0; i < tablinks1.length; i++) {
                        tablinks1[i].className = tablinks1[i].className.replace(" active", "");
                    }

                    // Show the current tab, and add an "active" class to the button that opened the tab
                    document.getElementById(contName).style.display = "block";
                    evt.currentTarget.className += " active";
                     if(from==='but11')
                        button11.className +=" active";
                    
                    
            }
    </script>
</head>
<body onload="openCont(event, 'generalDetails','but1')">
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
        
         
         <center>
            <div class="container">

             
                 
        <div class="tab">
            <button id="button1"  class="tablinks" onclick="openCont(event, 'generalDetails')">Upload Files </button>
            <button  id="button2" class="tablinks" onclick="openCont(event, 'buildingDetails')">View Files</button>
        </div>
        
               <center>


<!-- Tab content -->
<div id="generalDetails" class="tabcontent active">
    
      
    <center>
        <h1>Upload files</h1>
        <%
                String message=request.getParameter("message");
                if(request.getParameter("message")!=null){
                    %>
                    <h1>Uploaded Successfully</h1>
        <%
                }
        %>
        
        <form method="post" action="../uploadServlet" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>Select file type</td>
                    <td>
                        
                        <select name="firstName">
                            
                            <option value="Society Registration documents">Society Registration documents</option>
                            <option value="Land Registration/Leased documents">Land Registration/Leased documents</option>
                            <option value="College Building permission documents">College Building permission documents</option>
                            <option value="College Building Master-Plan">College Building Master-Plan</option>
                            <option value="Statement of Room-wise allotment ">Statement of Room-wise allotment </option>
                            <option value="Initial Affiliation Order">Initial Affiliation Order</option>
                            <option value="Last year Affiliation Order">Last year Affiliation Order</option>
                            <option value="Sanitation Certificate">Sanitation Certificate</option>
                            <option value="Fire-Safety Certificate">Fire-Safety Certificate</option>
                            <option value="Building Soundness Certificate">Building Soundness Certificate</option>
                            <option value="Corpus Fund Certificate">Corpus Fund Certificate</option>
                            <option value="Latest Permission letter from TSCHE ">Latest Permission letter from TSCHE </option>
                            <option value="Latest Permission letter from AICTE ">Latest Permission letter from AICTE </option>
                            <option value="Latest Permission letter from PCI">Latest Permission letter from PCI</option>
                            <option value="Latest Permission letter from BCI ">Latest Permission letter from BCI </option>
                            <option value="Latest Permission letter from NCTE">Latest Permission letter from NCTE</option>
                            
                        </select>               
                        <input accept="application/pdf" type="file" name="photo" size="50"/>
                        <!--<input type="text" name="firstName"  value="file1" hidden/>-->
                        <input type="text" name="lastName" size="50" value="<%=session.getAttribute("cCode")%>" hidden/>
                        <input type="text" name="fileType" size="50" value="Document" hidden/>
                    </td>
                    <td><input type="submit" value="Upload"></td>
                </tr>
                              
            </table>
        </form>
                        <br><br><br><br><br><br><br><br>
    </center>
    
                           
 
   
</div>

                         
<div id="buildingDetails" class="tabcontent" >
     
    
    <div  style="background-color: #b9b992; width: 850px; align-content: center;">
            <h1>Uploaded files</h1>
            
            <br> <br>
            <table style="background-color: white;">
                <tr>
                    <td>S.No</td>
                    <td>Date</td>
                    <td>Document</td>
                    <td>Remove</td>
                </tr>
              <%
                                String cCode=(String)session.getAttribute("cCode");
                                try{
                                        int sno=1;
                                        String query="select * from documents where cCode='"+cCode+"' order by id desc;";
                                         Connection conn=Database.getConnection();
                                         Statement stmt=conn.createStatement();
                                         ResultSet rs=stmt.executeQuery(query);
                                          while(rs.next())
                                         {
                                           %>

                                                <tr>
                                                    <td><%=sno%></td>
                                                    <td><%= rs.getString("date")%></td>
                                                    <td><a href="../notifDownload.jsp?from=documents&&id=<%= rs.getString("id")%>" target="_blank" style="text-decoration: none;"><%= rs.getString("Document")%></a></td>
                                                    <td><a href="../upload.jsp?name=delete&&place=document&&sno=<%=rs.getInt("id")%>">Remove</a></td></td>
                                                </tr>
                                          <%
                                              sno++;
                                         }
                                         %>
                                        </table>
                                        <br>
                                        <label>Only one copy of each document has to be uploaded.</label>
                                        <%
                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
            %>
            
            <br><br><br><br><br><br><br>
        </div>
  
                 
</div>
<br><br><br><br>
                        


    
               </center>
    </div>
             
             
             
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
<div class="right"><a href="../developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>