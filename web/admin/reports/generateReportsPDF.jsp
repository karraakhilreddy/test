<%@page import="com.lowagie.text.pdf.draw.VerticalPositionMark"%>
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
    <link rel="stylesheet" type="text/css" href="../../CSS/indexCSS.css">
    
<script>
function goBack() {
  window.history.back();
}
</script>
</head>
<body >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div >
           <div ><img src="../../IMG/1.png" height="150" width="150" align="left" hspace="80" ></div>
            <div ><img src="../../IMG/2.png" height="150" width="200" align="right" hspace="80" ></div>
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
                                 
                                 <td><button onclick="goBack()">Go Back</button></td>
                                 <td><button onclick="location.href = '../logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
                   
        <%
            String button=request.getParameter("button");
            out.print(button);
             String cCode=(String)session.getAttribute("aCcode");
            
             Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            con = Database.getConnection();
            st = con.createStatement();

            
                   File tempFile = File.createTempFile(cCode+"report", ".pdf");
            Document document = new Document(PageSize.A4);
            
                    String f=tempFile.getAbsolutePath();
    
        
            switch(button){
                case "Course" :
                   
                    rs = st.executeQuery("SELECT * FROM cdc.courses where cCode="+cCode+" ORDER BY cStatus ASC;");
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
                    String st7=rs.getString("cStatus");
                    table.addCell(st1);
                    table.addCell(st2);
                    table.addCell(st3);
                    table.addCell(st4);
                    table.addCell(st5);
                    table.addCell(st6);
                    table.addCell(st7);
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
                    
                    rs = st.executeQuery("SELECT * FROM cdc.logs where cCode="+cCode+";");
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
                    case "cLogs" :
                    
                    rs = st.executeQuery("SELECT * FROM cdc.logs;");
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

                    headers4 = new String[] {"College Code", "Time", "IP", "In Page","Action"};
                    table4 = new PdfPTable(headers4.length);
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
                        <a href="excelData.jsp?button=Logs">Download as Excel file</a>
                        </center>
        
                    <%
                    
                   
                    
                    
                    
                    break;
                     case "Basic":
                    
                        
                    java.util.Date dt = new java.util.Date();

            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");

            String currentYear = sdf.format(dt);
            int nextYear=Integer.parseInt(currentYear)+1;
            int previousYear=Integer.parseInt(currentYear)-1;
                    rs = st.executeQuery("SELECT * FROM cdc_college_details where ccode="+cCode+";");
                   

                    
                    PdfWriter.getInstance(document, new FileOutputStream(tempFile));
                    document.open();

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
                    p=new Paragraph(new Phrase(lineSpacing,"\nWarangal - 506009",FontFactory.getFont(FontFactory.COURIER_BOLD, fntSize)));
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                     
                     
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);


                    Image image = Image.getInstance("https://cdc-aa.kakatiya.ac.in/IMG/1.png");
                     image.scaleAbsolute(80f, 80f);
                    image.setAbsolutePosition(85f, 740f);
                    document.add(image);

                     //p=new Paragraph("Inspection Report for the academic year 20 -20  .");
                    p = new Paragraph(new Phrase(lineSpacing,"Inspection Report for the academic year "+currentYear+"-"+nextYear,FontFactory.getFont(FontFactory.COURIER, 10f)));
                    
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                    
                  

                    while (rs.next()){

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
                   
                    if(rs.getString("valOwnBuilding").equals("no")){
                        
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
                         table4.addCell(rs.getString(rs.getString("lRegDate")));
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
                   
                    document.add(table4);
                    document.newPage();
                    
                    table4 =new PdfPTable(2);

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
                    document.setMargins(0, 0, 0, 0);
                    document.newPage();
                     document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Existing Courses during the last academic year "+previousYear+"-"+currentYear,FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                    rs = st.executeQuery("SELECT * FROM cdc.courses where cCode="+cCode+" and cStatus='Previously Existing Course';");
                   
                    
                    headers = new String[] {"Type", "Course", "Combination", "Medium","Intake sanctioned", "Admitted Strength"};
                    table = new PdfPTable(headers.length);
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
                       
                    }
                    document.add(table);
                    
                     document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Requested Courses for the academic year "+currentYear+"-"+nextYear,FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);

                    rs = st.executeQuery("SELECT * FROM cdc.courses where cCode="+cCode+" and cStatus!='Previously Existing Course';");
                   
                    
                    headers = new String[] {"Type", "Course", "Combination", "Medium","Intake sanctioned","Status"};
                    table = new PdfPTable(headers.length);
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
                    
                    String st7=String.valueOf(rs.getString("cStatus"));
                    table.addCell(st1);
                    table.addCell(st2);
                    table.addCell(st3);
                    table.addCell(st4);
                    table.addCell(st5);
                    
                    table.addCell(st7);
                    table.completeRow();
                       
                    }
                    document.add(table);
                    document.setPageSize(PageSize.A4.rotate());
                    document.setMargins(-1, -1, -1, -1);
                    document.newPage();
                    
                    // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                   document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Principal Details",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);

                    rs = st.executeQuery("SELECT * FROM cdc.faculty where cCode="+cCode+" and tType='Principal';");
                    
                     headers2 = new String[] {"Name", "Designations", "Qualification", "Date of appointment","Nature of appointment", "Mode of appointment","Salary per month","Mode of payment","Bank account Number","PAN card Number","Aadhar number","Mobile Number"};
                    table2 = new PdfPTable(headers2.length);
                                for (int i = 0; i < headers2.length; i++) {
                                    String header = headers2[i];
                                    PdfPCell cell = new PdfPCell();
                                    cell.setGrayFill(0.9f);
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 8, Font.BOLD)));
                                    table2.addCell(cell);
                                }
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
                    
                                   
                    table2.addCell(st1);
                    
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
                   
                    }
                    table2.setWidthPercentage(95);
                    document.add(table2);
                    

                    document.add(Chunk.NEWLINE);
                     p = new Paragraph(new Phrase(lineSpacing,"Teaching Faculty",FontFactory.getFont(FontFactory.COURIER, 12f)));
                     p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);

                    rs = st.executeQuery("SELECT * FROM cdc.faculty where cCode="+cCode+" and tType='Teaching';");
                    
                    // headers2 = new String[] {"Name", "Designation", "Qualification", "Date of appointment","Nature of appointment", "Mode of appointment","Scale of pay","Mode of pay","Bank account Number","PAN card Number","Aadhar number","Mobile Number"};
                    table2 = new PdfPTable(headers2.length);
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
                    
                    table2.addCell(st1);
                    
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
                   
                    }
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
                                    cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 10, Font.BOLD)));
                                    table2.addCell(cell);
                                }
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
                    
                    table2.addCell(st1);
                    
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
                   
                    }
                    document.add(table2);

                    }
                   document.setPageSize(PageSize.A4);
                    document.newPage();
                      document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     p=new Paragraph("Opinion of the Inspection Team");
                     document.add(Chunk.NEWLINE);
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                      document.add(Chunk.NEWLINE);
                      
                      
                    table2=new PdfPTable(2);

                   
                    
                    table2.addCell("On");
                    table2.addCell("Satisfactory/Average/Poor/Very Poor");
                    table2.completeRow();

                    table2.addCell("Size of Class-Rooms");
                    table2.addCell("");
                    table2.completeRow();

                    table2.addCell("Condition of the furniture");
                    table2.addCell("");
                    table2.completeRow();

                    table2.addCell("Size of Laboratories");
                    table2.addCell("");
                    table2.completeRow();

                    table2.addCell("Lab.Equipment");
                    table2.addCell("");
                    table2.completeRow();

                    table2.addCell("Language Laboratory & Equipment");
                    table2.addCell("");
                    table2.completeRow();

                    table2.addCell("Maintanance of the Library");
                    table2.addCell("");
                    table2.completeRow();

                    document.add(table2);

                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     p=new Paragraph("Overall Remarks of the Insepection Team");
                     document.add(Chunk.NEWLINE);
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                      document.add(Chunk.NEWLINE);
                      float[] widths = {0.1f, 0.9f};
                    table2=new PdfPTable(widths);

                    table2.addCell("Sl.No");
                    table2.addCell("Remarks");
                    table2.completeRow();

                    for(int i=0;i<10;i++){
                            table2.addCell(" ");
                            table2.addCell(" ");
                            table2.completeRow();
                    }
                    document.add(table2);

                    document.newPage();

                    document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     p=new Paragraph("Authorisation");
                     document.add(Chunk.NEWLINE);
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                      document.add(Chunk.NEWLINE);


                    table2=new PdfPTable(2);

                    table2.addCell("Name and Signature of the \n Secretary/Corresponding with Seal");
                    table2.addCell("Name and Signature of the Inspection Team");
                    table2.completeRow();

                    PdfPCell cell23 = new PdfPCell(new Phrase(" "));
                    cell23.setRowspan(3);
                    table2.addCell(cell23);
                    table2.addCell("1.Signature\t:\n\n  Name\t:\n\n  Designation:\t\n\n");
                    table2.addCell("1.Signature\t:\n\n  Name\t:\n\n  Designation:\t\n\n");
                    table2.addCell("1.Signature\t:\n\n  Name\t:\n\n  Designation:\t\n\n");
                    table2.completeRow();
                    document.add(table2);



                     
                     document.add(Chunk.NEWLINE);
                     p=new Paragraph("For Office Use Only");
                     document.add(Chunk.NEWLINE);
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                     document.add(p);

                    p=new Paragraph("Affilation may be Granted/Extended (or) May ot be Extended");
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    
                    document.add(p);
                    p=new Paragraph("\t\t\t\t\tWith Conditions,If any");
                    p.setIndentationLeft(50);
                                       
                     document.add(p);
                     
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                    
                      p=new Paragraph("Submitted for Approval");
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    
                    document.add(p);

                    document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);
                     document.add(Chunk.NEWLINE);

                     p=new Paragraph("\t\t\t\t\t\t\t\t\tDEAN,CDC,KU\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tREGISTRAR,KU\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVICE-CHANCELLOR,KU");
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    
                    document.add(p);
                    

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

                   
                   
                   



                    document.close();
                    System.out.println(f);
                    response.sendRedirect("download.jsp?ff="+f);
                   
                    



                    break;
                    case "adminCollege" :
                                
                                response.sendRedirect("excelData.jsp?button=adminCollege");
                                
                    break;
                    
                    case "deficiencyReport":
                    
                        dt = new java.util.Date();

            sdf = new java.text.SimpleDateFormat("yyyy");

             currentYear = sdf.format(dt);
             nextYear=Integer.parseInt(currentYear)+1;
             previousYear=Integer.parseInt(currentYear)-1;
                   // rs = st.executeQuery("SELECT * FROM cdc_college_details where ccode="+cCode+";");
                   

                    
                    PdfWriter.getInstance(document, new FileOutputStream(tempFile));
                    document.open();

                    //headers4 = new String[] {"College Code", "Time", "IP", "In Page","Action"};
                    table4 = new PdfPTable(2);
                    
                    //Font fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                     p=new Paragraph("College Development Council");
                    //float fntSize, lineSpacing;
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
                    p=new Paragraph(new Phrase(lineSpacing,"\nWarangal - 506009",FontFactory.getFont(FontFactory.COURIER_BOLD, fntSize)));
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                     p=new Paragraph(new Phrase(lineSpacing,"\nDean, College Development Counciil.",FontFactory.getFont(FontFactory.COURIER_BOLD, fntSize)));
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                     


                    image = Image.getInstance("https://cdc-aa.kakatiya.ac.in/IMG/1.png");
                     image.scaleAbsolute(80f, 80f);
                    image.setAbsolutePosition(85f, 740f);
                    document.add(image);
                    
                    
                     p=new Paragraph("-------------------------------------------------------------------------------------------------------------------------------\n"
                     + "Phones : Office - 08702438998; 08702461443; email: deancdcku@gmail.com\n"
                     + "-------------------------------------------------------------------------------------------------------------------------------");
                     //Phones : Office - 08702438998; 08702461443; email: deancdcku@gmail.com
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                    
                     cCode=(String)session.getAttribute("aCcode");
                    rs = st.executeQuery("SELECT * FROM cdc.defieciencyreports where cCode="+cCode+";");
                    
                    String date="";
                    String number="";
                    String reports="";
                    if(rs.next()){
                    
                        number=rs.getString("reportNo");
                        date=rs.getString("date");
                        reports=rs.getString("report");
                    
                    }
                    rs = st.executeQuery("SELECT cAddress FROM cdc.cdc_college_details where cCode="+cCode+";");
                    
                    String address="";
                    if(rs.next()){
                        
                        address=rs.getString("cAddress");
                    
                    }
                    address=address.replace(",", "\n \t\t\t\t\t\t\t");
                    p=new Paragraph("\t\t\t\t\t\t\tNo : "+number+"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tDate : "+date);
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(p);
                    
                    p=new Paragraph("\t\n\t\t\t\t\t\t\tTo :\n \t\t\t\t\t\t\t"+address);
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(p);
                    
                    
                    p=new Paragraph("\t\t\t\t\t\t\t\t\t\t\t\t\t\tSub : DEFICIENCIES - Deficiencies pointed out by the Affiliiation inspection Committee\n\t\t\t\t\t\t\t\t\t\t\t\t for the academic year "+currentYear+"-"+nextYear+" - Regarding.");
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(p);
                    
                    p=new Paragraph("*****");
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    
                    p=new Paragraph("\t\t\t\t\t\t\tSir/Madam,\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tWith reference to the subject cited, I am to inform you that the following are the\n\t\t\t\t\t\t\tdeficiencies pointed out by the Affiliation Inspection Committee pertaining to your College and\n\t\t\t\t\t\t\tsame were informed to you at the time of Annual-Affiliation-inspections for the academic year\n\t\t\t\t\t\t\t"+currentYear+"-"+nextYear);
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(p);
                    
                    reports=reports.replace("\n", "\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
                    p=new Paragraph("\t\t\t\t\t\t\t\t\t\t\t\t\t\t"+reports);
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(p);
                    
                    p=new Paragraph("\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tTherefore, you are informed to submit Compliance report with relevant supporting \n\t\t\t\t\t\t\tdocuments for the said deficiencies to the undersigned within 15- days from the date of\n\t\t\t\t\t\t\tissue of this letter, failing which affiliation cannot be extended for the next academic \n\t\t\t\t\t\t\tyear "+nextYear+"-"+(nextYear+1));
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(p);
                    
                    p=new Paragraph("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tDEAN");
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(p);
                    
                    p=new Paragraph("\t\t\t\t\t\t\tCopy to :-\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t1) The Srcretary to the Vice-Chansellor, KU\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t2) The Stack File.");
                    p.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(p);
                    
                    
                    document.close();
                    System.out.println(f);
                    response.sendRedirect("download.jsp?ff="+f);
                   
                    

                     
                    break;
                    case "adminCollegeAmount" :
                    
                    rs = st.executeQuery("SELECT ccode,cname,iamount,idate,aamount,adate FROM cdc.cdc_college_details;");
                    %>
        
                          <table width="100%" border="0">
                           
                            </table>
                                    <table width="100%" border="1">
                           
                            </table><br>
                        <center>
                        <TABLE BORDER="10" CELLPADDING="6" CELLSPACING="2" WIDTH="70%">
                            <tr bgcolor="deepskyblue">
                                <td><b>College Code</b></td>
                                <td><b>College Name</b></td>
                                <td><b>Inspection Amount</b></td>
                                <td><b>Date</b></td>
                                <td><b>Affiliation Amount</b></td>
                                <td><b>Date</b></td>
                                
                                

                                </tr>
                    <%

                    
                    PdfWriter.getInstance(document, new FileOutputStream(new File(f)));
                    document.open();

                    headers4 = new String[] {"College Code", "College Name", "Inspection Amount", "Date","Affiliation Amount","Date"};
                    table4 = new PdfPTable(headers4.length);
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
                    String st2=rs.getString("cname");
                    String st3=rs.getString("iamount");
                    String st4=rs.getString("idate");
                    String st5=rs.getString("aamount");
                    String st6=rs.getString("adate");
                    
                    table4.addCell(st1);
                    table4.addCell(st2);
                    table4.addCell(st3);
                    table4.addCell(st4);
                    table4.addCell(st5);
                    table4.addCell(st6);
                    
                    table4.completeRow();
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
                    document.add(table4);
                    document.close();
                    System.out.println(f);
                    %>
                        </TABLE>
                         <a href="download.jsp?ff=<%=f%>">Download the  as PDF</a>
                        <a href="excelData.jsp?button=amount">Download as Excel file</a>
                        </center>
        
                    <%
                    
                   
                    
                    
                    
                    break;
            }
        
        
        
        %>
        
    </div>
        </center></div>
       
              
        <br><br><br><br>   
            
                   
                
        
       
         <div class="footer">
  <div id="button"></div>
<div id="container">
<div id="cont">
<div class="footer_center">
    <div > 
<div class="left">Copyrights reserved by Kakatiya University</div>
<div class="right"><a href="../../developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>