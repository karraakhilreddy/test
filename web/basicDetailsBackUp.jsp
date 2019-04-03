<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/breakDown.css">
    <script>
        
        if( performance.navigation.type===2){
          location.reload(true); 
        }
        // document.getElementById("button1").click();
       datePickerId.max = new Date().toISOString().split("T")[0];
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
                        document.getElementById("datefield1").setAttribute("max", today);
                        document.getElementById("datefield2").setAttribute("max", today);
                        document.getElementById("datefield3").setAttribute("max", today);
                        document.getElementById("datefield4").setAttribute("max", today);
                        
                       
                       
           }
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
            
           
     function enableDisable(val) {
    
    if(val==="owned")
    {
     
        document.getElementById("lLessor").style.visibility= "hidden";
         document.getElementById("lLessor").value="-";
        document.getElementById("lLessee").style.visibility= "hidden";
         document.getElementById("lLessee").value="-";
        document.getElementById("lPeriod").style.visibility= "hidden";
        document.getElementById("lPeriod").value="0";
        document.getElementById("lSurveyNo").style.visibility= "hidden";
        document.getElementById("lSurveyNo").value="0";
        document.getElementById("lRegNo").style.visibility= "hidden";
        document.getElementById("lRegNo").value="0";
        document.getElementById("lRegDate").style.visibility= "hidden";
        document.getElementById("lRegDate").value="1111-11-11";
        
    }

     else if(val==="leased") {
        document.getElementById("lLessor").style.visibility= "";
        
        document.getElementById("lLessee").style.visibility= "";
        
        document.getElementById("lPeriod").style.visibility= "";
        
        document.getElementById("lSurveyNo").style.visibility= "";
        
        document.getElementById("lRegNo").style.visibility= "";
        
        document.getElementById("lRegDate").style.visibility= "";
        
     }
 }
   function set(val){
       alert(val);
   }
   
  
    
      
          


     
    </script>
    <style>
        sub{
            
        }
    </style>
</head>

<body onload="openCont(event, 'generalDetails','but1')" >
    
 <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div >
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="80" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="80" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3> <spam>Warangal-506009,Telangana</spam></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
   
<center>
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
</center>
    
<br>
        
    <div class="container">

             
                 
        <div class="tab">
            <button id="button1"  class="tablinks" onclick="openCont(event, 'generalDetails')">General Details <sub>(Step 1)</sub></button>
  <button  id="button2" class="tablinks" onclick="openCont(event, 'buildingDetails')">Building Details <sub>(Step 2)</sub></button>
 <button   id="button3"  class="tablinks" onclick="openCont(event, 'staffDetails')">Staff Details &nbsp;<sub>(Step 3)</sub></button>
  <button  id="button4" class="tablinks" onclick="openCont(event, 'corpusFundDetails')">CorpusFundDetails <sub>(Step 4)</sub></button>
  <button  id="button5" class="tablinks" onclick="openCont(event, 'additionalDetails')">Additional Details <sub>(Step 5)</sub></button>
 
</div>
         <% 
             
             if(session.getAttribute("userId")==null){
                 response.sendRedirect("login.jsp");
             }
            String cCode=(String)session.getAttribute("cCode");
            //int cCode=Integer.parseInt(scCode);
            session.setAttribute("cCode", cCode);
             Connection con=Database.getConnection();
          PreparedStatement ps=con.prepareStatement("select * from cdc_college_details   where cCode='"+cCode+"'");
         ResultSet rs=ps.executeQuery();
           if(rs.next())
            {
               %>
               <center>
<form action="upload.jsp" method="POST">

<!-- Tab content -->
<div id="generalDetails" class="tabcontent active">

    
    <table >
                        <tr>
                              <td>College code:</td>
                              <td><input type="number" value="<%=rs.getString("cCode") %>" readonly="true" ></td>
                            
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
                              <td>College Email:</td>
                              <td><input type="email" name="cEmail" value="<%=rs.getString("cEmail") %>"  ></td>
                            
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
                            <td>Area of the college :</td>
                            <td><select name="areaOfCollege" value="<%=rs.getString("areaOfCollege") %>" required="required" >
                                           <option></option>
                                            <option value="Urban" <% if(rs.getString("areaOfCollege").equals("Urban")){ out.println("selected");} %>>Urban</option>
                                            <option value="Rural" <% if(rs.getString("areaOfCollege").equals("Rural")){ out.println("selected");} %>>Rural</option>
                                </select>
                                    </td></tr>
                         <tr>
                            <td> Nature of the college :</td>
                                    <td><select name="natureOfCollege" value="<%=rs.getString("natureOfCollege") %>" >
                                            <option></option>
                                            <option value="university" <% if(rs.getString("natureOfCollege").equals("university")){ out.println("selected");} %>>University</option>
                                            <option value="universityAutonomous" <% if(rs.getString("natureOfCollege").equals("universityAutonomous")){ out.println("selected");} %>>University Autonomous</option>
                                            <option value="government" <% if(rs.getString("natureOfCollege").equals("government")){ out.println("selected");} %>>Government</option>
                                            <option value="governmentAutonomous" <% if(rs.getString("natureOfCollege").equals("governmentAutonomous")){ out.println("selected");} %>>Government Autonomous</option>
                                            <option value="aided" <% if(rs.getString("natureOfCollege").equals("aided")){ out.println("selected");} %>>Aided</option>
                                            <option value="pivate" <% if(rs.getString("natureOfCollege").equals("pivate")){ out.println("selected");} %>>Private</option>
                                            <option value="privateAutonomous" <% if(rs.getString("natureOfCollege").equals("privateAutonomous")){ out.println("selected");} %>>Private Autonomous</option>
                                            
                                </select>
                                    </td>
                        </tr>
                        <tr>
                               
                                   <td>  Type of College                       </td>
                                   <td><select name="typeOfCollege" value="<%=rs.getString("typeOfCollege") %>" required="required">
                                <option></option>
                                <option value="co-ed" <% if(rs.getString("typeOfCollege").equals("co-ed")){ out.println("selected");} %>>co-ed</option>
                                <option value="womens" <% if(rs.getString("typeOfCollege").equals("womens")){ out.println("selected");} %>>womens</option>
                                       </select></td>
                                       
                        </tr>
                        
               <tr>
                           <td>Society Registration No:</td>
                           <td><input type="text" name="sRegNo" value="<%=rs.getString("sRegNo") %>" required="required"></td>
                         </tr>
                         
                         <tr>
                            <td>Year of registration:</td>
                            <td><input type="number"  name="sYear" value="<%=rs.getInt("sYear") %>" required="required" pattern="(([0-9]).{4,4})"></td>
                         </tr>
                    
                         
                         <tr>
                             <td>Year of Establishment of College:</td>
                             <td><input type="number" name="cEstd"  value="<%=rs.getInt("cEstd") %>" required= "required"></td>
                         </tr>
                         <tr>
                             <td>Name of the Secretary/Correspondent: </td>
                             <td> <input type="text" name="secName" required="required"  value="<%=rs.getString("secName") %>" ></td>
                         </tr>
                         
                         <tr>
                             <td>Mobile Number of the Secretary:</td>  
                             <td><input type="text"  name="secPhNo" pattern="(([6-9][0-9]).{8,8})" title="enter a valid Indian Phone Number" value="<%=rs.getLong("secPhNo") %>" required="required"></td> 
                         </tr>
                         
                         <tr>
                             <td>Name of the Principal:</td>
                             <td><input type="text" name="cPrincipal"  value="<%=rs.getString("cPrincipal") %>" required="required" ></td> 
                         </tr>
                          
                         <tr>
                            <td>Mobile Number of the Principal:</td>
                            <td><input type="text" name="cPPhNo" pattern="(([6-9][0-9]).{8,8})" title="enter a valid Indian Phone Number" value="<%=rs.getLong("cPPhNo")%>" required="required" pattern="(([6-9][0-9]).{8,10})" ></td>
                         </tr>
                         
    </table>
                         <br><br>

<button name="name" value="generalDetails" type="submit">UPDATE</button>               
  
                 <br><br>
</div>
</form>
                         <form action="upload.jsp" method="POST">
<div id="buildingDetails" class="tabcontent" >
     
    
    
    
     <table>
         <tr>
              <td>  whether the college building is owned by society(owned/rented)                       </td>
              <td><select id="valOwnBuilding" name="valOwnBuilding" onload="set(this.value)" onclick="enableDisable(this.value)" value="<%=rs.getString("valOwnBuilding") %>" required="required">
                                <option></option>
                                <option value="owned" <% if(rs.getString("valOwnBuilding").equals("owned")){ out.println("selected");} %>>Owned</option>
                                <option value="leased" <% if(rs.getString("valOwnBuilding").equals("leased")){ out.println("selected");} %>>Leased</option>
                                       </select></td>
         </tr>
         <tr>
             <td colspan="2"><b>if leased please fillup these details</b></td>
             
         </tr>              
         <tr>
             <td colspan="2"> [ Details of lease(lessor/lessee/Period/Survey No):</td>
             
         </tr>              
         <tr>
             <td>&nbsp;Lessor</td>
             <td><input type="text" id="lLessor" name="lLessor"  value="<%=rs.getString("lLessor") %>" class="hidden"></td>
         </tr>              
         <tr>
             <td>&nbsp;Lessee</td>
             <td><input type="text"  id="lLessee" name="lLessee"  value="<%=rs.getString("lLessee") %>" class="hidden"></td>
         </tr>              
         <tr>
             <td>&nbsp;Period</td>
             <td><input type="number"  id="lPeriod" name="lPeriod"   value="<%=rs.getInt("lPeriod") %>" ></td>
         </tr>              
         <tr>
             <td>&nbsp;Building SurveyNo</td>
             <td><input type="text" id="lSurveyNo" name="lSurveyNo"   value="<%=rs.getString("lSurveyNo") %>" class="hidden"></td>
         </tr>    
         <tr>
             <td> &nbsp;Building RegNo</td>
             <td><input type="text" name="lRegNo" id="lRegNo"    value="<%= rs.getString("lRegNo") %>" ></td>
         </tr>
         <tr>
             <td>&nbsp;Building RegDate ]</td>
             <td><input type="date" name="lRegDate" id="lRegDate"  value="<%=rs.getDate("lRegDate") %>"   onclick="dateset();" id="datefield1" min="1111-11-11" max="2019-02-12"></td>
         </tr>
                  
                            
                          
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
                        <td><input type="date" name="landRegDate"  value="<%=rs.getDate("landRegDate") %>"required="required" onclick="dateset()" id="datefield2" min="1899-11-11" max="2019-02-12"></td>
                    </tr>
                         
                    <tr>     
                        <td>Whether Registered in the name of Society:</td>
                        <td><input type="radio" name="valRegSociety" value="Yes"  required="required"  <% if(rs.getString("valRegSociety").equals("Yes")){ out.println("checked");} %>>Yes
                             <input type="radio" name="valRegSociety" value="No" <% if(rs.getString("valRegSociety").equals("No")){ out.println("checked");} %> >No</td>
                    </tr>
                         
                    <tr>     
                        <td>Represented by the Secretary or Member:</td>
                        <td><input type="radio" name="valSecMem" value="Yes"  required="required"<% if(rs.getString("valSecMem").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valSecMem" value="No" <% if(rs.getString("valSecMem").equals("No")){ out.println("checked");} %>>No </td>
                    </tr>
                         
                    <tr>    
                        <td>Whether representative name is in the list of members of the society:</td>
                         <td><input type="radio" name="valSocietyMem" value="Yes" required="required" <% if(rs.getString("valSocietyMem").equals("Yes")){ out.println("checked");} %>>Yes
                             <input type="radio" name="valSocietyMem" value="No" <% if(rs.getString("valSocietyMem").equals("No")){ out.println("checked");} %>>No</td>
                    </tr>
                         
                    <tr>     
                        <td>Whether entire land is in single bit:</td>
                        <td><input type="radio" name="valSingleBit" value="Yes" required="required" <% if(rs.getString("valSingleBit").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valSingleBit" value="No" <% if(rs.getString("valSingleBit").equals("No")){ out.println("checked");} %>>No</td>
                    </tr>
                     <tr>
                           <td>Whether the sketch plan of land is certified by MRO/Tahasildar:</td>
                          <td><input type="radio" name="valLandCert" value="Yes" required="required" <% if(rs.getString("valLandCert").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valLandCert" value="No" <% if(rs.getString("valLandCert").equals("No")){ out.println("checked");} %> > No </td>
                         </tr>
                         
                         
                    <tr>     
                        <td>Permission for grant of Construction of Building by the competent authority:</td>
                        <td><select name="grantPermission" required="required" value="<%=rs.getString("grantPermission") %>" required="required">
                                <option></option>
                                <option value="gramPanchayat" required="required" <% if(rs.getString("grantPermission").equals("gramPanchayat")){ out.println("selected");} %>>GramPanchayat</option>
                                <option value="muncipality" <% if(rs.getString("grantPermission").equals("muncipality")){ out.println("selected");} %>>Muncipality</option>
                            </select></td>
                    </tr>
                         
                    <tr>     
                        <td>Building MAP approved by the Competent Authority:</td>
                        <td><select name="mapApproval" required="required" value="<%=rs.getString("mapApproval") %>" required="required">
                                <option></option>
                                <option value="gramPanchayat" <% if(rs.getString("mapApproval").equals("gramPanchayat")){ out.println("selected");} %>>GramPanchayat</option>
                                <option value="muncipality" <% if(rs.getString("mapApproval").equals("muncipality")){ out.println("selected");} %>>Muncipality</option>
                            </select>
                        </td>
                    </tr>
                         
                    <tr>
                        <td>Total Built-up Area shown in the Map(Carpet area+Corridors+Staircase etc.):</td>
                        <td><input type="number" name="mapArea"  value="<%=rs.getInt("mapArea") %>" required="required"></td>
                    </tr>
                   
                     <tr>    
                         <td>Whether Playground is Available in(or)around the college:</td>
                         <td><input type="radio" name="valPlayGround" required="required"  value="Yes" <% if(rs.getString("valPlayGround").equals("Yes")){ out.println("checked");} %>>Yes
                             <input type="radio" name="valPlayGround" value="No"<% if(rs.getString("valPlayGround").equals("No")){ out.println("checked");} %> >No</td>
                   </tr>
                      
                    <tr>     
                        <td>Is parking area available:</td>
                         <td><input type="radio" name="valParkingArea" required="required"  value="Yes"<% if(rs.getString("valParkingArea").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valParkingArea"  value="No" <% if(rs.getString("valParkingArea").equals("No")){ out.println("checked");} %> >No</td>
                    </tr>
                    <tr>     
                        <td>Safe Drinking Water Facility Available:</td>
                        <td><input type="radio" name="valDrinkingWater"  required="required" value="Yes" <% if(rs.getString("valDrinkingWater").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valDrinkingWater" value="No" <% if(rs.getString("valDrinkingWater").equals("No")){ out.println("checked");} %> >No</td>
                    </tr>
                         
                    <tr>     
                        <td>Whether Fire-Safety measures taken:</td>
                        <td><input type="radio" name="valFireSafety" required="required"  value="Yes" <% if(rs.getString("valFireSafety").equals("Yes")){ out.println("checked");} %>>Yes
                             <input type="radio" name="valFireSafety" value="No"<% if(rs.getString("valFireSafety").equals("No")){ out.println("checked");} %> >No</td>
                    </tr>    
                    <tr>     
                        <td>Whether Sanitary Certificate taken:</td>
                        <td><input type="radio" name="valSanitaryCert"  required="required" value="Yes" <% if(rs.getString("valSanitaryCert").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="valSanitaryCert" value="No" <% if(rs.getString("valSanitaryCert").equals("No")){ out.println("checked");} %> >No</td>
                    </tr>
               
                   <tr>
                       <td>Total land in acres:</td>
                       <td colspan="2"><input type="number" name="totalLand"  value="<%=rs.getInt("totalLand") %>" required="required" ></td>
                   </tr>
                   
                    <tr>
                        <td>Building plinth area in Sq.ft.:</td>
                        <td colspan="2"><input type="number"  name="bPlinthArea" value="<%=rs.getInt("bPlinthArea") %>"  required="required" ></td>
                   </tr>
                   
                   <tr>
                       <td>Principal room in Sq.ft.:</td>
                       <td colspan="2"><input type="number"  name="priRoomArea" value="<%=rs.getInt("priRoomArea") %>"  required="required" ></td>
                  </tr>
                  <tr>
                       <td>Office room in Sq.ft.:</td>
                       <td colspan="2"><input type="number" name="offRoomArea" value="<%=rs.getInt("offRoomArea") %>"  required="required" ></td>
                   </tr>
                   <tr>
                       <td>Staff room in sq.ft.:</td>
                       <td colspan="2"><input type="number" name="staffRoomArea" value="<%=rs.getInt("staffRoomArea") %>" required="required" ></td>
                   </tr>
                   
                   <tr>
                       <td>Games Room in sq.ft.:</td>
                       <td colspan="2"><input type="number" name="gamesRoomArea" value="<%=rs.getInt("gamesRoomArea") %>"  required="required" ></td>
                   </tr>
                   <tr>
                       <td>Ladies Waiting Room in sq.ft.:</td>
                       <td colspan="2"><input type="number" name="lWaitingRoom" value="<%=rs.getInt("lWaitingRoom") %>" required="required" ></td>
                   </tr>
                   <tr>
                       <td>Toilets in Sq.ft.:</td>
                       <td colspan="2"><input type="number" name="toiletsRoomArea" value="<%=rs.getInt("toiletsRoomArea") %>" required="required"> </td>
                   </tr>
                   <tr>
                       <td>Library in sq.ft.:</td>
                       <td colspan="2" ><input type="number" name="libraryArea" value="<%=rs.getInt("libraryArea") %>"  required="required" ></td>
                   </tr>
                   <tr>
                       <td>No of Class Rooms and size of each room in sq.ft</td>
                       <td><input type="number" name="noClassRooms"  value="<%=rs.getInt("noClassRooms") %>" required="required" >
                           <input type="number" name="classSize" value="<%=rs.getInt("classSize") %>"  required="required" ></td>
                   </tr>
                   <tr>
                      <td>No of Lab Rooms and size of each room in sq.ft</td>
                      <td><input type="number" name="noLabRooms"  value="<%=rs.getInt("noLabRooms") %>" required="required" >
                      <input type="number" name="labSize" value="<%=rs.getInt("labSize") %>"   required="required" ></td>
                   </tr>
                  
                  
                   
                   
                   
               
               </table> 
                    <br><br>
                   
                   
<button name="name" value="buildingDetails" type="submit">UPDATE</button>                     
   <br><br>
</div>
                         </form>
<form action="upload.jsp" method="POST">
<div id="staffDetails" class="tabcontent">
     
    <h1> Library Details</h1>
                         
                <table>
                     <tr>   
                        <td>Name of the Librarian:</td>
                        <td><input type="text" name="nLibrarian" value="<%=rs.getString("nLibrarian") %>" placeholder="name" required="required" ></td>
                     </tr>
                     <tr>
                         <td>No of books:</td>
                         <td><input type="number" name="noBooks" value="<%=rs.getInt("noBooks") %>" required="required" ></td>
                     </tr>
                     <tr>
                         <td>No of Journals:</td>
                         <td><input type="number" name="noJournels" value="<%=rs.getInt("noJournels") %>"  required="required" ></td>
                     </tr>
                     <tr>
                        <td>No of Periodicals:</td>
                        <td><input type="number" name="noPeriodicals" value="<%=rs.getInt("noPeriodicals") %>"  required="required" ></td>
                     </tr>
                </table> 
        
                
              
               
                                               
                                          <h1>Staff details</h1>
         
                 <table>
                    <tr>
                          <td>No of Teaching Staff:<input type="number" value="<%=rs.getInt("noTeachingStaff") %>" name="noTeachingStaff"  required="required"                   >&emsp;&emsp;
                              No of Non-teaching staff:<input type="number" name="noNonTeachingStaff" value="<%=rs.getInt("noNonTeachingStaff") %>"  required="required" >
                          </td>
                    </tr>
                   
                 </table>
                 <br><br>
                        
<button name="name" value="staffDetails" type="submit">UPDATE</button>                        
                         
                     <br><br>
               
          </div>
                           </form>
<form action="upload.jsp" method="POST">
<div id="corpusFundDetails" class="tabcontent">
     
         
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
                         <td><input type="text" name="CFDNo"  value="<%=rs.getString("CFDNo") %>" required="required" ></td>
                          <td><input type="date" name="CFDDate" value="<%=rs.getDate("CFDDate") %>" name="CFDDate"  required="required"  onclick="dateset()" id="datefield3" min="1899-11-11" max="2019-02-12" ></td>
                          <td><input type="number" name="CFDAmount"  required="required" value="<%=rs.getInt("CFDAmount") %>" ></td>
                          <td><input type="text" name="CFDIssuingBank" value="<%=rs.getString("CFDIssuingBank") %>"  required="required" ></td>
                          <td><input type="date" name="CFDMaturitydate"  value="<%=rs.getDate("CFDMaturitydate") %>"  required="required" onclick="dateset()" id="datefield4" min="1899-11-11"  ></td>
                          <td><input type="date" name="CFDRenewalDate" value="<%=rs.getDate("CFDRenewalDate") %>"   required="required"   ></td>
                     </tr>
                 
                   </table>
                      <br><br>
                
                        
<button name="name" value="corpusFundDetails" type="submit">UPDATE</button>                        
                      <br><br>    
                     
                   
               
          </div>
                      </form>
<form action="upload.jsp" method="POST">
          <div id="additionalDetails" class="tabcontent" >
              
              
              
              <table>
                  
                   <tr>
                       <td>Students attendance system </td>
                       <td><input type="radio" name="cAttendanceSystem" value="registers" required="required" <% if(rs.getString("cAttendanceSystem").equals("registers")){ out.println("checked");} %> >registers
                             <input type="radio" name="cAttendanceSystem" value="biometric" <% if(rs.getString("cAttendanceSystem").equals("biometric")){ out.println("checked");} %> >biometric</td>
                   </tr>
                   <tr>
                       <td>Provision of CCTVs</td>
                       <td><input type="radio" name="cCCTV" value="Yes" required="required" <% if(rs.getString("cCCTV").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="cCCTV" value="No" <% if(rs.getString("cCCTV").equals("No")){ out.println("checked");} %> >No</td>
                   </tr>
                   <tr>
                       <td>Availability of computers</td>
                       <td><input type="radio" name="cComputers" required="required" value="Yes" <% if(rs.getString("cComputers").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="cComputers" value="No" <% if(rs.getString("cComputers").equals("No")){ out.println("checked");} %> >No</td>
                   </tr>
                   <tr>
                       <td>Availability of projectors</td>
                       <td><input type="radio" name="cProjectors"  required="required"value="Yes" <% if(rs.getString("cProjectors").equals("Yes")){ out.println("checked");} %>>Yes
                            <input type="radio" name="cProjectors" value="No" <% if(rs.getString("cProjectors").equals("No")){ out.println("checked");} %>> No</td>
                   </tr>
                   <tr>
                       <td>Whether the college is having NSS unit</td>
                       <td><input type="radio" name="cNSSUnit" required="required" value="Yes" <% if(rs.getString("cNSSUnit").equals("Yes")){ out.println("checked");} %> >Yes
                             <input type="radio" name="cNSSUnit" value="No" <% if(rs.getString("cNSSUnit").equals("No")){ out.println("checked");} %> >No</td>
                   </tr>
                   <tr>
                       <td>No of programs/camps organized in the last year</td>
                        <td><input type="number" name="cNSSCampsNo"  value="<%= rs.getInt("cNSSCampsNo")%>"> </td>            
                   </tr>
                   <tr>
                       <td>Whether the college is convening governing body meetings regularly by inviting university nominee</td>
                       <td><input type="radio" name="cMeetings" required="required" value="Yes" <% if(rs.getString("cMeetings").equals("Yes")){ out.println("checked");} %>>Yes
                            <input type="radio" name="cMeetings" value="No" <% if(rs.getString("cMeetings").equals("No")){ out.println("checked");} %>> No</td>
                   </tr>
                  
              </table>
                    <br><br>
              <button name="name" value="additionalDetails" type="submit">UPDATE</button>
            <br><br>

          </div>
                   
                    </form>
                   </center>
</div>


                   
 <%
            }

                %>

       
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