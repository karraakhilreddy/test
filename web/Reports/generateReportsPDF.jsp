<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@ page import="java.io.*"%>
<%@page import="com.lowagie.text.*,com.lowagie.text.pdf.*"%>;
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script>
    function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
    }
</script>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="../CSS/indexCSS.css">
</head>
<body style="background: black">
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="../IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="../IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h3 style="color:navyblue; font-family: Bookman Old Style; ">COLLEGE DEVELOPMENT COUNCIL</h3>
         <h1 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>KAKATIYA UNIVERSITY.</b></h1>
          <h4><spam>Warangal-506 009,Telangana</spam></h4><h5><b>Ph: 9440163189. drchr18@yahoo.com</b></h5>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>welcome to college development council</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
             <ul>
                <button class="tablinks" onclick="window.location='../home.jsp'" ><li>About</li></button>
                <button class="active" onclick="window.location='../login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='../admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='../dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='../help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
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
                                 
                            </tr>
                        </table>
                    </nav>
                   
        <%
            String button=request.getParameter("button");
            out.print(button);
            
            
             Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            con = Database.getConnection();
            st = con.createStatement();

            Document document = new Document(PageSize.LETTER.rotate());
                    String f="D://table.pdf";
    
        
            switch(button){
                case "Course" :
                    String cCode=(String)session.getAttribute("cCode");
                    rs = st.executeQuery("SELECT * FROM cdc.courses where cCode="+cCode+";");
                    %>
        
                          <table width="100%" border="0">
                           
                            </table>
                                    <table width="100%" border="1">
                           
                            </table><br>
                        <center>
                        <TABLE BORDER="10" CELLPADDING="6" CELLSPACING="2" WIDTH="70%">
                            <tr bgcolor="deepskyblue">
                                <td><b>Type</b></td>
                                <td><b>Course</b></td>
                                <td><b>Combination</b></td>
                                <td><b>Medium</b></td>
                                <td><b>Intake</b></td>
                                <td><b>Admitted</b></td>

                                </tr>
                    <%

                    
                    PdfWriter.getInstance(document, new FileOutputStream(new File(f)));
                    document.open();

                    String[] headers = new String[] {"Type", "Course", "Combination", "Medium","Intake", "Admitted"};
                    PdfPTable table = new PdfPTable(headers.length);
                                for (int i = 0; i < headers.length; i++) {
                                    String header = headers[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 10, Font.BOLD)));
                                    table.addCell(cell);
                                }
                                table.completeRow();
                    while (rs.next()){
                        String st1=rs.getString("ctype");
                    String st2=rs.getString("cCourse");
                    String st3=rs.getString("cCombination");
                    String st4=rs.getString("cMedium");
                    String st5=String.valueOf(rs.getInt("cIntakeSanctioned"));
                    String st6=String.valueOf(rs.getInt("cStudentsAdmitted"));
                    table.addCell(st1);
                    table.addCell(st2);
                    table.addCell(st3);
                    table.addCell(st4);
                    table.addCell(st5);
                    table.addCell(st6);
                    table.completeRow();
                        %>        <tr >
                                <td><font size="2"><%=st1%></font></td>
                                <td><font size="2"><%=st2%></font></td>
                                <td><font size="2"><%=st3%></font></td>
                                <td><font size="2"><%=st4%></font></td>
                                <td><font size="2"><%=st5%></font></td>
                                <td><font size="2"><%=st6%></font></td>
                            </tr>

                    <% 
                    }
                    document.add(table);
                    document.close();
                    System.out.println(f);
                    %>
                        </TABLE>
                         <a href="download.jsp?ff=<%=f%>">Download the  as PDF</a>
                        <a href="excelData.jsp?button=Course">Download as Excel file</a>
                        </center>
        
                    <%
                    
                   
                    
                    
                    
                    break;
                    case "Faculty" :
                     cCode=(String)session.getAttribute("cCode");
                    rs = st.executeQuery("SELECT * FROM cdc.faculty where cCode="+cCode+";");
                    %>
        
                          <table width="100%" border="0">
                            
                            </table>
                             <br>
                        <center>
                        <TABLE BORDER="10" CELLPADDING="6" CELLSPACING="2" WIDTH="70%">
                            <tr bgcolor="deepskyblue">
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

                                </tr>
                    <%

                    
                    PdfWriter.getInstance(document, new FileOutputStream(new File(f)));
                    document.open();

                    String[] headers2 = new String[] {"Name","Type", "Designation", "Qualification", "Date of appointment","Nature of appointment", "Mode of appointment","Scale of pay","Mode of pay","Bank account Number","PAN card Number","Aadhar number","Mobile Number"};
                    PdfPTable table2 = new PdfPTable(headers2.length);
                                for (int i = 0; i < headers2.length; i++) {
                                    String header = headers2[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 10, Font.BOLD)));
                                    table2.addCell(cell);
                                }
                                table2.completeRow();
                    while (rs.next()){
                        String st1=rs.getString("tName");
                    String st2=rs.getString("tType");
                    String st3=rs.getString("tdesignation");
                    String st4=rs.getString("tQualification");
                    String st5=rs.getString("tDate");
                    String st6=rs.getString("tnature");
                    String st7=rs.getString("tModeApp");
                    String st8=rs.getString("tScale");
                    String st9=rs.getString("tModePay");
                    String st10=rs.getString("tBank");
                    String st11=rs.getString("tPAN");
                    String st12=rs.getString("tAadhar");
                    String st13=rs.getString("tMobile");
                    
                    table2.addCell(st1);
                    table2.addCell(st2);
                    table2.addCell(st3);
                    table2.addCell(st4);
                    table2.addCell(st5);
                    table2.addCell(st6);
                    table2.addCell(st7);
                    table2.addCell(st8);
                    table2.addCell(st9);
                    table2.addCell(st10);
                    table2.addCell(st11);
                    table2.addCell(st12);
                    table2.addCell(st13);
                    table2.completeRow();
                        %>        <tr >
                                <td><font size="2"><%=st1%></font></td>
                                <td><font size="2"><%=st2%></font></td>
                                <td><font size="2"><%=st3%></font></td>
                                <td><font size="2"><%=st4%></font></td>
                                <td><font size="2"><%=st5%></font></td>
                                <td><font size="2"><%=st6%></font></td>
                                <td><font size="2"><%=st7%></font></td>
                                <td><font size="2"><%=st8%></font></td>
                                <td><font size="2"><%=st9%></font></td>
                                <td><font size="2"><%=st10%></font></td>
                                <td><font size="2"><%=st11%></font></td>
                                <td><font size="2"><%=st12%></font></td>
                                <td><font size="2"><%=st13%></font></td>
                            </tr>

                    <% 
                    }
                    document.add(table2);
                    document.close();
                    System.out.println(f);
                    %>
                        </TABLE>
                        <a href="download.jsp?ff=<%=f%>">Download the  as PDF</a>
                        <a href="excelData.jsp?button=Faculty">Download as Excel file</a>
                        </center>
        
                    <%
                    
                   
                    
                    
                    
                    break;
                    
                    
                    case "adminCollegeCourse" :
                    rs = st.executeQuery("SELECT cdc_college_details.cCode,cName,cType,cCourse,cCombination,cMedium,cIntakeSanctioned,cStudentsAdmitted,cStatus FROM  cdc_college_details  LEFT JOIN  courses ON cdc_college_details.ccode=courses.cCode Order by cdc_college_details.cCode ;");
                    %>
        
                          
                        <center>
                        <TABLE BORDER="10" CELLPADDING="6" CELLSPACING="2" WIDTH="70%">
                            <tr bgcolor="">
                                <td>Code</td>
                                <td>Name</td>
                                <td>Type</td>
                                <td>Course</td>
                                <td>Combination</td>
                                <td>Medium</td>
                                <td>Intake sanctioned</td>
                                <td>Students admitted</td>
                                <td>Status</td>
                               
                                
                                </tr>
                    <%

                    
                    PdfWriter.getInstance(document, new FileOutputStream(new File(f)));
                    document.open();
                                                                    
                    String[] headers3 = new String[] {"Code","Name","Type", "Course", "Combination", "Medium","Intake sanctioned", "Students admitted","Status"};
                    PdfPTable table3 = new PdfPTable(headers3.length);
                                for (int i = 0; i < headers3.length; i++) {
                                    String header = headers3[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 10, Font.BOLD)));
                                    table3.addCell(cell);
                                }
                                table3.completeRow();
                    while (rs.next()){
                        
                        String st1=rs.getString("cdc_college_details.cCode");
                    String st2=rs.getString("cName");
                    String st3=rs.getString("cType");
                    String st4=rs.getString("cCourse");
                    String st5=rs.getString("cCombination");
                    String st6=rs.getString("cMedium");
                    String st7=rs.getString("cIntakeSanctioned");
                    String st8=rs.getString("cStudentsAdmitted");
                    String st9=rs.getString("cStatus");
                    
                    
                    table3.addCell(st1);
                    table3.addCell(st2);
                    table3.addCell(st3);
                    table3.addCell(st4);
                    table3.addCell(st5);
                    table3.addCell(st6);
                    table3.addCell(st7);
                    table3.addCell(st8);
                    table3.addCell(st9);
                    
                    table3.completeRow();
                        %>      
                        <tr >
                                <td><font size="2"><%=st1%></font></td>
                                <td><font size="2"><%=st2%></font></td>
                                <td><font size="2"><%=st3%></font></td>
                                <td><font size="2"><%=st4%></font></td>
                                <td><font size="2"><%=st5%></font></td>
                                <td><font size="2"><%=st6%></font></td>
                                <td><font size="2"><%=st7%></font></td>
                                <td><font size="2"><%=st8%></font></td>
                                <td><font size="2"><%=st9%></font></td>
                                
                            </tr>

                    <% 
                    }
                    document.add(table3);
                    document.close();
                    System.out.println(f);
                    %>
                        </TABLE>
                        <a href="download.jsp?ff=<%=f%>">Download the  as PDF</a>
                        <a href="excelData.jsp?button=adminCollegeCourse">Download as Excel file</a>
                        </center>
        
                    <%
                    
                   
                    
                    
                    
                    break;
                    case "Logs" :
                    
                    rs = st.executeQuery("SELECT * FROM cdc.logs ;");
                    %>
        
                          <table width="100%" border="0">
                           
                            </table>
                                    <table width="100%" border="1">
                           
                            </table><br>
                        <center>
                        <TABLE BORDER="10" CELLPADDING="6" CELLSPACING="2" WIDTH="70%">
                            <tr bgcolor="deepskyblue">
                                <td><b>College Code</b></td>
                                <td><b>Time</b></td>
                                <td><b>IP</b></td>
                                <td><b>In</b></td>
                                <td><b>Action</b></td>
                                

                                </tr>
                    <%

                    
                    PdfWriter.getInstance(document, new FileOutputStream(new File(f)));
                    document.open();

                    String[] headers4 = new String[] {"College Code", "Time", "IP", "In Page","Action"};
                    PdfPTable table4 = new PdfPTable(headers4.length);
                                for (int i = 0; i < headers4.length; i++) {
                                    String header = headers4[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 10, Font.BOLD)));
                                    table4.addCell(cell);
                                }
                                table4.completeRow();
                    while (rs.next()){
                        String st1=rs.getString("cCode");
                    String st2=rs.getString("time");
                    String st3=rs.getString("ip");
                    String st4=rs.getString("in");
                    String st5=rs.getString("action");
                    
                    table4.addCell(st1);
                    table4.addCell(st2);
                    table4.addCell(st3);
                    table4.addCell(st4);
                    table4.addCell(st5);
                    
                    table4.completeRow();
                        %>        <tr >
                                <td><font size="2"><%=st1%></font></td>
                                <td><font size="2"><%=st2%></font></td>
                                <td><font size="2"><%=st3%></font></td>
                                <td><font size="2"><%=st4%></font></td>
                                <td><font size="2"><%=st5%></font></td>
                                
                            </tr>

                    <% 
                    }
                    document.add(table4);
                    document.close();
                    System.out.println(f);
                    %>
                        </TABLE>
                         <a href="download.jsp?ff=<%=f%>">Download the  as PDF</a>
                        <a href="excelData.jsp?button=Course">Download as Excel file</a>
                        </center>
        
                    <%
                    
                   
                    
                    
                    
                    break;
                    case "Basic" :
                    
                    
                    %>
                    <div class="spec">
                    <div id="printableArea">
      
                   <%     
                       cCode=(String)session.getAttribute("cCode");
            
            
             
                    PreparedStatement ps=con.prepareStatement("select * from cdc_college_details   where cCode='"+cCode+"'");
                    rs=ps.executeQuery();
                     if(rs.next())
                      {
                    %>
               
               
                   
              
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
                             <td><input type="date" name="cEstd"  value="<%=rs.getDate("cEstd") %>" required= "required"></td>
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
         
                    </div>
                            
                            
                    <input type="button" onclick="printDiv('printableArea')" value="print a div!" />        
                            
                    <%
                    
                    out.print("hELLO");
                    
                    
                    break;
                 }   
                    
            }
        
        
        
        %>
        
    </div>
        
       
              
                  
            
                   
                
        
       
        <footer>
            <p id="copyright"> Copyrights reserved by Kakatiya University&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="developers.jsp">Developers</a></p>
            
            
        </footer>
</body>
</html>