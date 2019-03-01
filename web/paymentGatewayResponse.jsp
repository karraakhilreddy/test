<%-- 
    Document   : paymentGatewayResponse
    Created on : Jan 4, 2019, 10:21:37 AM
    Author     : akhil
--%>
<%@page import="com.lowagie.text.Image"%>
<%@page import="com.lowagie.text.Phrase"%>
<%@page import="com.lowagie.text.FontFactory"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.Chunk"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.lowagie.text.PageSize"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.File"%>
<%@page import="cdc.logs"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.toml.dp.util.AES128Bit"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
</head>
<body >
   <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3><spam>Warangal-506009,Telangana</spam></h3><h3><b>Ph: 9440163189. drchr18@yahoo.com</b></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>welcome to college development council</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
             <ul>
                <button class="" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="active" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
    <div>
        <div class="main">    
            <center>
                <div class="mainBackground">
                    <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'inspectionCalculation.jsp'">INSPECTION DETAILS</button></td>
                                 <td><button onclick="location.href = 'affiliationCalculation.jsp'">AFFILIATION</button></td>
                                 <td><button onclick="location.href = 'Reports/reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
                   <%
                    String cCode=(String)session.getAttribute("cCode");
                    String encData=(String)request.getParameter("encData");
                    //"7OuNG4OlchGQjNFa6cbaTH6jz4rKiRqweXSiTK0gBwBcByVP0Is222w+xPJXrnbkY/p5WA2TFPR7wl9K60cobi/7iqtma/gf42Okz3eiClxO29uMaMPMq8llV50drYvY4+I2LG6CdUkdMh/6T+NipOVH3as172QI6n8IjUSF/DiAuO/mh35uOy++dxu1HHa11/DNK95tdIKIf6MyW0zrWzgQAI54GVlqjlpZCxWSOeiK8EZsRDtw/JBgxIZE3r5qxW0UhEsXig8oMhnp9PEOhToNjSmZWLrmMdbnPWVWTPs="; //
                    String    Key1="tvhkwlcVatJsWTBAAe9Ou9xS91EGFLcFuTZ/W4I3jH4=";//key from panel
                    String    Key2="Fbi1P7Nc7R1Yd7mgVB7EYQ=="; // key from pdf
                    
            
                    String   Key = AES128Bit.decrypt(Key1, Key2);
                    System.out.print(encData);
                    System.out.print("<br>");
                    String   EncryptTrans = AES128Bit.decrypt(encData, Key);
                    String[] data=EncryptTrans.split(Pattern.quote("|"));
                    String feeFor="";
                    if(data[0].charAt(0)=='1'){
                        feeFor="Inspection";
                    }else if(data[0].charAt(0)=='2'){
                        feeFor="Affiliation";
                    }
                    else if(data[0].charAt(0)=='3'){
                        feeFor="AcademicAudit";
                    }
                    
                    // failure --- "7OuNG4OlchGQjNFa6cbaTH6jz4rKiRqweXSiTK0gBwBcByVP0Is222w+xPJXrnbkY/p5WA2TFPR7wl9K60cobi/7iqtma/gf42Okz3eiClxO29uMaMPMq8llV50drYvY4+I2LG6CdUkdMh/6T+NipOVH3as172QI6n8IjUSF/DiAuO/mh35uOy++dxu1HHa11/DNK95tdIKIf6MyW0zrWzgQAI54GVlqjlpZCxWSOeiK8EZsRDtw/JBgxIZE3r5qxW0UhEsXig8oMhnp9PEOhToNjSmZWLrmMdbnPWVWTPs=";
                    //Success --- "/zQHrDnqffLmwtK6AesyPFlW1k0GXys9dOK+Z02En5CITXfA5I37Hm4E621s6Lpcn98x7yGig1DRgOeCP6JasXzx/psmARuu8HBd6E8yFUZZdsmaFlvABiQW3KS0ZvRuZshsG0e5YcAT2JqU/UqnAQ0dcshT87kMU0+kDIJVnZDe9Z82WkBwEGSMVjGQaJVRfyG2rLWJPMABWiV0CUZtb2YuNamjDQwk6yqI+QykGDQ= 567KKU707 "
                    String ipAddress = request.getHeader("X-FORWARDED-FOR");  
                    if (ipAddress == null) {  
                          ipAddress = request.getRemoteAddr();  
                    }
                    Connection con=Database.getConnection();
                    PreparedStatement ps=null;                   
                    /*for(int i=0;i<15;i++){
                      out.println(i+"."+data[i]);
                       out.print("<br>");
                    }*/
                  
                     
                     
                     
                    String startDate=data[10];
                    
                    java.sql.Timestamp date =  Timestamp.valueOf(startDate);
                    //SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    java.util.Date dt = new java.util.Date();

                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");

                    String currentYear = sdf.format(dt);
                    int nextYear=Integer.parseInt(currentYear)+1;
                    int previousYear=Integer.parseInt(currentYear)-1;
                     
                                        Statement st = null;
                                        ResultSet rs = null;

                                        con = Database.getConnection();
                                        st = con.createStatement();
                                        
                                        File tempFile = File.createTempFile(cCode+"report", ".pdf");
                                        Document document = new Document(PageSize.A4);
                                        
            
                                        String f=tempFile.getAbsolutePath();//"D://table.pdf";
                                        
                                        
                                         PdfWriter.getInstance(document, new FileOutputStream(tempFile));
                                         document.open();
                                         
                                         PdfPTable table = new PdfPTable(2);
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
                    p = new Paragraph(new Phrase(lineSpacing,"Fee Receipt of Extension of Affiliation \n\n for the academic year "+currentYear+"-"+nextYear,FontFactory.getFont(FontFactory.COURIER_BOLD, 15f)));
                    
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                                            table.addCell("College Code");
                                            table.addCell(cCode);
                                            table.completeRow();
                                         
                                            table.addCell("Fee of");
                                            table.addCell(feeFor);
                                            table.completeRow();
                                            
                                            table.addCell("Merchant Order No");
                                            table.addCell(data[0]);
                                            table.completeRow();
                                            
                                            table.addCell("SBIePay Reference ID");
                                            table.addCell(data[1]);
                                            table.completeRow();
                                            
                                            table.addCell("Status");
                                            table.addCell(data[2]);
                                            table.completeRow();
                                            
                                            table.addCell("Amount");
                                            table.addCell(data[3]);
                                            table.completeRow();
                                            
                                            table.addCell("Paymode");
                                            table.addCell(data[4]);
                                            table.completeRow();
                                            
                                            table.addCell("Reason");
                                            table.addCell(data[7]);
                                            table.completeRow();
                                            
                                            table.addCell("BankCode");
                                            table.addCell(data[8]);
                                            table.completeRow();
                                            
                                            table.addCell("BankReferenceNumber");
                                            table.addCell(data[9]);
                                            table.completeRow();
                                            
                                            table.addCell("TransactionDate");
                                            table.addCell(data[10]);
                                            table.completeRow();
                                            
                                            table.addCell("CIN");
                                            table.addCell(data[12]);
                                            table.completeRow();
                                            
                                            document.add(table);
                                            document.close();
                                            
                                            %>
                                            
                                            
                                            <table border="2">
                                                <tr>
                                                    <td>College Code</td>
                                                    <td><%= cCode%></td>
                                                </tr>
                                                <tr>
                                                    <td>Fee of</td>
                                                    <td><%= feeFor %></td>
                                                </tr>
                                                <tr>
                                                    <td>Merchant order No</td>
                                                    <td><%= data[0]%></td>
                                                </tr>
                                                <tr>
                                                    <td>Reference ID</td>
                                                    <td><%= data[1] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Status</td>
                                                    <td><%=data[2] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Amount</td>
                                                    <td><%=data[3] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Paymode</td>
                                                    <td><%= data[4]%></td>
                                                </tr>
                                                <tr>
                                                    <td>Reason</td>
                                                    <td><%=data[7] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Bank Code</td>
                                                    <td><%=data[8] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Bank Reference No</td>
                                                    <td><%=data[9] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Transaction Date</td>
                                                    <td><%=data[10] %></td>
                                                </tr>
                                                <tr>
                                                    <td>CIN</td>
                                                    <td><%=data[12] %></td>
                                                </tr>
                                                
                                            </table>
                                            
                                                    <lable >Download Receipt</lable> <a href="Reports/download.jsp?ff=<%=f%>">Download Receipt</a>
                                                        
                                            <%
                    char place=data[0].charAt(0);
                    
                     String insertTableSQL = "INSERT INTO `cdc`.`payments`(`cCode`,`merchantOrderNo`,`SBIePayReferenceID`,`status`,`amount`,`currency`,`payMode`,`otherDetails`,`reason`,`bankCode`,`bankReferenceNumber`,`transactionDate`,`country`,`cin`)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
                                                         ps=con.prepareStatement(insertTableSQL);

                                                                      ps.setString(1, cCode);
                                                                      ps.setString(2, data[0]);
                                                                      ps.setString(3, data[1]);
                                                                      ps.setString(4, data[2]);
                                                                      ps.setString(5, data[3]);
                                                                      ps.setString(6, data[4]);
                                                                      ps.setString(7, data[5]);
                                                                      ps.setString(8, data[6]);
                                                                      ps.setString(9, data[7]);
                                                                      ps.setString(10, data[8]);
                                                                      ps.setString(11, data[9]);
                                                                      ps.setTimestamp(12, date);
                                                                      ps.setString(13, data[11]);
                                                                      ps.setString(14, data[12]);





                                                                      // execute insert SQL stetement
                                                                      ps.executeUpdate();
                                                                      logs l=new logs();


                                                                l.updateLog(cCode, "Made "+feeFor+" Payment", "Made Payment of Rs."+data[3],ipAddress);

                                                                      //out.println("Record is inserted into PAYMENT table!");
                    
                    switch(place){
                        case '1':
                                        try {

                                                        



                                                         insertTableSQL = "UPDATE `cdc`.`courses` SET `cStatus` ='Inspection fee Paid' WHERE ( `cCode`=? and `cStatus` ='Inspection fee Pending' );";
                                                         ps=con.prepareStatement(insertTableSQL);
                                                         
                                                         
                                                         

                                                          ps.setString(1, cCode);
                                                          ps.executeUpdate();
                                                                      
                                                         insertTableSQL = "UPDATE `cdc_college_details` SET `iAmount` ='"+data[3]+"', `iDate`='"+date+"',`iOrderNo`='"+data[0]+"' WHERE `cCode` =?;";
                                                         ps=con.prepareStatement(insertTableSQL);
                                                         ps.setString(1, cCode);
                                                          ps.executeUpdate();
                                                          
                                                                      l.updateLog(cCode, "Updated courses status to fee paid", "Made Payment of Rs."+data[3],ipAddress);

                                                                      //out.println("Record is inserted into LOG table!");

                                                                        
                                                                      
                                         
                                        } catch (Exception e) {

                                                   System.out.println(e.getMessage());
                                                   out.println(e.getMessage());

                                        } finally {

                                                if (ps != null) {
                                                         ps.close();
                                                }

                                                if (con != null) {
                                                         con.close();
                                                }
                                                //response.sendRedirect("facultyDetails.jsp");
                                        }
                                        
                                        
                                            
                                            
                    break;
                        case '2':
                            
                            try{
                             
                                                         insertTableSQL = "UPDATE `cdc`.`courses` SET `cStatus` ='Affiliation fee Paid' WHERE (`cCode` =? and `cStatus`='Inspection Success');";
                                                         ps=con.prepareStatement(insertTableSQL);

                                                                      ps.setString(1, cCode);
                                                                      ps.executeUpdate();
                                                                      
                                                                      
                                                         insertTableSQL = "UPDATE `cdc_college_details` SET `aAmount` ='"+data[3]+"', `aDate`='"+date+"',`aOrderNo`='"+data[0]+"' WHERE `cCode` =?;";
                                                         ps=con.prepareStatement(insertTableSQL);
                                                         ps.setString(1, cCode);
                                                          ps.executeUpdate();
                                                          
                                                                      l.updateLog(cCode, "Updated courses status to fee paid", "Made Payment of Rs."+data[3],ipAddress);

                                                                      //out.println("Record is inserted into LOG table!");

                                        } catch (Exception e) {

                                                   System.out.println(e.getMessage());
                                                   out.println(e.getMessage());

                                        } finally {

                                                if (ps != null) {
                                                         ps.close();
                                                }

                                                if (con != null) {
                                                         con.close();
                                                }
                                                //response.sendRedirect("facultyDetails.jsp");
                                        }
                                        
                                        
                        break;
                    }
                    
                   %>   
                    
                </div>
            </center>
        </div>
                   <br><br><br><br><br><br><br>
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