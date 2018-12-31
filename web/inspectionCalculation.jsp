<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page import="cdc.feeCalculation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
</head>
<body style="background: black">
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
           <h3 style="color:navyblue; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h3>
          <h1 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h4><spam>Warangal-506 009,Telangana</spam></h4><h5><b>Ph: 9440163189. drchr18@yahoo.com</b></h5>
      </div>
      <a href="login.php">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>welcome to college development council</i></b></marquee></p></a>
  </div>
    <nav>
         <nav>
        <div class="navbuttons">
             <ul><button class="tablinks" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="active" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
        </nav>
    
     
       
              
                  
            
                   
                   
                   
                   
               
            
    <div class="main">    
        <center>
    <div class="mainBackground">
        <!-- code -->
        <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'inspectionCalculation.jsp'">INSPECTION DETAILS</button></td>
                                 <td><button onclick="location.href = 'affiliationCalculation.jsp'">AFFILIATION</button></td>
                                 <td><button onclick="location.href = 'Reports/reports.jsp'">REPORTS</button></td>
                                 
                            </tr>
                        </table>
                    </nav>
        
         <table border="1">
             <p>Inspection fee to  be paid for the following</p> <br> 
            <tr>
                <td>Type</td>
                <td>Course</td>
                <td>Combination</td>
                <td>Medium</td>
                
               
                
            </tr>
            <%
                int cCode=(int)session.getAttribute("cCode");
            try
            {
           
            String query="select * from courses where cCode='"+cCode+"' and cStatus='Inspection fee pending' ORDER BY cType ASC;";
            Connection conn=Database.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {

            %>
                <tr>
                    <td><%=rs.getString("cType") %></td>
                    <td><%=rs.getString("cCourse") %></td>
                    <td><%=rs.getString("cCombination") %></td>
                    <td><%=rs.getString("cMedium") %></td>
                   
                    
                    
                    </tr>
                    <%

            }
            %>
            </table><br>
                <%
                rs.close();
                stmt.close();
                conn.close();
                }
            catch(Exception e)
            {
                e.printStackTrace();
                }

        
                 long amount=0;
                 feeCalculation is=new feeCalculation();
                 amount=is.InspectionCalculation(cCode);
                 out.print("is = " +amount);
                 System.out.print(amount);
        
        %>
        
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
        <div>
            
            
            
        </div>
       
        <footer>
            <p id="copyright"> Copyrights reserved by Kakatiya University&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="developers.jsp">Developers</a></p>
            
            
        </footer>
</body>
</html>