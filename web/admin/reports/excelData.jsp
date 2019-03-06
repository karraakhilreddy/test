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

File tempFile = File.createTempFile("report", ".xls");
 String filename=tempFile.getAbsolutePath();
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
                                    out.print(ex.getMessage());
                        } 
                
                
                
                break;
                case "adminCollegeCourse" :
                
                 System.out.println("<b>Your excel file has been generated</b>");
                
                try{

                    System.out.println("<b>Your excel file has been generated</b>");
                            conn = Database.getConnection();

                            Statement stmt = conn.createStatement();
                            String strQuery = "SELECT cdc_college_details.cCode,cName,cType,cCourse,cCombination,cMedium,cIntakeSanctioned,cStudentsAdmitted,cStatus FROM  cdc_college_details  LEFT JOIN  courses ON cdc_college_details.ccode=courses.cCode Order by cdc_college_details.cCode ";
                            System.out.println("<b>Your excel file has been generated</b>");

                            ResultSet rs = stmt.executeQuery(strQuery);

                            HSSFWorkbook hwb = new HSSFWorkbook();
                            HSSFSheet sheet = hwb.createSheet("new sheet");

                            HSSFRow rowhead = sheet.createRow((short)2);
                            rowhead.createCell((short) 0).setCellValue("Code");
                            rowhead.createCell((short) 1).setCellValue("Name");
                            rowhead.createCell((short) 2).setCellValue("Type");
                            rowhead.createCell((short) 3).setCellValue("Course");
                            rowhead.createCell((short) 4).setCellValue("Combination");
                            rowhead.createCell((short) 5).setCellValue("Medium");
                            rowhead.createCell((short) 6).setCellValue("Intake");
                            rowhead.createCell((short) 7).setCellValue("Admitted");
                            rowhead.createCell((short) 8).setCellValue("Status");
                            rowhead.createCell((short) 9).setCellValue("Inspection Amount paid");
                            rowhead.createCell((short) 10).setCellValue("Inspection Amount paid on");
                            rowhead.createCell((short) 11).setCellValue("Affilation Amount paid");
                            rowhead.createCell((short) 12).setCellValue("Affilation Amount paid on");
                            
                            System.out.println("<b>Your excel file has been generated</b>");
                            
                           

                            

                            int index=3;
                            int sno=0;
                            String name="";
                            while(rs.next()) 
                            {
                                System.out.println("<b>Your excel file has been generated</b>");
                            sno++;

                            HSSFRow row = sheet.createRow((short)index);
                            row.createCell((short) 0).setCellValue(rs.getString("cdc_college_details.cCode"));
                            row.createCell((short) 1).setCellValue(rs.getString("cName"));
                            row.createCell((short) 2).setCellValue(rs.getString("cType"));
                            row.createCell((short) 3).setCellValue(rs.getString("cCourse"));
                            row.createCell((short) 4).setCellValue(rs.getString("cCombination"));
                            row.createCell((short) 5).setCellValue(rs.getString("cMedium"));
                            row.createCell((short) 6).setCellValue(rs.getString("cIntakeSanctioned"));
                            row.createCell((short) 7).setCellValue(rs.getString("cStudentsAdmitted"));
                            row.createCell((short) 8).setCellValue(rs.getString("cStatus"));
                            
                            index++;
                            }
                            FileOutputStream fileOut = new FileOutputStream(filename);
                            hwb.write(fileOut);
                            fileOut.close();
                            System.out.println("<b>Your excel file has been generated</b>");
                            response.sendRedirect("download.jsp?ff="+filename);
                            
                            } catch ( Exception ex ) {
                                out.println(ex.getMessage());
                        } 
                
                
                
                break;
                
                
               
                
                case "adminCollege" :
                
               
                
                 System.out.println("<b>1</b>");
                
                try{

                    System.out.println("<b>2</b>");
                            conn = Database.getConnection();

                            Statement stmt = conn.createStatement();
                            String strQuery = "SELECT * from cdc_college_details ;";
                            System.out.println("<b>3</b>");

                            ResultSet rs = stmt.executeQuery(strQuery);

                            HSSFWorkbook hwb = new HSSFWorkbook();
                            
                            
                            
                            HSSFSheet sheet1 = hwb.createSheet("AllColleges");
                            
                            

                            HSSFRow rowhead = sheet1.createRow((short)2);
                            rowhead.createCell((short) 0).setCellValue("Code");
                            rowhead.createCell((short) 1).setCellValue("College Name");
                            rowhead.createCell((short) 2).setCellValue("Email");
                            rowhead.createCell((short) 3).setCellValue("College Address");
                            rowhead.createCell((short) 4).setCellValue("Type");
                            rowhead.createCell((short) 5).setCellValue("Nature");
                            rowhead.createCell((short) 6).setCellValue("Society Name");
                            rowhead.createCell((short) 7).setCellValue("Society address");
                            rowhead.createCell((short) 8).setCellValue("Area of College");
                            rowhead.createCell((short) 9).setCellValue("Society Registration no");
                            rowhead.createCell((short) 10).setCellValue("Society  Registartion Year");
                            rowhead.createCell((short) 11).setCellValue("College Establishment year");
                            rowhead.createCell((short) 12).setCellValue("Secretary Name");
                            rowhead.createCell((short) 13).setCellValue("Secretary ph No");
                            rowhead.createCell((short) 14).setCellValue("Name of Prinipal");
                            rowhead.createCell((short) 15).setCellValue("Principal Ph No");
                            rowhead.createCell((short) 16).setCellValue("Principal Experience");
                            rowhead.createCell((short) 17).setCellValue("College Own Building");
                            rowhead.createCell((short) 18).setCellValue("Lessor");
                            rowhead.createCell((short) 19).setCellValue("lessee");
                            rowhead.createCell((short) 20).setCellValue("Leased period");
                            rowhead.createCell((short) 21).setCellValue("Leased Land survey no");
                            rowhead.createCell((short) 22).setCellValue("Land reg no");
                            rowhead.createCell((short) 23).setCellValue("Land reg date");
                            rowhead.createCell((short) 24).setCellValue("Land survey number");
                            rowhead.createCell((short) 25).setCellValue("land documentation no");
                            rowhead.createCell((short) 26).setCellValue("Date of registration");
                            rowhead.createCell((short) 27).setCellValue("Registred in the name of socirty");
                            rowhead.createCell((short) 28).setCellValue("Represented by secretray or member");
                            rowhead.createCell((short) 29).setCellValue("Representative name is in the list of members of society");
                            rowhead.createCell((short) 30).setCellValue("Entire land is single bit");
                            rowhead.createCell((short) 31).setCellValue("Sketch plan is certified by");
                            rowhead.createCell((short) 32).setCellValue("Permission granted by");
                            rowhead.createCell((short) 33).setCellValue("Map approved by");
                            rowhead.createCell((short) 34).setCellValue("Total area shown in map");
                            rowhead.createCell((short) 35).setCellValue("Play ground ");
                            rowhead.createCell((short) 36).setCellValue("Parking area ");
                            rowhead.createCell((short) 37).setCellValue("drinking water ");
                            rowhead.createCell((short) 38).setCellValue("Fire safety measures");
                            rowhead.createCell((short) 39).setCellValue("Sanitary certificate");
                            rowhead.createCell((short) 40).setCellValue("Total land in acers");
                            rowhead.createCell((short) 41).setCellValue("Building plinth area");
                            rowhead.createCell((short) 42).setCellValue("Principal room area");
                            rowhead.createCell((short) 43).setCellValue("Office room area");
                            rowhead.createCell((short) 44).setCellValue("Staff room area");
                            rowhead.createCell((short) 45).setCellValue("Games room area");
                            rowhead.createCell((short) 46).setCellValue("Ladies waiting room area");
                            rowhead.createCell((short) 47).setCellValue("Toilets room area");
                            rowhead.createCell((short) 48).setCellValue("Library room area");
                            rowhead.createCell((short) 49).setCellValue("Number of class rooms");
                            rowhead.createCell((short) 50).setCellValue("Size of each class room");
                            rowhead.createCell((short) 51).setCellValue("No.of lab rooms");
                            rowhead.createCell((short) 52).setCellValue("Size of each lab room");
                            rowhead.createCell((short) 53).setCellValue("Students attandance system");
                            rowhead.createCell((short) 54).setCellValue("Availability of CCtvs");
                            rowhead.createCell((short) 55).setCellValue("Availability of computers");
                            rowhead.createCell((short) 56).setCellValue("Availability of projectors");
                            rowhead.createCell((short) 57).setCellValue("Availability of NSS units");
                            rowhead.createCell((short) 58).setCellValue("No.of camps organised");
                            rowhead.createCell((short) 59).setCellValue("College is convening governing body  meeting regurarly");
                            rowhead.createCell((short) 60).setCellValue("Date of last meeting");
                            rowhead.createCell((short) 61).setCellValue("Librarian name");
                            rowhead.createCell((short) 62).setCellValue("No.of books");
                            rowhead.createCell((short) 63).setCellValue("no of Journals");
                            rowhead.createCell((short) 64).setCellValue("No.of Periodicals");
                            rowhead.createCell((short) 65).setCellValue("No. of teaching staff");
                            rowhead.createCell((short) 66).setCellValue("No. of non teaching staff");
                            rowhead.createCell((short) 67).setCellValue("FDR/BG No");
                            rowhead.createCell((short) 68).setCellValue("Date");
                            rowhead.createCell((short) 69).setCellValue("Amount");
                            rowhead.createCell((short) 70).setCellValue("Name of Issuing bank");
                            rowhead.createCell((short) 71).setCellValue("date of maturity");
                            rowhead.createCell((short) 72).setCellValue("date of renewal");
                            rowhead.createCell((short) 73).setCellValue("Inspection Amount");
                            rowhead.createCell((short) 74).setCellValue("Inspection Amount paid on date");
                            rowhead.createCell((short) 75).setCellValue("Inspection Amount");
                            rowhead.createCell((short) 76).setCellValue("Inspection Amount paid on date");
                            
                            
                            
                            System.out.println("<b>4</b>");
                            
                           

                            

                            int index=3;
                            int sno=0;
                            String name="";
                            try{
                            while(rs.next()) 
                            {
                                System.out.println("<b>5</b>");
                            sno++;

                            HSSFRow row = sheet1.createRow((short)index);
                            row.createCell((short) 0).setCellValue(rs.getString("cCode"));
                            row.createCell((short) 1).setCellValue(rs.getString("cName"));
                            row.createCell((short) 2).setCellValue(rs.getString("cEmail"));
                            row.createCell((short) 3).setCellValue(rs.getString("cAddress"));
                            row.createCell((short) 4).setCellValue(rs.getString("typeOfCollege"));
                            row.createCell((short) 5).setCellValue(rs.getString("natureOfCollege"));
                            row.createCell((short) 6).setCellValue(rs.getString("sName"));
                            row.createCell((short) 7).setCellValue(rs.getString("sAddress"));
                            row.createCell((short) 8).setCellValue(rs.getString("areaOfCollege"));
                            row.createCell((short) 9).setCellValue(rs.getString("sRegNo"));
                            row.createCell((short) 10).setCellValue(rs.getInt("sYear"));
                            row.createCell((short) 11).setCellValue(rs.getInt("cEstd"));
                            row.createCell((short) 12).setCellValue(rs.getString("secName"));
                            row.createCell((short) 13).setCellValue(rs.getLong("secPhNo"));
                            row.createCell((short) 14).setCellValue(rs.getString("cPrincipal"));
                            row.createCell((short) 15).setCellValue(rs.getLong("cPPhNo"));
                            row.createCell((short) 16).setCellValue(rs.getInt("cExperiencePrincipal"));
                            row.createCell((short) 17).setCellValue(rs.getString("valOwnBuilding"));
                            row.createCell((short) 18).setCellValue(rs.getString("lLessor"));
                            row.createCell((short) 19).setCellValue(rs.getString("lLessee"));
                            row.createCell((short) 20).setCellValue(rs.getInt("lPeriod"));
                            row.createCell((short) 21).setCellValue(rs.getString("lSurveyNo"));
                            row.createCell((short) 22).setCellValue(rs.getString("lRegNo"));
                            row.createCell((short) 23).setCellValue(rs.getString("lRegDate"));
                            row.createCell((short) 24).setCellValue(rs.getString("landSurveyNumber"));
                            row.createCell((short) 25).setCellValue(rs.getString("landDocNo"));
                            row.createCell((short) 26).setCellValue(rs.getString("landRegDate"));
                            row.createCell((short) 27).setCellValue(rs.getString("valRegSociety"));
                            row.createCell((short) 28).setCellValue(rs.getString("valSecMem"));
                            row.createCell((short) 29).setCellValue(rs.getString("valSocietyMem"));
                            row.createCell((short) 30).setCellValue(rs.getString("valSingleBit"));
                            row.createCell((short) 31).setCellValue(rs.getString("valLandCert"));
                            row.createCell((short) 32).setCellValue(rs.getString("grantPermission"));
                            row.createCell((short) 33).setCellValue(rs.getString("mapApproval"));
                            row.createCell((short) 34).setCellValue(rs.getInt("mapArea"));
                            row.createCell((short) 35).setCellValue(rs.getString("valPlayGround"));
                            row.createCell((short) 36).setCellValue(rs.getString("valParkingArea"));
                            row.createCell((short) 37).setCellValue(rs.getString("valDrinkingWater"));
                            row.createCell((short) 38).setCellValue(rs.getString("valFireSafety"));
                            row.createCell((short) 39).setCellValue(rs.getString("valSanitaryCert"));
                            row.createCell((short) 40).setCellValue(rs.getInt("totalLand"));
                            row.createCell((short) 41).setCellValue(rs.getInt("bPlinthArea"));
                            row.createCell((short) 42).setCellValue(rs.getInt("priRoomArea"));
                            row.createCell((short) 43).setCellValue(rs.getInt("offRoomArea"));
                            row.createCell((short) 44).setCellValue(rs.getInt("staffRoomArea"));
                            row.createCell((short) 45).setCellValue(rs.getInt("gamesRoomArea"));
                            row.createCell((short) 46).setCellValue(rs.getInt("lWaitingRoom"));
                            row.createCell((short) 47).setCellValue(rs.getInt("toiletsRoomArea"));
                            row.createCell((short) 48).setCellValue(rs.getInt("libraryArea"));
                            row.createCell((short) 49).setCellValue(rs.getInt("noClassRooms"));
                            row.createCell((short) 50).setCellValue(rs.getInt("classSize"));
                            row.createCell((short) 51).setCellValue(rs.getInt("noLabRooms"));
                            row.createCell((short) 52).setCellValue(rs.getInt("labSize"));
                            row.createCell((short) 53).setCellValue(rs.getString("cAttendanceSystem"));
                            row.createCell((short) 54).setCellValue(rs.getString("cCCTV"));
                            row.createCell((short) 55).setCellValue(rs.getString("cComputers"));
                            row.createCell((short) 56).setCellValue(rs.getString("cProjectors"));
                            row.createCell((short) 57).setCellValue(rs.getString("cNSSUnit"));
                            row.createCell((short) 58).setCellValue(rs.getInt("cNSSCampsNo"));
                            row.createCell((short) 59).setCellValue(rs.getString("cMeetings"));
                           
                            row.createCell((short) 61).setCellValue(rs.getString("nLibrarian"));
                            row.createCell((short) 62).setCellValue(rs.getInt("noBooks"));
                            row.createCell((short) 63).setCellValue(rs.getInt("noJournels"));
                            row.createCell((short) 64).setCellValue(rs.getInt("noPeriodicals"));
                            row.createCell((short) 65).setCellValue(rs.getInt("noTeachingStaff"));
                            row.createCell((short) 66).setCellValue(rs.getInt("noNonTeachingStaff"));
                            row.createCell((short) 67).setCellValue(rs.getString("CFDNo"));
                            row.createCell((short) 68).setCellValue(rs.getString("CFDDate"));
                            row.createCell((short) 69).setCellValue(rs.getInt("CFDAmount"));
                            row.createCell((short) 70).setCellValue(rs.getString("CFDIssuingBank"));
                            row.createCell((short) 71).setCellValue(rs.getString("CFDMaturitydate"));
                            row.createCell((short) 72).setCellValue(rs.getString("CFDRenewalDate"));
                            row.createCell((short) 72).setCellValue(rs.getString("iAmount"));
                            
                            row.createCell((short) 72).setCellValue(rs.getString("iDate"));
                            row.createCell((short) 72).setCellValue(rs.getString("aAmount"));
                            row.createCell((short) 72).setCellValue(rs.getString("aDate"));
                            
                            //out.print(rs.getString("cCode"));
                            index++;
                            }
                            }catch(Exception e){
                                System.out.print(e.getMessage());
                            }
                            
                            HSSFSheet sheet = hwb.createSheet("Courses");
                            
                            System.out.println("<b>6</b>");
                            
                            
                             strQuery = "SELECT cdc_college_details.cCode,cName,cType,cCourse,cCombination,cMedium,cIntakeSanctioned,cStudentsAdmitted,cStatus FROM  cdc_college_details  LEFT JOIN  courses ON cdc_college_details.ccode=courses.cCode Order by cdc_college_details.cCode ";
                            System.out.println("<b>Your excel file has been generated</b>");

                             rs = stmt.executeQuery(strQuery);

                            
                           System.out.println("<b>7</b>");

                            rowhead = sheet.createRow((short)2);
                            rowhead.createCell((short) 0).setCellValue("Code");
                            rowhead.createCell((short) 1).setCellValue("Name");
                            rowhead.createCell((short) 2).setCellValue("Type");
                            rowhead.createCell((short) 3).setCellValue("Course");
                            rowhead.createCell((short) 4).setCellValue("Combination");
                            rowhead.createCell((short) 5).setCellValue("Medium");
                            rowhead.createCell((short) 6).setCellValue("Intake");
                            rowhead.createCell((short) 7).setCellValue("Admitted");
                            rowhead.createCell((short) 8).setCellValue("Status");
                            rowhead.createCell((short) 9).setCellValue("Inspection Amount paid");
                            rowhead.createCell((short) 10).setCellValue("Inspection Amount paid on");
                            rowhead.createCell((short) 11).setCellValue("Affilation Amount paid");
                            rowhead.createCell((short) 12).setCellValue("Affilation Amount paid on");
                            
                            System.out.println("<b>Your excel file has been generated</b>");
                            
                           
                            System.out.println("<b>8</b>");
                            

                             index=3;
                             sno=0;
                             name="";
                            while(rs.next()) 
                            {
                                System.out.println("<b>9</b>");
                                System.out.println("<b>Your excel file has been generated</b>");
                            sno++;

                            HSSFRow row = sheet.createRow((short)index);
                            row.createCell((short) 0).setCellValue(rs.getString("cdc_college_details.cCode"));
                            row.createCell((short) 1).setCellValue(rs.getString("cName"));
                            row.createCell((short) 2).setCellValue(rs.getString("cType"));
                            row.createCell((short) 3).setCellValue(rs.getString("cCourse"));
                            row.createCell((short) 4).setCellValue(rs.getString("cCombination"));
                            row.createCell((short) 5).setCellValue(rs.getString("cMedium"));
                            row.createCell((short) 6).setCellValue(rs.getString("cIntakeSanctioned"));
                            row.createCell((short) 7).setCellValue(rs.getString("cStudentsAdmitted"));
                            row.createCell((short) 8).setCellValue(rs.getString("cStatus"));
                            
                            index++;
                            }
                             sheet = hwb.createSheet("Faculty");
                            
                            
                            System.out.println("<b>9</b>");
                            
                             strQuery = "SELECT cdc_college_details.cCode,cName,faculty.tType,tName,tDesignation,tQualification,tDate,tNature,tModeApp,tScale,tBank,tModePay,tPan,tAadhar,tMobile FROM  cdc_college_details  LEFT JOIN  faculty ON cdc_college_details.cCode=faculty.cCode Order by cdc_college_details.cCode ";
                            System.out.println("<b>Your excel file has been generated</b>");

                             rs = stmt.executeQuery(strQuery);

                            
                           

                            rowhead = sheet.createRow((short)2);
                            rowhead.createCell((short) 0).setCellValue("Code");
                            rowhead.createCell((short) 1).setCellValue("College");
                            rowhead.createCell((short) 2).setCellValue("Name");
                            rowhead.createCell((short) 3).setCellValue("Type");
                            rowhead.createCell((short) 4).setCellValue("Designation");
                            rowhead.createCell((short) 5).setCellValue("Qualification");
                            rowhead.createCell((short) 6).setCellValue("Date of appointment");
                            rowhead.createCell((short) 7).setCellValue("Nature of appointment");
                            rowhead.createCell((short) 8).setCellValue("Mode of Appointment");
                            rowhead.createCell((short) 9).setCellValue("Scale of Pay");
                            rowhead.createCell((short) 10).setCellValue("Mode of pay");
                            rowhead.createCell((short) 11).setCellValue("Bank Account No");
                            rowhead.createCell((short) 12).setCellValue("Pan card number");
                            rowhead.createCell((short) 13).setCellValue("Aadhar number");
                            rowhead.createCell((short) 14).setCellValue("Phone number");
                            
                            System.out.println("<b>Your excel file has been generated</b>");
                            
                           

                            

                             index=3;
                             sno=0;
                             name="";
                            while(rs.next()) 
                            {
                                System.out.println("<b>Your excel file has been generated</b>");
                            sno++;

                            HSSFRow row = sheet.createRow((short)index);
                            row.createCell((short) 0).setCellValue(rs.getString("cdc_college_details.cCode"));
                            row.createCell((short) 1).setCellValue(rs.getString("cName"));
                            row.createCell((short) 2).setCellValue(rs.getString("tName"));
                            row.createCell((short) 3).setCellValue(rs.getString("tType"));
                            row.createCell((short) 4).setCellValue(rs.getString("tDesignation"));
                            row.createCell((short) 5).setCellValue(rs.getString("tQualification"));
                            row.createCell((short) 6).setCellValue(rs.getString("tDate"));
                            row.createCell((short) 7).setCellValue(rs.getString("tNature"));
                            row.createCell((short) 8).setCellValue(rs.getString("tModeApp"));
                            row.createCell((short) 9).setCellValue(rs.getString("tScale"));
                            row.createCell((short) 10).setCellValue(rs.getString("tModePay"));
                            row.createCell((short) 11).setCellValue(rs.getString("tBank"));
                            row.createCell((short) 12).setCellValue(rs.getString("tPan"));
                            row.createCell((short) 13).setCellValue(rs.getString("tAadhar"));
                            row.createCell((short) 14).setCellValue(rs.getString("tMobile"));
                            
                            index++;
                            }
                            
                            
                           
                
                
                            FileOutputStream fileOut = new FileOutputStream(filename);
                            hwb.write(fileOut);
                            fileOut.close();
                            System.out.println("<b>6</b>");
                            response.sendRedirect("download.jsp?ff="+filename);
                            
                            } catch ( Exception ex ) {
                                System.out.println(ex.getMessage());
                        } 
                
                
                
                break;
                  case "Logs" :
                            try{


                            conn = Database.getConnection();

                            Statement stmt = conn.createStatement();
                            String strQuery = "SELECT * FROM cdc.logs;";


                            ResultSet rs = stmt.executeQuery(strQuery);

                            HSSFWorkbook hwb = new HSSFWorkbook();
                            HSSFSheet sheet = hwb.createSheet("new sheet");

                            HSSFRow rowhead = sheet.createRow((short)2);
                            rowhead.createCell((short) 0).setCellValue("SNo");
                            rowhead.createCell((short) 1).setCellValue("College Code");
                            rowhead.createCell((short) 2).setCellValue("Time");
                            rowhead.createCell((short) 3).setCellValue("IP");
                            rowhead.createCell((short) 4).setCellValue("In");
                            rowhead.createCell((short) 5).setCellValue("Action");
                                                       

                            int index=3;
                            int sno=0;
                            String name="";
                            while(rs.next()) 
                            {
                            sno++;

                            HSSFRow row = sheet.createRow((short)index);
                            row.createCell((short) 0).setCellValue(sno);
                            row.createCell((short) 1).setCellValue(rs.getString("cCode"));
                            row.createCell((short) 2).setCellValue(rs.getString("time"));
                            row.createCell((short) 3).setCellValue(rs.getString("IP"));
                            row.createCell((short) 4).setCellValue(rs.getString("in"));
                            row.createCell((short) 5).setCellValue(rs.getString("action"));
                            
                            index++;
                            }
                            FileOutputStream fileOut = new FileOutputStream(filename);
                            hwb.write(fileOut);
                            fileOut.close();
                            out.println("<b>Your excel file has been generated</b>");
                            response.sendRedirect("download.jsp?ff="+filename);
                            
                            } catch ( Exception ex ) {
                                out.print(ex.getMessage());
                        } 
                        break;
                        
          
        }
%>