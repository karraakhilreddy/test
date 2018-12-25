<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>

<%
Connection conn = null;


java.util.Date date = new java.util.Date();

String filename = "D:\\f"+date.getTime() +".xls" ;

        String button=request.getParameter("button");
        switch(button){

            case "Faculty" :
                            try{


                            conn = Database.getConnection();

                            Statement stmt = conn.createStatement();
                            String strQuery = "SELECT * FROM cdc.faculty;";


                            ResultSet rs = stmt.executeQuery(strQuery);

                            HSSFWorkbook hwb = new HSSFWorkbook();
                            HSSFSheet sheet = hwb.createSheet("new sheet");

                            HSSFRow rowhead = sheet.createRow((short)2);
                            rowhead.createCell((short) 0).setCellValue("SNo");
                            rowhead.createCell((short) 1).setCellValue("Name");
                            rowhead.createCell((short) 2).setCellValue("Type");
                            rowhead.createCell((short) 3).setCellValue("Designation");
                            rowhead.createCell((short) 4).setCellValue("Qualification");
                            rowhead.createCell((short) 5).setCellValue("Date of appointment");
                            rowhead.createCell((short) 6).setCellValue("Nature of appointment");
                            rowhead.createCell((short) 7).setCellValue("Mode of appointment");
                            rowhead.createCell((short) 8).setCellValue("Scale of pay");
                            rowhead.createCell((short) 9).setCellValue("Mode of pay");
                            rowhead.createCell((short) 10).setCellValue("Bank account Number");
                            rowhead.createCell((short) 11).setCellValue("PAN card Number");
                            rowhead.createCell((short) 12).setCellValue("Aadhar number");
                            rowhead.createCell((short) 13).setCellValue("Mobile number");
                            
                            
                           

                            

                            int index=3;
                            int sno=0;
                            String name="";
                            while(rs.next()) 
                            {
                            sno++;

                            HSSFRow row = sheet.createRow((short)index);
                            row.createCell((short) 0).setCellValue(sno);
                            row.createCell((short) 1).setCellValue(rs.getString("tName"));
                            row.createCell((short) 2).setCellValue(rs.getString("tType"));
                            row.createCell((short) 3).setCellValue(rs.getString("tdesignation"));
                            row.createCell((short) 4).setCellValue(rs.getString("tQualification"));
                            row.createCell((short) 5).setCellValue(rs.getString("tDate"));
                            row.createCell((short) 6).setCellValue(rs.getString("tnature"));
                            row.createCell((short) 7).setCellValue(rs.getString("tModeApp"));
                            row.createCell((short) 8).setCellValue(rs.getString("tScale"));
                            row.createCell((short) 9).setCellValue(rs.getString("tModePay"));
                            row.createCell((short) 10).setCellValue(rs.getString("tBank"));
                            row.createCell((short) 11).setCellValue(rs.getString("tPAN"));
                            row.createCell((short) 12).setCellValue(rs.getString("tAadhar"));
                            row.createCell((short) 13).setCellValue(rs.getString("tMobile"));
                            
                            
                            
                            
                         
                    
                    
                    
                    
                    
                            index++;
                            }
                            FileOutputStream fileOut = new FileOutputStream(filename);
                            hwb.write(fileOut);
                            fileOut.close();
                            out.println("<b>Your excel file has been generated</b>");
                            response.sendRedirect("download.jsp?ff="+filename);
                            
                            } catch ( Exception ex ) {

                        } 
                        break;
                        
                        
            case "Course" :
                
                
                
                try{


                            conn = Database.getConnection();

                            Statement stmt = conn.createStatement();
                            String strQuery = "SELECT * FROM cdc.courses order by ctype asc;";


                            ResultSet rs = stmt.executeQuery(strQuery);

                            HSSFWorkbook hwb = new HSSFWorkbook();
                            HSSFSheet sheet = hwb.createSheet("new sheet");

                            HSSFRow rowhead = sheet.createRow((short)2);
                            rowhead.createCell((short) 0).setCellValue("SNo");
                            rowhead.createCell((short) 1).setCellValue("Type");
                            rowhead.createCell((short) 2).setCellValue("Course");
                            rowhead.createCell((short) 3).setCellValue("Combination");
                            rowhead.createCell((short) 4).setCellValue("Medium");
                            rowhead.createCell((short) 5).setCellValue("Intake");
                            rowhead.createCell((short) 6).setCellValue("Admitted");
                            rowhead.createCell((short) 6).setCellValue("Status");
                            rowhead.createCell((short) 7).setCellValue("Inspection Amount paid");
                            rowhead.createCell((short) 8).setCellValue("Inspection Amount paid on");
                            rowhead.createCell((short) 9).setCellValue("Affilation Amount paid");
                            rowhead.createCell((short) 10).setCellValue("Affilation Amount paid on");
                            
                            
                            
                           

                            

                            int index=3;
                            int sno=0;
                            String name="";
                            while(rs.next()) 
                            {
                            sno++;

                            HSSFRow row = sheet.createRow((short)index);
                            row.createCell((short) 0).setCellValue(sno);
                            row.createCell((short) 1).setCellValue(rs.getString("cType"));
                            row.createCell((short) 2).setCellValue(rs.getString("cCourse"));
                            row.createCell((short) 3).setCellValue(rs.getString("cCombination"));
                            row.createCell((short) 4).setCellValue(rs.getString("cMedium"));
                            row.createCell((short) 5).setCellValue(rs.getString("cIntakeSanctioned"));
                            row.createCell((short) 6).setCellValue(rs.getString("cStudentsAdmitted"));
                            row.createCell((short) 7).setCellValue(rs.getString("cStatus"));
                            
                            index++;
                            }
                            FileOutputStream fileOut = new FileOutputStream(filename);
                            hwb.write(fileOut);
                            fileOut.close();
                            out.println("<b>Your excel file has been generated</b>");
                            response.sendRedirect("download.jsp?ff="+filename);
                            
                            } catch ( Exception ex ) {

                        } 
                
                
                
                break;
        }
%>