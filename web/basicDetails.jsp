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
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h3 style="color:navyblue; font-family: Bookman Old Style; ">COLLEGE DEVELOPMENT COUNCIL</h3>
          <h1 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>UNIVERSITY HOSTELS</b></h1>
          <h4><strong><b>KAKATIYA UNIVERSITY, </b></strong><spam>Warangal-506 009,Telangana</spam></h4>
          <h5><b>Ph: 9440163189. drchr18@yahoo.com</b></h5>
      </div>
      <a href="login.php">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>welcome to college development council</i></b></marquee></p></a>
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
        <!-- code -->
        <% 
            int cCode=(int)session.getAttribute("cCode");
            //int cCode=Integer.parseInt(scCode);
            session.setAttribute("cCode", cCode);
             Connection con=Database.getConnection();
          PreparedStatement ps=con.prepareStatement("select * from cdc_college_details   where cCode='"+cCode+"'");
         ResultSet rs=ps.executeQuery();
           if(rs.next())
            {
               %>
               <form action="upload.jsp" method="POST">
              <table >  
                  <center>
                      <tr>
                           <td><h1><a href="basicDetails.jsp">1.</a></h1></td>
                          <td><h1><a href="facultyDetails.jsp">2.</a></h1></td>
                          <td><h1><a href="courseDetails.jsp">3.</a></h1></td>
                          <td><h1><a href="inspectionCalculation.jsp">4.</a></h1></td>
                          <td><h1><a href="affiliationCalculation.jsp">5.</a></h1></td>
                       <td><h1><a href="Reports/reports.jsp">6.</a></h1></td>
                      </tr>
                  </center>
              </table>
                   <table>
                        <tr>
                              <td>College code:</td>
                              <td><input type="number" value="<%=rs.getInt("cCode") %>" readonly="true" ></td>
                            
                         </tr>
                          <tr>
                             <td>Name of the college:</td>
                             <td><input type="text" name="cName" placeholder="college name"  value="<%=rs.getString("cName") %>"  required="required"></td>
                         </tr>
                          <tr>
                             <td>Address of the college:</td>
                             <td><input type="text" name="cAddress" placeholder="college address"  value="<%=rs.getString("cAddress") %>"  required="required"></td>
                         </tr>
                         
                        <tr>
                              <td>Name of the Sponsoring society:</td>
                              <td><input type="text" name="sName" placeholder="society name" value="<%=rs.getString("sName") %>"  required="required" ></td>
                        </tr>
                        
                        <tr>
                            <td>Address of the Sponsoring society:</td>
                            <td><input type="text" name="sAddress" placeholder="society address"  value="<%=rs.getString("sAddress") %>"required="required" ></td>
                        </tr>
                        <tr>
                            <td>Postal Address of the college :</td>
                            <td><input type="number" name="sPostalAddress" placeholder="society postal address"  value="<%=rs.getInt("sPostalAddress") %>"  ></td>
                        </tr>
                         <tr>
                            <td> Type of the college :</td>
                                    <td><select name="typeOfCollege" value="<%=rs.getString("typeOfCollege") %>" >
                                            <option>-------</option>
                                            <option value="university" <% if(rs.getString("typeOfCollege").equals("university")){ out.println("selected");} %>>University</option>
                                            <option value="universityAutonomous" <% if(rs.getString("typeOfCollege").equals("universityAutonomous")){ out.println("selected");} %>>University Autonomous</option>
                                            <option value="government" <% if(rs.getString("typeOfCollege").equals("government")){ out.println("selected");} %>>Government</option>
                                            <option value="governmentAutonomous" <% if(rs.getString("typeOfCollege").equals("governmentAutonomous")){ out.println("selected");} %>>Government Autonomous</option>
                                            <option value="aided" <% if(rs.getString("typeOfCollege").equals("aided")){ out.println("selected");} %>>Aided</option>
                                            <option value="pivate" <% if(rs.getString("typeOfCollege").equals("pivate")){ out.println("selected");} %>>Private</option>
                                            <option value="privateAutonomous" <% if(rs.getString("typeOfCollege").equals("privateAutonomous")){ out.println("selected");} %>>Private Autonomous</option>
                                            
                                </select>
                                    </td>
                        </tr>
                        
               <tr>
                           <td>Society Registration no:</td>
                           <td><input type="text" name="sRegNo" value="<%=rs.getString("sRegNo") %>" required="required"></td>
                         </tr>
                         
                         <tr>
                            <td>Year of registration:</td>
                            <td><input type="date_date_set"  name="sYear" value="<%=rs.getInt("sYear") %>" required="required"></td>
                         </tr>
                    
                         
                         <tr>
                             <td>Year of Establishment of College:</td>
                             <td><input type="date_date_set" name="cEstd"  value="<%=rs.getDate("cEstd") %>" required= "required"></td>
                         </tr>
                         <tr>
                             <td>Name of the Secretary/Correspondent: </td>
                             <td> <input type="text" name="secName" required="required"  value="<%=rs.getString("secName") %>" autocomplete="false"></td>
                         </tr>
                         
                         <tr>
                             <td>Mobile Number of the Secretary:</td>
                             <td><input type="text"  name="secPhNo"  value="<%=rs.getString("secPhNo") %>" required="required"></td> 
                         </tr>
                         
                         <tr>
                             <td>Name of the Principal:</td>
                             <td><input type="text" name="cPrincipal"  value="<%=rs.getString("cPrincipal") %>" required="required" autocomplete="false"></td> 
                         </tr>
                          
                         <tr>
                            <td>Mobile Number of the Principal:</td>
                             <td><input type="text" maxlength="10" name="cPPhNo" value="<%=rs.getString("cPPhNo")%>"  required="required"></td>
                         </tr>
                         <tr>
                             <td>Experience as Principal(in years)</td>
                             <td><input type="number" name="cExperiencePrincipal"  value="<%=rs.getInt("cExperiencePrincipal") %>" required="required" autocomplete="false"></td> 
                         </tr>
                          <tr>
                               
                                   <td>  whether the college building is owned by society(owned/rented)                       </td>
                                   <td><select name="valOwnBuilding" value="<%=rs.getString("valOwnBuilding") %>">
                                <option></option>
                                <option value="owned" <% if(rs.getString("valOwnBuilding").equals("owned")){ out.println("selected");} %>>Owned</option>
                                <option value="leased" <% if(rs.getString("valOwnBuilding").equals("leased")){ out.println("selected");} %>>Leased</option>
                                       </select></td>
                                       
                            </tr>
                       
                        
              </table>
                 <br><hr> 
                    
                         
                        <table>
                           
                            <tr>
                                 
                                 <td><b>if leased please fillup these details</b> </td>
                           
                                <td>Details of lease(lessor/lessee/Period/Survey No):</td>
                                <td><input type="text" name="lLessor" required="required" value="<%=rs.getString("lLessor") %>" class="hidden">Lessor</td>
                                <td><input type="text" name="lLessee" required="required" value="<%=rs.getString("lLessee") %>" class="hidden">Lessee</td>
                                <td><input type="number" name="lPeriod" required="required" value="<%=rs.getInt("lPeriod") %>"  class="hidden">Period</td>
                                <td><input type="text" name="lSurveyNo" required="required" value="<%=rs.getString("lSurveyNo") %>" class="hidden">SurveyNo</td>
                                
                                <td><input type="text" name="lRegNo" required="required" value="<%= rs.getString("lRegNo") %>" >RegNo</td>
                               
                                <td><input type="date" name="lRegDate" required="required" value="<%=rs.getDate("lRegDate") %>" class="hidden">RegDate</td>
                               
                            </tr>
                        
                        </table>
                     
                            <table>
                            
                       <hr>    
                     <tr>         
                         <td>Land Survey Number:</td>
                         <td><input type="text" name="landSurveyNumber"  value="<%=rs.getString("landSurveyNumber") %>" required="required"></td>
                     </tr>
                         
                    <tr>     
                        <td>Documentation No:</td>
                        <td><input type="text" name="landDocNo"  value="<%=rs.getString("landDocNo") %>"required="required"></td>
                    </tr>
                    
                    <tr>
                        <td>Date of Registration:</td>
                        <td><input type="date" name="landRegDate"  value="<%=rs.getDate("landRegDate") %>"required="required"></td>
                    </tr>
                         
                    <tr>     
                        <td>Whether Registered in the name of Society:</td>
                        <td><input type="radio" name="valRegSociety" value="yes" <% if(rs.getString("valRegSociety").equals("yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valRegSociety" value="no" <% if(rs.getString("valRegSociety").equals("no")){ out.println("checked");} %> >No</td>
                    </tr>
                         
                    <tr>     
                        <td>Represented by the Secretary or Member:</td>
                        <td><input type="radio" name="valSecMem" value="yes" <% if(rs.getString("valSecMem").equals("yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valSecMem" value="no" <% if(rs.getString("valSecMem").equals("no")){ out.println("checked");} %>>No </td>
                    </tr>
                         
                    <tr>    
                        <td>Whether representative name is in the list of members of the society:</td>
                         <td><input type="radio" name="valSocietyMem" value="yes" <% if(rs.getString("valSocietyMem").equals("yes")){ out.println("checked");} %>>Yes
                             <input type="radio" name="valSocietyMem" value="no" <% if(rs.getString("valSocietyMem").equals("no")){ out.println("checked");} %>>No</td>
                    </tr>
                         
                    <tr>     
                        <td>Whether entire land is in single bit:</td>
                        <td><input type="radio" name="valSingleBit" value="yes" <% if(rs.getString("valSingleBit").equals("yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valSingleBit" value="no" <% if(rs.getString("valSingleBit").equals("no")){ out.println("checked");} %>>No</td>
                    </tr>
                     <tr>
                           <td>Whether the sketch plan of land is certified by MRO/Tahasildar:</td>
                          <td><input type="radio" name="valLandCert" value="yes" <% if(rs.getString("valLandCert").equals("yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valLandCert" value="no" <% if(rs.getString("valLandCert").equals("no")){ out.println("checked");} %> > No </td>
                         </tr>
                         
                         
                    <tr>     
                        <td>Permission for grant of Construction of Building by the competent authority:</td>
                        <td><select name="grantPermission" value="<%=rs.getString("grantPermission") %>">
                                <option></option>
                                <option value="gramPanchayat" <% if(rs.getString("grantPermission").equals("gramPanchayat")){ out.println("selected");} %>>GramPanchayat</option>
                                <option value="muncipality" <% if(rs.getString("grantPermission").equals("muncipality")){ out.println("selected");} %>>Muncipality</option>
                            </select></td>
                    </tr>
                         
                    <tr>     
                        <td>Building MAP approved by the Competent Authority:</td>
                        <td><select name="mapApproval" value="<%=rs.getString("mapApproval") %>">
                                <option></option>
                                <option value="gramPanchayat" <% if(rs.getString("mapApproval").equals("gramPanchayat")){ out.println("selected");} %>>GramPanchayat</option>
                                <option value="muncipality" <% if(rs.getString("mapApproval").equals("muncipality")){ out.println("selected");} %>>Muncipality</option>
                            </select>
                        </td>
                    </tr>
                         
                    <tr>
                        <td>Total Built-up Area shown in the Map(Carpet area+Corridors+Staircase etc.):</td>
                        <td><input type="number" name="mapArea" value="<%=rs.getInt("mapArea") %>" required="required"></td>
                    </tr>
                   
                     <tr>    
                         <td>Whether Playground is Available in(or)around the college:</td>
                         <td><input type="radio" name="valPlayGround" value="yes" <% if(rs.getString("valPlayGround").equals("yes")){ out.println("checked");} %>>Yes
                             <input type="radio" name="valPlayGround" value="no"<% if(rs.getString("valPlayGround").equals("no")){ out.println("checked");} %> >No</td>
                   </tr>
                      
                    <tr>     
                        <td>Is parking area available:</td>
                         <td><input type="radio" name="valParkingArea" value="yes"<% if(rs.getString("valParkingArea").equals("yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valParkingArea"  value="no" <% if(rs.getString("valParkingArea").equals("no")){ out.println("checked");} %> >No</td>
                    </tr>
                    <tr>     
                        <td>Safe Drinking Water Facility Available:</td>
                        <td><input type="radio" name="valDrinkingWater" value="yes" <% if(rs.getString("valDrinkingWater").equals("yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valDrinkingWater" value="no" <% if(rs.getString("valDrinkingWater").equals("no")){ out.println("checked");} %> >No</td>
                    </tr>
                         
                    <tr>     
                        <td>Whether Fire-Safety measures taken:</td>
                        <td><input type="radio" name="valFireSafety" value="yes" <% if(rs.getString("valFireSafety").equals("yes")){ out.println("checked");} %>>Yes
                             <input type="radio" name="valFireSafety" value="no"<% if(rs.getString("valFireSafety").equals("no")){ out.println("checked");} %> >No</td>
                    </tr>    
                    <tr>     
                        <td>Whether Sanitary Certificate taken:</td>
                        <td><input type="radio" name="valSanitaryCert" value="yes" <% if(rs.getString("valSanitaryCert").equals("yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valSanitaryCert" value="no" <% if(rs.getString("valSanitaryCert").equals("no")){ out.println("checked");} %> >No</td>
                    </tr>
                </table>         
                  
           
               
                    
                                                       <hr>
                                     <h1>Particulars of Land and Builidngs</h1>
                
          
                  <table> 
                   <tr>
                       <td>Total land in acres:</td>
                       <td colspan="2"><input type="number" name="totalLand" value="<%=rs.getInt("totalLand") %>" required="required" autocomplete="false"></td>
                   </tr>
                   
                    <tr>
                        <td>Building plinth raea in Sq.ft.:</td>
                        <td colspan="2"><input type="number" name="bPlinthArea" value="<%=rs.getInt("bPlinthArea") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   
                   <tr>
                       <td>Principal room in Sq.ft.:</td>
                       <td colspan="2"><input type="number" name="priRoomArea" value="<%=rs.getInt("priRoomArea") %>"  required="required" autocomplete="false"></td>
                  </tr>
                  <tr>
                       <td>Office room in Sq.ft.:</td>
                       <td colspan="2"><input type="number" name="offRoomArea" value="<%=rs.getInt("offRoomArea") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>Staff room in sq.ft.:</td>
                       <td colspan="2"><input type="number" name="staffRoomArea" value="<%=rs.getInt("staffRoomArea") %>" required="required" autocomplete="false"></td>
                   </tr>
                   
                   <tr>
                       <td>Games Room in sq.ft.:</td>
                       <td colspan="2"><input type="number" name="gamesRoomArea" value="<%=rs.getInt("gamesRoomArea") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>Ladies Waiting Room in sq.ft.:</td>
                       <td colspan="2"><input type="number" name="lWaitingRoom" value="<%=rs.getInt("lWaitingRoom") %>" required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>Toilets in Sq.ft.:</td>
                       <td colspan="2"><input type="number" name="toiletsRoomArea" value="<%=rs.getInt("toiletsRoomArea") %>" required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>Library in sq.ft.:</td>
                       <td colspan="2" ><input type="number" name="libraryArea" value="<%=rs.getInt("libraryArea") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>No of Class Rooms and size of each room in sq.ft</td>
                       <td><input type="number" name="noClassRooms"  value="<%=rs.getInt("noClassRooms") %>" required="required" autocomplete="false">
                           <input type="number" name="classSize" value="<%=rs.getInt("classSize") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                      <td>No of Lab Rooms and size of each room in sq.ft</td>
                      <td><input type="number" name="noLabRooms"  value="<%=rs.getInt("noLabRooms") %>" required="required" autocomplete="false">
                      <input type="number" name="labSize" value="<%=rs.getInt("labSize") %>"   required="required" autocomplete="false"></td>
                   </tr>
            
               
               </table> 
            
                                             <hr>
                                   <h1>Library details</h1>
          
                    
                         
                <table>
                     <tr>   
                        <td>Name of the Librarian:</td>
                        <td><input type="text" name="nLibrarian" value="<%=rs.getString("nLibrarian") %>" placeholder="name" required="required" autocomplete="false"></td>
                     </tr>
                     <tr>
                         <td>No of books:</td>
                         <td><input type="number" name="noBooks" value="<%=rs.getInt("noBooks") %>" required="required" autocomplete="false"></td>
                     </tr>
                     <tr>
                         <td>No of Journals:</td>
                         <td><input type="number" name="noJournels" value="<%=rs.getInt("noJournels") %>"  required="required" autocomplete="false"></td>
                     </tr>
                     <tr>
                        <td>No of Periodicals:</td>
                        <td><input type="number" name="noPeriodicals" value="<%=rs.getInt("noPeriodicals") %>"  required="required" autocomplete="false"></td>
                     </tr>
                </table> 
        
                
              
               
                                                 <hr>
                                          <h1>Staff details</h1>
         
                 <table>
                    <tr>
                          <td>No of Teaching Staff:<input type="number" value="<%=rs.getInt("noTeachingStaff") %>" name="noTeachingStaff"  required="required"                   autocomplete="false">&emsp;&emsp;
                              No of Non-teaching staff:<input type="number" name="noNonTeachingStaff" value="<%=rs.getInt("noNonTeachingStaff") %>"  required="required" autocomplete="false">
                          </td>
                    </tr>
                   
                 </table>
          
                                  
                                                <hr>
                                      <h1>Details of Corpus Fund Deposited</h1>
                
                      
         
                   <table>
                      <tr>
                          <th>FDR/BG NO</th>
                          <th>Date</th>
                          <th>Amount</th>
                          <th>Name of the issuing Bank</th>
                          <th>Date of Maturity</th>
                          <th>Date of Renewal</th>
                     
                     </tr>
                     <tr>
                         <td><input type="text" name="CFDNo"  value="<%=rs.getString("CFDNo") %>" required="required" autocomplete="false"></td>
                          <td><input type="date" name="CFDDate" value="<%=rs.getDate("CFDDate") %>" name="CFDDate"  required="required" autocomplete="false"></td>
                          <td><input type="number" name="CFDAmount"  required="required" value="<%=rs.getInt("CFDAmount") %>" autocomplete="false"></td>
                          <td><input type="text" name="CFDIssuingBank" value="<%=rs.getString("CFDIssuingBank") %>"  required="required" autocomplete="false"></td>
                          <td><input type="date" name="CFDMaturitydate"  value="<%=rs.getDate("CFDMaturitydate") %>"  required="required" autocomplete="false"></td>
                          <td><input type="date" name="CFDRenewalDate" value="<%=rs.getDate("CFDRenewalDate") %>"   required="required" autocomplete="false"></td>
                     </tr>
                 
                   </table>
         
               
                
          <div class="buttons">
                 <table>
                    <tr>
                        <td><input type="submit" name="name" value="basicDetails" </td>
                         <td><button><b>EDIT</b></button> </td>
                         <td><button><b>SAVE and CONTINUE</b></button> </td>
                     
                    </tr>
                 </table>
               
          </div>
         </form>
            <%
            }
                %>
               
                
        
   
            
            
            
    </div></center></div>
       
        <footer>
            <p id="copyright"> Copyrights reserved by Kakatiya University&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="developers.jsp">Developers</a></p>
            
            
        </footer>
</body>
</html>