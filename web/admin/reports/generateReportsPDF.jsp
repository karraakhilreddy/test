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
    <link rel="stylesheet" type="text/css" href="../../CSS/indexCSS.css">
</head>
<body style="background: black">
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="../../IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="../../IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h3 style="color:navyblue; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h3>
          <h1 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h4><spam>Warangal-506 009,Telangana</spam></h4><h5><b>Ph: 9440163189. drchr18@yahoo.com</b></h5>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>welcome to college development council</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
             <ul>
                <button class="tablinks" onclick="window.location='../../home.jsp'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='../../login.jsp'"><li>College Login</li></button>
                <button class="active" onclick="window.location='../../admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='../../dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='../../help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
     <div class="main">    
        <center>
    <div class="mainBackground">
        
                   
        <%
            String button=request.getParameter("button");
            out.print(button);
             String cCode=(String)session.getAttribute("cCode");
            
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

                                rs = st.executeQuery("SELECT * FROM cdc_college_details where ccode=567;");



                                PdfWriter.getInstance(document, new FileOutputStream(tempFile));
                                document.open();

                                //headers4 = new String[] {"College Code", "Time", "IP", "In Page","Action"};
                                table4 = new PdfPTable(2);

                                //Font fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                                document.add(Chunk.NEWLINE);
                                document.add(Chunk.NEWLINE);
                                Paragraph p=new Paragraph("College Development Council");
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);
                                p=new Paragraph("KAKATIYA UNIVERSITY\nWarangal-506001");
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);
                                 document.add(Chunk.NEWLINE);

                                Image image = Image.getInstance("http://localhost:8084/test_1_1_1/IMG/1.png");
                                 image.scaleAbsolute(80f, 80f);
                                image.setAbsolutePosition(85f, 740f);
                                document.add(image);

                                 p=new Paragraph("Inspection Report for the academic year 20 -20  .");
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



                                table4.addCell("Address of the College");
                                table4.addCell(rs.getString("cAddress"));
                                table4.completeRow();



                                table4.addCell("Name of the sponsering society");
                                table4.addCell(rs.getString("sName"));
                                table4.completeRow();



                                table4.addCell("Addrress of the sponsering society");
                                table4.addCell(rs.getString("sPostalAddress"));
                                table4.completeRow();



                                table4.addCell("Postal address of the college");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Type of the college");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Society Registration Number");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("year of registration");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Year of establishment of college");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Name of the Secretary/Corresponndent");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Mobile no.of Secratary");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Name of the Principal");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Mobile no.of Principal");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Experience as Principal(in Years)");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Whether the college building is owned by the society");
                                table4.addCell("");
                                table4.completeRow();

                                if(rs.getString("valOwnBuilding").equals("no")){

                                     table4.addCell("Lessor");
                                     table4.addCell("");
                                     table4.completeRow();

                                     table4.addCell("Lessee");
                                     table4.addCell("");
                                     table4.completeRow();

                                     table4.addCell("Period");
                                     table4.addCell("");
                                     table4.completeRow();

                                     table4.addCell("Survey No");
                                     table4.addCell("");
                                     table4.completeRow();

                                     table4.addCell("Reg no");
                                     table4.addCell("");
                                     table4.completeRow();

                                     table4.addCell("Reg Date");
                                     table4.addCell("");
                                     table4.completeRow();

                                }



                                table4.addCell("Land survey No.");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Documentation Number");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Date of registartion");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Whether registered in the name of society");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Represented by the Secretary or Member");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Whether represenative name is in the list of members of the society");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Whether entire land is in single bit");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Whether the sketch plan of land is certified by MRO/Tahasildar");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Permission for grant of construction of building by the competent authority");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Building map approved by competent authority");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Total built up area shown in the map(Carpet area+corridors+stair case etc");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Whether play ground is available in/around the college");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Is parking area available");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Safe drinking water facility available");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Whether fire safety measures taken");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Whether sanitary certificate taken");
                                table4.addCell("");
                                table4.completeRow();

                                document.add(table4);

                                table4.completeRow();

                                // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                                document.add(Chunk.NEWLINE);
                                 p=new Paragraph("Particulars of land and building");
                                 document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);

                                table4 = new PdfPTable(2);


                                table4.addCell("Total land in acres");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Building plinth area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Principal room area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("office room area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Staff room area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Games room in Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Ladies waiting area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Toilets area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Library area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("No.of class rooms");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Size of each room area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("No of lab rooms ");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Size of each room area In Sq.ft");
                                table4.addCell("");
                                table4.completeRow();

                                document.add(table4);
                                table4.completeRow();

                                // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                                document.add(Chunk.NEWLINE);
                                 p=new Paragraph("Library Details");
                                 document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);

                                table4 = new PdfPTable(2);



                                table4.addCell("Name of the Librarian");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("No.of books");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("No.of journals");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("No.of periodicals");
                                table4.addCell("");
                                table4.completeRow();


                                document.add(table4);
                                table4.completeRow();
                                // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                                document.add(Chunk.NEWLINE);
                                 p=new Paragraph("Faculty Details");
                                 document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);


                                table4 = new PdfPTable(2);


                                table4.addCell("No.of Teaching staff");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("No.of non-teaching staff");
                                table4.addCell("");
                                table4.completeRow();


                                document.add(table4);
                                table4.completeRow();

                                // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                                document.add(Chunk.NEWLINE);
                                 p=new Paragraph("Corpus fund Details");
                                 document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);

                                table4 = new PdfPTable(2);
                                table4.addCell("FDR/BG number");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Date");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Amount");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Name of the issuing bank");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Date of maturity");
                                table4.addCell("");
                                table4.completeRow();

                                table4.addCell("Date of renewal");
                                table4.addCell("");
                                table4.completeRow();


                                document.add(table4);
                                table4.completeRow();

                                // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);

                                 p=new Paragraph("Course Details");
                                document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(Chunk.NEWLINE);
                                document.add(p);

                                rs = st.executeQuery("SELECT * FROM cdc.courses where cCode=567;");


                                headers = new String[] {"Type", "Course", "Combination", "Medium","Intake", "Admitted"};
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

                                // fn=Font(FontFamily.,50.0f,Font.UNDERLINE);
                                document.add(Chunk.NEWLINE);
                                 p=new Paragraph("Faculty Details-Teaching");
                                 document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);

                                rs = st.executeQuery("SELECT * FROM cdc.faculty where cCode=567 and tType!='Non-Teaching';");

                                 headers2 = new String[] {"Name","Type", "Designation", "Qualification", "Date of appointment","Nature of appointment", "Mode of appointment","Scale of pay","Mode of pay","Bank account Number","PAN card Number","Aadhar number","Mobile Number"};
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

                                }
                                document.add(table2);

                                 document.add(Chunk.NEWLINE);
                                 document.add(Chunk.NEWLINE);
                                 p=new Paragraph("Faculty Details-Non Teaching");
                                 document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);
                                  document.add(Chunk.NEWLINE);
                                rs = st.executeQuery("SELECT * FROM cdc.faculty where cCode=567 and tType='Non-Teaching';");

                                 headers2 = new String[] {"Name","Type", "Designation", "Qualification", "Date of appointment","Nature of appointment", "Mode of appointment","Scale of pay","Mode of pay","Bank account Number","PAN card Number","Aadhar number","Mobile Number"};
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

                                }
                                document.add(table2);

                                }

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
                                 p=new Paragraph("Overall Remorks of the Insepection Team");
                                 document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                document.add(p);
                                  document.add(Chunk.NEWLINE);

                                table2=new PdfPTable(2);

                                table2.addCell("Sl.No");
                                table2.addCell("Remarks");
                                table2.completeRow();

                                for(int i=0;i<10;i++){
                                        table2.addCell(" ");
                                        table2.addCell(" ");
                                        table2.completeRow();
                                }
                                document.add(table2);


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
                                 document.add(Chunk.NEWLINE);
                                 p=new Paragraph("For Office Use Only");
                                 document.add(Chunk.NEWLINE);
                                p.setAlignment(Paragraph.ALIGN_CENTER);
                                 document.add(p);

                                p=new Paragraph("Affilation may be Granted/Extended (or) May ot be Extended");
                                p.setAlignment(Paragraph.ALIGN_CENTER);

                                document.add(p);
                                p=new Paragraph("With Conditions,If any");

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

                                p=new Paragraph("Name, Signature & Seal of the Secretary\\\nCorrespondent of the Society");
                                p.setAlignment(Paragraph.ALIGN_LEFT);
                                 document.add(p);


                                  document.add(Chunk.NEWLINE);
                                 document.add(Chunk.NEWLINE);
                                 document.add(Chunk.NEWLINE);
                                 document.add(Chunk.NEWLINE);

                                 p=new Paragraph("Name & Signature of the members of the Inspection Team\n1.\n2.\n3.");
                                p.setAlignment(Paragraph.ALIGN_LEFT);
                                document.add(p);





                                document.close();
                                System.out.println(f);
                                response.sendRedirect("download.jsp?ff="+f);
                               
                                break;
                                case "adminCollege" :
                                
                                
                                %><a href="excelData.jsp?button=Faculty">Download as Excel file</a><%
                                
                                
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