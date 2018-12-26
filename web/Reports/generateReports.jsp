<%-- 
    Document   : generateReports
    Created on : Dec 22, 2018, 10:36:07 AM
    Author     : akhil
--%>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@ page import="java.io.*"%>
<%@page import="com.lowagie.text.*,com.lowagie.text.pdf.*"%>;
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
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
                    rs = st.executeQuery("SELECT * FROM cdc.courses;");
                    %>
        
                          <table width="100%" border="0">
                            <tr bgcolor="royalblue">
                                <td>
                                    <center>
                                        <font color="white">View Delegation</font>
                                    </center>
                                </td>
                            </tr>
                            </table>
                                    <table width="100%" border="1">
                            <tr>
                                    <td align="right"><a href="role.jsp" style ="text-decoration:none;"><font size="2" color="red"> Back</font></a> 
                                    <a href="Home.jsp" style ="text-decoration:none;"><font size="2" color="red">Home</font></a> 
                                    <a href="Logout.jsp" onclick="fun()" style ="text-decoration:none;"> <font size="2" color="red"> Logout</font></a> 
                                    </td>
                            </tr>
                            </table><br>
                        <center>
                        <TABLE BORDER="10" CELLPADDING="6" CELLSPACING="2" WIDTH="70%">
                            <tr bgcolor="royalblue">
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
                        <a href="download.jsp?ff=<%=f%>">Download the  document</a>
                        </center>
        
                    <%
                    break;
                    
                    
             case "Faculty" :
                    rs = st.executeQuery("SELECT * FROM cdc.faculty;");
                    %>
        
                          <table width="100%" border="0">
                            <tr bgcolor="royalblue">
                                <td>
                                    <center>
                                        <font color="white">View Delegation</font>
                                    </center>
                                </td>
                            </tr>
                            </table>
                                    <table width="100%" border="1">
                            <tr>
                                    <td align="right"><a href="role.jsp" style ="text-decoration:none;"><font size="2" color="red"> Back</font></a> 
                                    <a href="Home.jsp" style ="text-decoration:none;"><font size="2" color="red">Home</font></a> 
                                    <a href="Logout.jsp" onclick="fun()" style ="text-decoration:none;"> <font size="2" color="red"> Logout</font></a> 
                                    </td>
                            </tr>
                            </table><br>
                        <center>
                        <TABLE BORDER="10" CELLPADDING="6" CELLSPACING="2" WIDTH="70%">
                            <tr bgcolor="royalblue">
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
                        <a href="download.jsp?ff=<%=f%>">Download the  document</a>
                        </center>
        
                    <%
                    
                   
                    
                    
                    
                    break;
                    
            }
        
        
        
        %>
    </body>
</html>
