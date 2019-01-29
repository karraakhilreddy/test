<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
    <script>
        function dateset(){
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();
             if(dd<10){
                    dd='0'+dd
                } 
                if(mm<10){
                    mm='0'+mm
                } 

            today = yyyy+'-'+mm+'-'+dd;
                        document.getElementById("datefield").setAttribute("max", today);
           }
    </script>
</head>

<body onload="createTable()" >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3><spam>Warangal-506009,Telangana</spam></h3><h3><b>Ph: 9440163189. drchr18@yahoo.com</b></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
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
    
            
     <div class="main">    
        <center>
            <div class="mainBackground" >
        <!-- code -->
        <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  class="active" onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = 'inspectionCalculation.jsp'">INSPECTION DETAILS</button></td>
                                 <td><button onclick="location.href = 'affiliationCalculation.jsp'">AFFILIATION</button></td>
                                 <td><button onclick="location.href = 'Reports/reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
    </table>
    <br>
            <table border="1" id="facultytable">
                
            <tr>
                <td>Name</td>
                <td>Type</td>
                <td>Designation</td>
                <td>Qualification</td>
                <td>Date of appointment</td>
                <td>Nature of appointment</td>
                <td>Mode of appointment</td>
                <td>Scale of pay</td>
                <td>Mode of pay</td>
                <td>Bank account Number</td>
                <td>PAN card Number</td>
                <td>Aadhar number</td>
                <td>Mobile Number</td>
                <td>Action</td>
                
            </tr>
            <%
                String cCode=(String)session.getAttribute("cCode");
            try
            {
           
            String query="select * from faculty where cCode='"+cCode+"';";
            Connection conn=Database.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {

            %>
                <tr>
                    <td><%=rs.getString("tName") %></td>
                    <td><%=rs.getString("tType") %></td>
                    <td><%=rs.getString("tdesignation") %></td>
                    <td><%=rs.getString("tQualification") %></td>
                    <td><%=rs.getString("tDate") %></td>
                    <td><%=rs.getString("tnature") %></td>
                    <td><%=rs.getString("tModeApp") %></td>
                    <td><%=rs.getString("tScale") %></td>
                    <td><%=rs.getString("tModePay") %></td>
                    <td><%=rs.getString("tBank") %></td>
                    <td><%=rs.getString("tPAN") %></td>
                    <td><%=rs.getString("tAadhar") %></td>
                    <td><%=rs.getString("tMobile") %></td>
                    <td><a href="upload.jsp?name=delete&&place=faculty&&sno=<% out.print(rs.getInt("sno"));%>" style="text-decoration: none;">Remove</a></td>
                    
                </tr>
                    <%

            }
            %>
                </table>
                <%
                rs.close();
                stmt.close();
                conn.close();
                }
            catch(Exception e)
            {
                e.printStackTrace();
                }




            %>  
    
    
    

    <!--THE CONTAINER WHERE WE'll ADD THE DYNAMIC TABLE-->
    <br><br><h2>Add New Faculty</h2><br><br>
    <div id="cont"></div>
    <form action="upload.jsp" method="post">
    <table  id="facultytable">
        <tr>
            <td>Name of the Teacher</td>
            <td><input type="text" name="tName"></td>
            
        </tr>
        <tr>
            <td>Type</td>
            <td> <select name="tType" required="required">
                    <option value="Principal">Principal</option>
                    <option value="Teaching">Teaching</option>
                    <option value="Non-Teaching">Non-Teaching</option>
                 </select>
            </td>
        </tr>
        <tr>
            <td>Designation</td>
             <td><input type="text" name="tDesignation" required="required"></td>
        </tr>
        <tr>
        
            <td>Qualification with specialization</td>
            <td><input type="text" name="tQualification" required="required"></td>
             </tr>
        <tr>
            <td>Date of Appointment</td>
<td><input type="date" name="tDate" onclick="dateset()" id="datefield" min="1899-11-11" max="2019-02-12"></td>             </tr>
        <tr>
            <td>Nature of Appointment</td>
             <td> <select name="tNature" required="required">
                    <option value="Permanent" >Permanent</option>
                    <option value="Temporary" >Temporary</option>
                    
                 </select>
            </td>
             </tr>
        <tr>
            <td>Mode of Appointment</td>
             <td> <select name="tModeApp" required="required">
                    
                    <option value="Ratifed">Ratifed</option>
                    <option value="Non-Ratifed">Non-Ratifed</option>
                 </select>
            </td>
        </tr>
       
        <tr>
            <td>Scale of pay</td>
            <td><input type="number" name="tScale" required="required"></td>
             </tr>
         <tr>
            <td>Mode of payment</td>
            <td><select name="tModePay" required="required">
                    <option value="Cash">Cash</option>
                    <option value="Check">Check</option>
                </select>
            </td>
             </tr>
         <tr>
            <td>Bank account Number</td>
            <td><input type="number" name="tBank" required="required"></td>
             </tr>
         <tr>
            <td>PAN card Number</td>
            <td><input type="text" name="tPAN" required="required"></td>
             </tr>
         <tr>
            <td>Aadhar card Number</td>
             <td><input type="text" pattern="(([1-9][0-9]).{10,12})" name="tAadhar" required="required"></td>
             </tr>
         <tr>
            <td>Mobile No</td>
            <td><input type="text" pattern="(([6-9][0-9]).{8,10})" name="tMobile" required="required"></td>
       </tr>
       
            
            
            
            
           
            
       
    </table> 
         <br>
        <br>
        <input type="submit" name="name" value="faculty"  id="facultysubmit">
        <button name ="name" value="faculty" type="submit" id="facultysubmit">Add Faculty</button>
         <br>
        <br>
        <br>
        
     </form>   
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