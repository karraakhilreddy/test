
<%@page import="org.apache.poi.ss.usermodel.FontFamily"%>
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
                                 <td><button class="" onclick="location.href = '../logout.jsp'">LOGOUT</button></td>
                                 
                            </tr>
                        </table>
                    </nav>
                   
        <%
            String button=request.getParameter("button");
            out.print("<h2>"+button+"</h2>");
            
            
             Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            ResultSet rs2 = null;

            con = Database.getConnection();
            st = con.createStatement();
            String cCode=(String)session.getAttribute("cCode");
             File tempFile = File.createTempFile(cCode+"report", ".pdf");
            Document document = new Document(PageSize.A4);
            
                    String f=tempFile.getAbsolutePath();//"D://table.pdf";
    
        
            switch(button){
                case "Course" :
                     cCode=(String)session.getAttribute("cCode");
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
                                <td><b>Status</b></td>

                                </tr>
                    <%

                   
                    PdfWriter.getInstance(document, new FileOutputStream(tempFile));
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
                    String st7=rs.getString("cStatus");
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
                                <td><font size="2"><%=st7%></font></td>
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

                    
                    PdfWriter.getInstance(document, new FileOutputStream(tempFile));
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

                    
                    PdfWriter.getInstance(document, new FileOutputStream(tempFile));
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

                    
                    PdfWriter.getInstance(document, new FileOutputStream(tempFile));
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
                    case "Basic2" :
                    
                    
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
                    
                    
                    
                 }   
                  
                  break;
                    
                    case "Basic":
                    
                    
                        
                    java.util.Date dt = new java.util.Date();

            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");

            String currentYear = sdf.format(dt);
            int nextYear=Integer.parseInt(currentYear)+1;
            int previousYear=Integer.parseInt(currentYear)-1;
            String cName=" ";
                   
                   
                rs2 = st.executeQuery("SELECT iAmount FROM cdc_college_details where ccode="+cCode+";");
                if(rs2.next()){
                    if(rs2.getInt("iAmount")==0){
                        %><script>
                            alert('To download application please pay inspection fee.');
                            window.location.replace("reports.jsp");        
                         </script><%
                        break;
                    }
                }    
                    PdfWriter.getInstance(document, new FileOutputStream(tempFile));
                    document.open();
                    document.setMargins(1, 1, 20, 1);
                    document.setMarginMirroring(true);
                    
                    //headers4 = new String[] {"College Code", "Time", "IP", "In Page","Action"};
                    table4 = new PdfPTable(2);
                    
                    //Font fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    Paragraph p=new Paragraph("College Development Council");
                    float fntSize, lineSpacing;
                    fntSize = 15f;
                    lineSpacing = 10f;
                   /* p = new Paragraph(new Phrase(lineSpacing,"College Development Council",FontFactory.getFont(FontFactory.COURIER_BOLD, fntSize)));
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);*/
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    p=new Paragraph(new Phrase(lineSpacing,"\n\nKakatiya University",FontFactory.getFont(FontFactory.COURIER_BOLD, 20f)));
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    p=new Paragraph(new Phrase(lineSpacing,"\nWarangal - 506009",FontFactory.getFont(FontFactory.COURIER, fntSize)));
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                     
                     
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);


                    Image image = Image.getInstance("http://localhost:8084/test_1_1_1/IMG/1.png");
                     image.scaleAbsolute(80f, 80f);
                    image.setAbsolutePosition(85f, 740f);
                    document.add(image);

                     //p=new Paragraph("Inspection Report for the academic year 20 -20  .");
                    p = new Paragraph(new Phrase(lineSpacing,"Application for Extension of Affiliation \n\n for the academic year "+currentYear+"-"+nextYear,FontFactory.getFont(FontFactory.COURIER_BOLD, 15f)));
                    
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                    
                   rs = st.executeQuery("SELECT * FROM cdc_college_details where ccode="+cCode+";");

                    while (rs.next()){
                    
                    cName=rs.getString("cName");

                    table4.addCell("College Code");
                    table4.addCell(rs.getString("cCode"));
                    table4.completeRow();
                  
                    table4.addCell("Name of the college");
                    table4.addCell(rs.getString("cName"));
                    table4.completeRow();
                   
                    table4.addCell("Email");
                    table4.addCell(rs.getString("cEmail"));
                    table4.completeRow();
                                           
                   
                    table4.addCell("Address of the College");
                    table4.addCell(rs.getString("cAddress"));
                    table4.completeRow();
                    
                       
                   
                    table4.addCell("Name of the sponsoring society");
                    table4.addCell(rs.getString("sName"));
                    table4.completeRow();
                    
                       
                    
                    table4.addCell("Area of the college");
                    table4.addCell(rs.getString("areaOfCollege"));
                    table4.completeRow();
                    
                       
                   
                    table4.addCell("Nature of the college");
                    table4.addCell(rs.getString("natureOfCollege"));
                    table4.completeRow();
                    
                    table4.addCell("Type of the college");
                    table4.addCell(rs.getString("typeOfCollege"));
                    table4.completeRow();
                   
                    table4.addCell("Society Registration Number");
                    table4.addCell(rs.getString("sRegNo"));
                    table4.completeRow();
                   
                    table4.addCell("Year of registration");
                    table4.addCell(rs.getString("sYear"));
                    table4.completeRow();
                   
                    table4.addCell("Year of establishment of college");
                    table4.addCell(rs.getString("cEstd"));
                    table4.completeRow();
                   
                    table4.addCell("Name of the Secretary/Corresponndent");
                    table4.addCell(rs.getString("secName"));
                    table4.completeRow();
                   
                    table4.addCell("Mobile no.of Secratary");
                    table4.addCell(rs.getString("secPhNo"));
                    table4.completeRow();
                   
                    table4.addCell("Name of the Principal");
                    table4.addCell(rs.getString("cPrincipal"));
                    table4.completeRow();
                   
                    table4.addCell("Mobile no.of Principal");
                    table4.addCell(rs.getString("cPPhNo"));
                    table4.completeRow();
                   
                    
                   
                    table4.addCell("Whether the college building is owned by the society");
                    table4.addCell(rs.getString("valOwnBuilding"));
                    table4.completeRow();
                   
                    if(!rs.getString("valOwnBuilding").equals("owned")){
                        
                         table4.addCell("Lessor");
                         table4.addCell(rs.getString("lLessor"));
                         table4.completeRow();
                    
                         table4.addCell("Lessee");
                         table4.addCell(rs.getString("lLessee"));
                         table4.completeRow();
                    
                         table4.addCell("Period");
                         table4.addCell(rs.getString("lPeriod"));
                         table4.completeRow();
                    
                         table4.addCell("Survey No");
                         table4.addCell(rs.getString("lSurveyNo"));
                         table4.completeRow();
                    
                         table4.addCell("Reg no");
                         table4.addCell(rs.getString("lRegNo"));
                         table4.completeRow();
                    
                         table4.addCell("Reg Date");
                         table4.addCell(rs.getString("lRegDate"));
                         table4.completeRow();
                    
                    }
                    
                    

                    table4.addCell("Land survey No.");
                    table4.addCell(rs.getString("landSurveyNumber"));
                    table4.completeRow();
                   
                    table4.addCell("Documentation Number");
                    table4.addCell(rs.getString("landDocNo"));
                    table4.completeRow();
                   
                    table4.addCell("Date of registartion");
                    table4.addCell(rs.getString("landRegDate"));
                    table4.completeRow();
                   
                    table4.addCell("Whether registered in the name of society");
                    table4.addCell(rs.getString("valRegSociety"));
                    table4.completeRow();
                   
                    table4.addCell("Represented by the Secretary or Member");
                    table4.addCell(rs.getString("valSecMem"));
                    table4.completeRow();
                   
                    table4.addCell("Whether represenative name is in the list of members of the society");
                    table4.addCell(rs.getString("valSocietyMem"));
                    table4.completeRow();
                   
                    table4.addCell("Whether entire land is in single bit");
                    table4.addCell(rs.getString("valSingleBit"));
                    table4.completeRow();
                   
                    table4.addCell("Whether the sketch plan of land is certified by MRO/Tahasildar");
                    table4.addCell(rs.getString("valLandCert"));
                    table4.completeRow();
                   
                    table4.addCell("Permission for grant of construction of building by the competent authority");
                    table4.addCell(rs.getString("grantPermission"));
                    table4.completeRow();
                   
                    table4.addCell("Building map approved by competent authority");
                    table4.addCell(rs.getString("mapApproval"));
                    table4.completeRow();
                   
                    table4.addCell("Total built up area shown in the map(Carpet area+corridors+stair case etc");
                    table4.addCell(rs.getString("mapArea"));
                    table4.completeRow();
                   
                    table4.addCell("Whether play ground is available in/around the college");
                    table4.addCell(rs.getString("valPlayGround"));
                    table4.completeRow();
                   
                    table4.addCell("Is parking area available");
                    table4.addCell(rs.getString("valParkingArea"));
                    table4.completeRow();
                   
                    table4.addCell("Safe drinking water facility available");
                    table4.addCell(rs.getString("valDrinkingWater"));
                    table4.completeRow();
                   
                    table4.addCell("Whether fire safety measures taken");
                    table4.addCell(rs.getString("valFireSafety"));
                    table4.completeRow();
                   
                    table4.addCell("Whether sanitary certificate taken");
                    table4.addCell(rs.getString("valSanitaryCert"));
                    table4.completeRow();
                   
                    document.add(table4);

                    table4.completeRow();

                    document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Particulars of land and building\n",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                    document.add(Chunk.NEWLINE);

                    table4 = new PdfPTable(2);
                    
                   
                    table4.addCell("Total land in acres");
                    table4.addCell(rs.getString("totalLand"));
                    table4.completeRow();
                   
                    table4.addCell("Building plinth area In Sq.ft");
                    table4.addCell(rs.getString("bPlinthArea"));
                    table4.completeRow();
                   
                    table4.addCell("Principal room area In Sq.ft");
                    table4.addCell(rs.getString("priRoomArea"));
                    table4.completeRow();
                   
                    table4.addCell("office room area In Sq.ft");
                    table4.addCell(rs.getString("offRoomArea"));
                    table4.completeRow();
                   
                    table4.addCell("Staff room area In Sq.ft");
                    table4.addCell(rs.getString("staffRoomArea"));
                    table4.completeRow();
                   
                    table4.addCell("Games room in Sq.ft");
                    table4.addCell(rs.getString("gamesRoomArea"));
                    table4.completeRow();
                   
                    table4.addCell("Ladies waiting area In Sq.ft");
                    table4.addCell(rs.getString("lWaitingRoom"));
                    table4.completeRow();
                   
                    table4.addCell("Toilets area In Sq.ft");
                    table4.addCell(rs.getString("toiletsRoomArea"));
                    table4.completeRow();
                   
                    table4.addCell("Library area In Sq.ft");
                    table4.addCell(rs.getString("libraryArea"));
                    table4.completeRow();
                   
                    table4.addCell("No.of class rooms");
                    table4.addCell(rs.getString("noClassRooms"));
                    table4.completeRow();
                   
                    table4.addCell("Size of each class room area In Sq.ft");
                    table4.addCell(rs.getString("classSize"));
                    table4.completeRow();
                   
                    table4.addCell("No of lab rooms ");
                    table4.addCell(rs.getString("noLabRooms"));
                    table4.completeRow();

                    table4.addCell("Size of each lab room area In Sq.ft");
                    table4.addCell(rs.getString("labSize"));
                    table4.completeRow();
                   
                    document.add(table4);
                    table4.completeRow();

                                       
                    document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Library Details\n",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                    document.add(Chunk.NEWLINE);

                    table4 = new PdfPTable(2);
                    
                   

                    table4.addCell("Name of the Librarian");
                    table4.addCell(rs.getString("nLibrarian"));
                    table4.completeRow();
                   
                    table4.addCell("No.of books");
                    table4.addCell(rs.getString("noBooks"));
                    table4.completeRow();
                   
                    table4.addCell("No.of journals");
                    table4.addCell(rs.getString("noJournels"));
                    table4.completeRow();
                   
                    table4.addCell("No.of periodicals");
                    table4.addCell(rs.getString("noPeriodicals"));
                    table4.completeRow();
                   

                    document.add(table4);
                    table4.completeRow();
                    document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Faculty Details\n",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                    document.add(Chunk.NEWLINE);


                    table4 = new PdfPTable(2);


                    table4.addCell("No.of Teaching staff");
                    table4.addCell(rs.getString("noTeachingStaff"));
                    table4.completeRow();
                   
                    table4.addCell("No.of non-teaching staff");
                    table4.addCell(rs.getString("noNonteachingStaff"));
                    table4.completeRow();
                   

                    document.add(table4);
                    table4.completeRow();

                    // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                    document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Corpus Fund Details",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                    document.add(Chunk.NEWLINE);

                    table4 = new PdfPTable(2);
                    table4.addCell("FDR/BG number");
                    table4.addCell(rs.getString("CFDNo"));
                    table4.completeRow();
                   
                    table4.addCell("Date");
                    table4.addCell(rs.getString("CFDDate"));
                    table4.completeRow();
                   
                    table4.addCell("Amount");
                    table4.addCell(rs.getString("CFDAmount"));
                    table4.completeRow();
                   
                    table4.addCell("Name of the issuing bank");
                    table4.addCell(rs.getString("CFDIssuingBank"));
                    table4.completeRow();
                   
                    table4.addCell("Date of maturity");
                    table4.addCell(rs.getString("CFDMaturityDate"));
                    table4.completeRow();
                   
                    table4.addCell("Date of renewal");
                    table4.addCell(rs.getString("CFDRenewalDate"));
                    table4.completeRow();

                    
                    document.add(table4);
                    table4.completeRow();
                    
                    // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                    document.setPageSize(PageSize.A4.rotate());
                    
                    document.setMargins(-1, -1, 100, -1);
                    document.setMarginMirroring(true);
                    
                    document.newPage();
                     document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Existing Courses during the last academic year "+previousYear+"-"+currentYear,FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                    rs = st.executeQuery("SELECT * FROM cdc.courses where cCode="+cCode+" and cStatus='Previously Existing Course';");
                   
                    
                    headers = new String[] {"Type", "Course", "Combination/Course", "Medium","Intake Sanctioned", "Admitted Strength"};
                    table = new PdfPTable(headers.length);
                                for (int i = 0; i < headers.length; i++) {
                                    String header = headers[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 10, Font.BOLD)));
                                    table.addCell(cell);
                                }
				float wid2[]={12f,10f,45f,8f,5f,5f};
                                	table.setWidths(wid2);

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
                       
                    }
			table.setWidthPercentage(95);
                    document.add(table);
                    
                     document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Requested Courses for the academic year"+currentYear+"-"+nextYear,FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);

                    rs = st.executeQuery("SELECT * FROM cdc.courses where cCode="+cCode+" and cStatus!='Previously Existing Course';");
                   
                    
                    headers = new String[] {"Type", "Course", "Combination/Course", "Medium","Intake","Status"};
                    table = new PdfPTable(headers.length);
                                for (int i = 0; i < headers.length; i++) {
                                    String header = headers[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 10, Font.BOLD)));
                                    table.addCell(cell);
                                }
				float wid3[]={12f,15f,45f,8f,7f,24f};
                                	table.setWidths(wid3);

                                table.completeRow();
                    while (rs.next()){
                        String st1=rs.getString("ctype");
                    String st2=rs.getString("cCourse");
                    String st3=rs.getString("cCombination");
                    String st4=rs.getString("cMedium");
                    String st5=String.valueOf(rs.getInt("cIntakeSanctioned"));
                    
                    String st7=String.valueOf(rs.getString("cStatus"));
                    table.addCell(st1);
                    table.addCell(st2);
                    table.addCell(st3);
                    table.addCell(st4);
                    table.addCell(st5);
                    
                    table.addCell(st7);
                    table.completeRow();
                       
                    }
			table.setWidthPercentage(95);
                    document.add(table);
                    document.setPageSize(PageSize.A4.rotate());
			
                    document.setMargins(-1, -1, 100, -1);
                    document.setMarginMirroring(true);
                    document.newPage();
                    
                    // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                   document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Principal Details",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);

                    rs = st.executeQuery("SELECT * FROM cdc.faculty where cCode="+cCode+" and tType='Principal';");
                    
                     headers2 = new String[] {"Name", "Designation", "Qualifications", "Date of appointment","Nature of appointment", "Mode of appointment","Salary per month","Mode of payment","Bank account Number","PAN card Number","Aadhar  number","Mobile Number"};
                    table2 = new PdfPTable(headers2.length);
                                for (int i = 0; i < headers2.length; i++) {
                                    String header = headers2[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 8, Font.BOLD)));
                                    table2.addCell(cell);
                                }
				float wid[]={24f,18f,18f,11f,10f,11f,10f,6f,15f,10f,13f,10f};
                                	table2.setWidths(wid);
                                table2.completeRow();
                    while (rs.next()){
                        String st1=rs.getString("tName");
                    
                    String st3=rs.getString("tdesignation");
                    String st4=rs.getString("tQualification");
                    String st5=rs.getString("tDate");
                    String st6=rs.getString("tNature");
                    String st7=rs.getString("tModeApp");
                    String st8=rs.getString("tScale");
                    String st9=rs.getString("tModePay");
                    String st10=rs.getString("tBank");
                    String st11=rs.getString("tPan");
                    String st12=rs.getString("tAadhar");
                    String st13=rs.getString("tMobile");
                    
                        table2.addCell(new Phrase(st1, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st3, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st4, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st5, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st6, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st7, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st8, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st9, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st10, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st11, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st12, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st13, FontFactory.getFont(FontFactory.HELVETICA, 8)));               
                    /*table2.addCell(st1);
                    
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
                    table2.addCell(st13);*/
                    table2.completeRow();
                   
                    }
                    table2.setWidthPercentage(95);
                    document.add(table2);
                    

                    document.add(Chunk.NEWLINE);

                     p = new Paragraph(new Phrase(lineSpacing,"\n\n\nTeaching Faculty",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);

                    rs = st.executeQuery("SELECT * FROM cdc.faculty where cCode="+cCode+" and tType='Teaching';");
                    
                    // headers2 = new String[] {"Name", "Designations", "Qualification", "Date of appointment","Nature of appointment", "Mode of appointment","Salary per month","Mode of payment","Bank account Number","PAN card Number","Aadhar number","Mobile Number"};
                    table2 = new PdfPTable(headers2.length);
                                for (int i = 0; i < headers2.length; i++) {
                                    String header = headers2[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 8, Font.BOLD)));
                                    table2.addCell(cell);
                                }
				// wid={24f,18f,18f,11f,10f,11f,10f,6f,15f,10f,13f,10f};
                                	table2.setWidths(wid);

                                table2.completeRow();
                    while (rs.next()){
                        String st1=rs.getString("tName");
                    
                    String st3=rs.getString("tdesignation");
                    String st4=rs.getString("tQualification");
                    String st5=rs.getString("tDate");
                    String st6=rs.getString("tNature");
                    String st7=rs.getString("tModeApp");
                    String st8=rs.getString("tScale");
                    String st9=rs.getString("tModePay");
                    String st10=rs.getString("tBank");
                    String st11=rs.getString("tPan");
                    String st12=rs.getString("tAadhar");
                    String st13=rs.getString("tMobile");
                    
			table2.addCell(new Phrase(st1, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st3, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st4, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st5, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st6, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st7, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st8, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st9, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st10, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st11, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st12, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st13, FontFactory.getFont(FontFactory.HELVETICA, 8)));               

                  /*  table2.addCell(st1);
                    
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
                    table2.addCell(st13);*/
                    table2.completeRow(); 
                   
                    }
		    table2.setWidthPercentage(95);
                    document.add(table2);

                     document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Non-Teaching Staff",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                    rs = st.executeQuery("SELECT * FROM cdc.faculty where cCode="+cCode+" and tType='Non-Teaching';");
                    
                    // headers2 = new String[] {"Name", "Designation", "Qualification", "Date of appointment","Nature of appointment", "Mode of appointment","Scale of pay","Mode of pay","Bank account Number","PAN card Number","Aadhar number","Mobile Number"};
                    table2 = new PdfPTable(headers2.length);
                                for (int i = 0; i < headers2.length; i++) {
                                    String header = headers2[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 8, Font.BOLD)));
                                    table2.addCell(cell);
                                }
				//wid={24f,18f,18f,11f,10f,11f,10f,6f,15f,10f,13f,10f};
                                	table2.setWidths(wid);

                                table2.completeRow();
                    while (rs.next()){
                        String st1=rs.getString("tName");
                    
                    String st3=rs.getString("tdesignation");
                    String st4=rs.getString("tQualification");
                    String st5=rs.getString("tDate");
                    String st6=rs.getString("tnature");
                    String st7=rs.getString("tModeApp");
                    String st8=rs.getString("tScale");
                    String st9=rs.getString("tModePay");
                    String st10=rs.getString("tBank");
                    String st11=rs.getString("tPan");
                    String st12=rs.getString("tAadhar");
                    String st13=rs.getString("tMobile");
                    

			table2.addCell(new Phrase(st1, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st3, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st4, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st5, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st6, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st7, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st8, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st9, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st10, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st11, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st12, FontFactory.getFont(FontFactory.HELVETICA, 8)));
			table2.addCell(new Phrase(st13, FontFactory.getFont(FontFactory.HELVETICA, 8)));               



                   /* table2.addCell(st1);
                    
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
                    table2.addCell(st13);*/

                    table2.completeRow();
                   
                    }
		    table2.setWidthPercentage(95);
                    document.add(table2);

                    }
                   document.setPageSize(PageSize.A4);
                    document.newPage();
                     document.add(Chunk.NEWLINE);
                    document.setMargins(2, 2, 2, 2);
                       document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Declaration",FontFactory.getFont(FontFactory.COURIER_BOLD, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     String declaration="\n\n\t\t\t\t\t\t I,_____________________________________________________________,"
                                        + "\n\n\t\t\t\t\t\tSecretary/Correspondent of ______________________________________"
                                        + "\n\n\t\t\t\t\t\t____________________________________ College do hereby declare that "
                                        + "\n\n\t\t\t\t\t\tthe particulars furnished above are true and correct to the best "
                                        + "\n\n\t\t\t\t\t\tof my knowledge and belief. ";
                       p = new Paragraph(new Phrase(lineSpacing,declaration,FontFactory.getFont(FontFactory.COURIER, 12f)));
                    // p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     


                          document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                    p = new Paragraph(new Phrase(lineSpacing,"SECRETARY/CORRESPONDENT\t\t\t",FontFactory.getFont(FontFactory.COURIER_BOLD, 12f)));
                    p.setAlignment(Paragraph.ALIGN_RIGHT);
                    p.setIndentationRight(50);
                    document.add(p);
                    
                    document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                    
                     

                      document.add(Chunk.NEWLINE);
                      document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Certification by the University nominee on the Governing Body.",FontFactory.getFont(FontFactory.COURIER_BOLD, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                   
                     document.add(Chunk.NEWLINE);
                     declaration="\n\n\n\t\t\t\t\t\t I hereby forward the application of the college with the certification"
                                  + "\n\n\t\t\t\t\t\t that I have visited the college and the information furnished above is"
                                  + "\n\n\t\t\t\t\t\t true and correct to the best of my knowledge and belief.";
                                        
                       p = new Paragraph(new Phrase(lineSpacing,declaration,FontFactory.getFont(FontFactory.COURIER, 12f)));
                    // p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     


                          document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);

                  


                      document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                    p = new Paragraph(new Phrase(lineSpacing,"SIGNATURE OF THE \t\t\t\t\t\t\t\t\t \nUNIVERSITY NOMINEE ON THE \t\t\t\t\t\t\t\t\nGOVERNING BODY OF THE COLLEGE",FontFactory.getFont(FontFactory.COURIER_BOLD, 12f)));
                    p.setAlignment(Paragraph.ALIGN_RIGHT);
                    p.setIndentationRight(50);
                    document.add(p);

                    
                    document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                   
                      


                    document.close();
                    System.out.println(f);
                    response.sendRedirect("download.jsp?ff="+f);
                   
                    



                    break;
                    case "Transactions":

                           
                       cCode=(String)session.getAttribute("cCode");
            
            
             
                    ps=con.prepareStatement("select * from payments where cCode='"+cCode+"'");
                    rs=ps.executeQuery();
                    %>
                    <table border="1">
                        <tr>
                            <td>Merchant order No.</td>
                            <td>Fee of</td>
                            <td>Reference ID</td>
                            <td>Status</td>
                            <td>Amount</td>
                            <td>Paymode</td>
                            <td>Bank Code</td>
                            <td>Bank Reference No</td>
                            <td>Transaction Date</td>
                            <td>CIN</td>
                            <td>Download</td>
                           
                        </tr>
                        
                        <%
                            String feeFor="";
                     while(rs.next())
                      {
                          
                            if(rs.getString("merchantOrderNo").charAt(0)=='1'){
                                feeFor="Inspection";
                            }else if(rs.getString("merchantOrderNo").charAt(0)=='2'){
                                feeFor="Affiliation";
                            }
                            else if(rs.getString("merchantOrderNo").charAt(0)=='3'){
                                feeFor="AcademicAudit";
                            }
                    %>
                            
                        <tr>
                              <td><%=rs.getString("merchantOrderNo") %></td>
                              <td><%=feeFor %></td>
                              <td><%=rs.getString("SBIePayReferenceID") %></td>
                              <td><%=rs.getString("status") %></td>
                              <td><%=rs.getString("amount") %></td>
                              <td><%=rs.getString("payMode") %></td>
                              <td><%=rs.getString("bankCode") %></td>
                              <td><%=rs.getString("bankReferenceNumber") %></td>
                              <td><%=rs.getString("transactionDate") %></td>
                              <td><%=rs.getString("CIN") %></td>
                              <td><a href="receipts.jsp?merchantOrderNo=<%=rs.getString("merchantOrderNo") %>&&feeFor=<%=feeFor%>&&SBIePayReferenceID=<%=rs.getString("SBIePayReferenceID") %>&&status=<%=rs.getString("status") %>&&amount=<%=rs.getString("amount") %>&&payMode=<%=rs.getString("payMode") %>&&bankCode=<%=rs.getString("bankCode") %>&&bankReferenceNumber=<%=rs.getString("bankReferenceNumber") %>&&transactionDate=<%=rs.getString("transactionDate") %>&&CIN=<%=rs.getString("CIN") %>" style="text-decoration: none;">Download</a></td>
                              
                        </tr>
                   
                    <% } %>
                    </table>
                    <%
                    
                    break;
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