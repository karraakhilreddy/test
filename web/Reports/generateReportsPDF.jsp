<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@ page import="java.io.*"%>
<%@page import="com.lowagie.text.*,com.lowagie.text.pdf.*"%>;
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
                    int cCode=(int)session.getAttribute("cCode");
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
                     cCode=(int)session.getAttribute("cCode");
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
                    
                    
            }
        
        
        
        %>
        
    </div>
        </center></div>
       
              
                  
            
                   
                
        
       
        <footer>
            <p id="copyright"> Copyrights reserved by Kakatiya University&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="developers.jsp">Developers</a></p>
            
            
        </footer>
</body>
</html>