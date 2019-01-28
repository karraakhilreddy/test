<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
   
</head>
<body style="background: black">
    <div style="text-align: center; background:linear-gradient(#ffff00,#ffffcc);">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; text-shadow: 2px 2px 20px white; font-family: Bookman Old Style;" >Online Services</h2>
          <h1 style="color:black; text-shadow: 2px 2px 50px red; font-family: Bookman Old Style; color: red"><b>KAKATIYA UNIVERSITY</b></h1>
          <h4>Warangal,506009</h4>

      </div>
      <a href="login.php">
       <p style="color:black; border-style: white; text-align: center; background-color: deepskyblue;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To Online Services-Kakatiya University</i></b></marquee></p></a>
  </div>
    <nav>
         <div class="navbuttons">
             <ul>
                <button class="tablinks" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="active" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
        </nav>
    
        
   <div class="main">    
        <center>
    <div class="mainBackground">
        
        <% 
            String cCode=(String)session.getAttribute("cCode");
            //int cCode=Integer.parseInt(scCode);
            session.setAttribute("cCode", cCode);
             Connection con=Database.getConnection();
          PreparedStatement ps=con.prepareStatement("select * from cdc_college_details   where cCode='"+cCode+"'");
         ResultSet rs=ps.executeQuery();
           if(rs.next())
            {
               %>
               <nav class="nav2" >
                        <table>
                            
                             <tr >
                                 <td><button class="active" onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = 'inspectionCalculation.jsp'">INSPECTION DETAILS</button></td>
                                 <td><button onclick="location.href = 'affiliationCalculation.jsp'">AFFILIATION</button></td>
                                 <td><button onclick="location.href = 'Reports/reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                                 
                            </tr>
                        </table>
                    </nav>
               <form action="upload.jsp" method="POST">
                   
              
                          
                  
           
               
                    
                                                     
                                     <h1>Particulars of Land and Builidngs</h1>
                
          
                 
            
                                            
                                   <h1>Library details</h1>
          
                    
               
          
                                  
                                             
                                      <h1>Details of Corpus Fund Deposited</h1>
                
                      
         
                  
         
               
                
          <div class="buttons">
                 <table>
                    <tr>
                        <td><button name="name" value="basicDetails" type="submit">UPDATE</button></td>
                        
                         
                     
                    </tr>
                 </table>
               
          </div>
         </form>
            <%
            }
                %>
               
                
        
   
            
            
            
    </div></center></div>
       
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