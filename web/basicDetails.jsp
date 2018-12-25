<%-- 
    Document   : basicDetails
    Created on : 3 Oct, 2018, 12:35:43 PM
    Author     : dwive
--%>

<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
     </head>    
    <body>
        <% 
            String cCode=request.getParameter("code");
            session.setAttribute("cCode", cCode);
             Connection con=Database.getConnection();
          PreparedStatement ps=con.prepareStatement("select * from cdc_college_details   where cCode='"+cCode+"'");
         ResultSet rs=ps.executeQuery();
           if(rs.next())
            {
               %>
              <table>  
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
                         
                        <tr>
                              <td>College code:</td>
                              <td><input type="number" value="<%=rs.getInt("cCode") %>" ></td>
                            
                         </tr>
                          <tr>
                             <td>Name of the college:</td>
                             <td><input type="text" name="cName" placeholder="college name"  value="<%=rs.getString("cName") %> "  required="required" readonly=""></td>
                         </tr>
                         
                        <tr>
                              <td>Name of the Sponsoring society:</td>
                              <td><input type="text" name="sName" placeholder="society name" value="<%=rs.getString("sName") %> "  required="required" ></td>
                        </tr>
                        
                        <tr>
                            <td>Address:</td>
                            <td><input type="text" name="sAddress" placeholder="society address"  value="<%=rs.getString("sAddress") %> "required="required" ></td>
                        </tr>
               <tr>
                           <td>Registration no:</td>
                           <td><input type="text" name="sRegno" value="<%=rs.getString("sRegNo") %> " required="required"></td>
                         </tr>
                         
                         <tr>
                            <td>Year of registration:</td>
                            <td><input type="date" maxlength="4" name="sYear" value="<%=rs.getInt("sYear") %> " required="required"></td>
                         </tr>
                    
                         <tr>
                             <td>Name of the Secretary/Correspondent: </td>
                             <td> <input type="text" name="secName" required="required"  value="<%=rs.getString("secName") %> " autocomplete="false"></td>
                         </tr>
                         <tr>
                             <td>Year of Establishment of College:</td>
                             <td><input type="date_date_set" name="cEstd"  value="<%=rs.getDate("cEstd") %>" required= "required"></td>
                         </tr>
                         
                         <tr>
                             <td>Mobile Number of the Secretary:</td>
                             <td><input type="text"  name="secPhNo"  value="<%=rs.getString("secPhNo") %> " required="required"></td> 
                         </tr>
                         
                         <tr>
                             <td>Name of the Principal:</td>
                             <td><input type="text" name="cPrincipal"  value="<%=rs.getString("cPrincipal") %>" required="required" autocomplete="false"></td> 
                         </tr>
                         
                         <tr>
                            <td>Mobile Number of the Principal:</td>
                             <td><input type="text" maxlength="10" value="<%=rs.getString("cPPhNo") %> " name="cPphNo" required="required"></td>
                         </tr>
                         <tr>
                             <td>Whether the College Building(s)<br> owned by the Society(lease/own):</td>
                             <td><input type="radio" name="valOwnBuilding"  <% 
                             if(rs.getInt("valOwnBuilding")==1){ out.print("checked");} 
                             
                             %> >Lease
                             <input type="radio" name="valOwnBuilding"  <% if(rs.getInt("valOwnBuilding")==0){ out.print("checked");} %> >Own</td>
                         </tr>
              </table>
                         <script>
                             
                         </script>
                    
                         <div class="hidden" id="hidden">
                        <table>
                            <tr>
                                
                                <td>Details of lease(lessor/lessee/Period/Survey No):</td>
                                <td><input type="text" name="lLessor" required="required" value="<%=rs.getString("lLessor") %> " class="hidden">lLessor</td>
                                <td><input type="text" name="lLessee" required="required" value="<%=rs.getString("lLessee") %> " class="hidden">lLessee</td>
                                <td><input type="text" name="lPeriod" required="required" value="<%=rs.getString("lPeriod") %> "  class="hidden">lPeriod</td>
                                <td><input type="text" name="lSurveyNo" required="required" value="<%=rs.getString("lSurveyNo") %> " class="hidden">lSurveyNo</td>
                                
                                <td><input type="text" name="lRegNo" required="required" value="<%= rs.getString("lRegNo") %> " >lRegNo</td>
                               
                                <td><input type="date_date_set" name="lRegDate" required="required" value="<%=rs.getDate("lRegDate") %> " class="hidden">lRegDate</td>
                            </tr>
                        </table>
                     </div>
                            <table>
                            
                          
                     <tr>         
                         <td>Land Survey Number:</td>
                         <td><input type="text" name="landSurveyNo"  value="<%=rs.getString("landSurveyNumber") %> " required="required"></td>
                     </tr>
                         
                    <tr>     
                        <td>Documentation No:</td>
                        <td><input type="text" name="landDocNo"  value="<%=rs.getString("landDocNo") %> "required="required"></td>
                    </tr>
                    
                    <tr>
                        <td>Date of Registration:</td>
                        <td><input type="date_date_set" name="landRegDate"  value="<%=rs.getDate("landRegNo") %> "required="required"></td>
                    </tr>
                         
                    <tr>     
                        <td>Whether Registered in the name of Society:</td>
                        <td><input type="radio" name="valRegSociety"  <% if(rs.getInt("valRegSociety")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valRegSociety"  <% if(rs.getInt("valRegSociety")==0){ out.print("checked");} %> >No</td>
                    </tr>
                         
                    <tr>     
                        <td>Represented by the Secretary or Member:</td>
                        <td><input type="radio" name="valSecMem"  <% if(rs.getInt("valSecMem")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valSecMem"  <% if(rs.getInt("valSecMem")==0){ out.print("checked");} %> >No</td>
                    </tr>
                         
                    <tr>    
                        <td>Whether representative name is in the list of members of the society:</td>
                         <td><input type="radio" name="valSocietyMem"  <% if(rs.getInt("valSocietyMem")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valSocietyMem"  <% if(rs.getInt("valSocietyMem")==0){ out.print("checked");} %> >No</td>
                    </tr>
                         
                    <tr>     
                        <td>Whether entire land is in single bit:</td>
                        <td><input type="radio" name="valSingleBit"  <% if(rs.getInt("valSingleBit")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valSingleBit"  <% if(rs.getInt("valSingleBit")==0){ out.print("checked");} %> >No</td>
                    </tr>
                         
                    <tr>     
                        <td>Permission for grant of Construction of Building by the competent authority:</td>
                        <td><select name="grantPremission"><option></option><option value="GP">GP</option><option value="Muncipality">Muncipality</option></select></td>
                    </tr>
                         
                    <tr>     
                        <td>Building MAP approved by the Competent Authority:</td>
                        <td><select name="mapApproval"><option></option><option value="GP">GP</option><option value="Muncipality">Muncipality</option></select></td>
                    </tr>
                         
                    <tr>
                        <td>Total Built-up Area shown in the Map(Carpet area+Corridors+Staircase etc.):</td>
                        <td><input type="number" name="mapArea" value="<%=rs.getInt("mapArea") %>" required="required"></td>
                    </tr>
                   
                     <tr>    
                         <td>Whether Playground is Available in(or)around the college:</td>
                         <td><input type="radio" name="valPlayGround"  <% if(rs.getInt("valPlayGround")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valPlayGround"  <% if(rs.getInt("valPlayGround")==0){ out.print("checked");} %> >No</td>
                   </tr>
                      
                    <tr>     
                        <td>Is parking area available:</td>
                         <td><input type="radio" name="valParkingArea"  <% if(rs.getInt("valParkingArea")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valParkingArea"  <% if(rs.getInt("valParkingArea")==0){ out.print("checked");} %> >No</td>
                    </tr>
                    <tr>     
                        <td>Safe Drinking Water Facility Available:</td>
                        <td><input type="radio" name="valDrinkingWater"  <% if(rs.getInt("valDrinkingWater")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valDrinkingWater"  <% if(rs.getInt("valDrinkingWater")==0){ out.print("checked");} %> >No</td>
                    </tr>
                         
                    <tr>     
                        <td>Whether Fire-Safety measures taken:</td>
                        <td><input type="radio" name="valFireSafety"  <% if(rs.getInt("valFireSafety")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valFireSafety"  <% if(rs.getInt("valFireSafety")==0){ out.print("checked");} %> >No</td>
                    </tr>    
                    <tr>     
                        <td>Whether Sanitary Certificate taken:</td>
                        <td><input type="radio" name="valSanitaryCert"  <% if(rs.getInt("valSanitaryCert")==1){ out.print("checked");} %> >Yes
                             <input type="radio" name="valSanitaryCert"  <% if(rs.getInt("valSanitaryCert")==0){ out.print("checked");} %> >No</td>
                    </tr>
                </table>         
                  
           
               
                    
                                                       <hr>
                                     <h1>Particulars of Land and Builidngs</h1>
                
          <div class="table2">
                  <table> 
                   <tr>
                       <td>Total land in acres:</td>
                       <td><input type="numbers" name="totalLand" value="<%=rs.getInt("totalLand") %>" required="required" autocomplete="false"></td>
                   </tr>
                   
                    <tr>
                        <td>Building plinth raea in Sq.ft.:</td>
                        <td><input type="number" name="bPlinthArea" value="<%=rs.getInt("bPlinthArea") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   
                   <tr>
                       <td>Principal room in Sq.ft.:</td>
                       <td><input type="number" name="priRoomArea" value="<%=rs.getInt("priRoomArea") %>"  required="required" autocomplete="false"></td>
                  </tr>
                  <tr>
                       <td>Office room in Sq.ft.:</td>
                       <td><input type="number" name="offRoomArea" value="<%=rs.getInt("offRoomArea") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>Staff room in sq.ft.:</td>
                       <td><input type="number" name="staffRoomArea" value="<%=rs.getInt("staffRoomArea") %>" required="required" autocomplete="false"></td>
                   </tr>
                   
                   <tr>
                       <td>Games Room in sq.ft.:</td>
                       <td><input type="number" name="gamesRoomArea" value="<%=rs.getInt("gamesRoomArea") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>Ladies Waiting Room in sq.ft.:</td>
                       <td><input type="number" name="lWaitingRoom" value="<%=rs.getInt("lWaitingRoom") %>" required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>Toilets in Sq.ft.:</td>
                       <td><input type="number" name="toiletsRoomArea" value="<%=rs.getInt("toiletsRoomArea") %>" required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>Library in sq.ft.:</td>
                       <td><input type="number" name="libraryArea" value="<%=rs.getInt("libraryArea") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                       <td>No of Class Rooms and each size in sq.ft.:</td>
                       <td><input type="number" name="noClassrooms"  value="<%=rs.getInt("noClassRooms") %>" required="required" autocomplete="false">&emsp;<input type="number" name="classSize" value="<%=rs.getInt("classSize") %>"  required="required" autocomplete="false"></td>
                   </tr>
                   <tr>
                      <td>No of Lab Rooms and each size in sq.ft.:</td>
                      <td><input type="number" name="noLabrooms"  value="<%=rs.getInt("noLabRooms") %>" required="required" autocomplete="false">&emsp;<input type="number" name="labSize" value="<%=rs.getInt("labSize") %>"   required="required" autocomplete="false"></td>
                   </tr>
            
               
               </table> 
             </div>    
                                             <hr>
                                   <h1>Library details</h1>
          <div class="table3">
                    
                         
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
                         <td><input type="number" name="noJournals" value="<%=rs.getInt("noJournels") %>"  required="required" autocomplete="false"></td>
                     </tr>
                     <tr>
                        <td>No of Periodicals:</td>
                        <td><input type="number" name="noPeriodicals" value="<%=rs.getInt("noPeriodicals") %>"  required="required" autocomplete="false"></td>
                     </tr>
                </table> 
         </div>    
                
              
               
                                                 <hr>
                                          <h1>Staff details</h1>
          <div class="table4">
                 <table>
                    <tr>
                          <td>No of Teaching Staff:<input type="number" value="<%=rs.getInt("noTeachingStaff") %>" name="noTeachingStaff"  required="required"                   autocomplete="false">&emsp;&emsp;
                              No of Non-teaching staff:<input type="number" name="noNonTeachingStaff" value="<%=rs.getInt("noNonTeachingStaff") %>"  required="required" autocomplete="false">
                          </td>
                    </tr>
                   
                 </table>
           </div>
                                  
                                                <hr>
                                      <h1>Details of Corpus Fund Deposited</h1>
                
                      
          <div class="table5">
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
                         <td><input type="number" name="CFDno"  value="<%=rs.getInt("CFDNo") %>" required="required" autocomplete="false"></td>
                          <td><input type="date_date_set"  value="<%=rs.getDate("CFDDate") %>" name="CFDdate"  required="required" autocomplete="false"></td>
                          <td><input type="number" name="CFDamount"  required="required" value="<%=rs.getInt("CFDAmount") %>" autocomplete="false"></td>
                          <td><input type="text" name="CFDissuingBank" value="<%=rs.getString("CFDIssuingBank") %>"  required="required" autocomplete="false"></td>
                          <td><input type="date_date_set" name="CFDmaturityDate"  value="<%=rs.getDate("CFDMaturitydate") %>"  required="required" autocomplete="false"></td>
                          <td><input type="date_date_set" name="CFDRenewaldate" value="<%=rs.getDate("CFDRenewalDate") %>"   required="required" autocomplete="false"></td>
                     </tr>
                 
                   </table>
          </div>
               
                
          <div class="buttons">
                 <table>
                    <tr>
                        <td><button><b>SAVE</b></button> </td>
                         <td><button><b>EDIT</b></button> </td>
                         <td><button><b>SAVE and CONTINUE</b></button> </td>
                     
                    </tr>
                 </table>
          </div>
            <%
            }
                %>
               
                
        
        
          </body>
</html>
