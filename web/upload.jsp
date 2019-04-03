<%-- 
    Document   : testform
    Created on : 3 Oct, 2018, 12:35:43 PM
    Author     : akhil
--%>

<%@page import="cdc.mail_Senddd"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.mysql.cj.util.StringUtils"%>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page import="cdc.logs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KU</title>
    </head>
    <body>
        <% 
            String cCode=(String)session.getAttribute("cCode");
            
            String name=(String)request.getParameter("name");
            
            Connection con=Database.getConnection();
            PreparedStatement ps;
            
            
            String ipAddress = request.getHeader("X-FORWARDED-FOR");  
             if (ipAddress == null) {  
                   ipAddress = request.getRemoteAddr();  
             }
            switch(name){
                
                case "faculty" :
                    //int row=Integer.parseInt(request.getParameter("rows"));
                    //String array=(String)request.getParameter("array");
                   // String data[]=array.split(",");
                   
                    
                    String tName=(String)request.getParameter("tName");
                    String tType=(String)request.getParameter("tType");
                    String tDesignation=(String)request.getParameter("tDesignation");
                    String tQualification=(String)request.getParameter("tQualification");
                     String startDate=(String)request.getParameter("tDate");
                    
                     //String startDate="12-31-2014";
                    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date date = sdf1.parse(startDate);
                    java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
                   
                    String tNature=(String)request.getParameter("tNature");
                    String tModeApp=(String)request.getParameter("tModeApp");
                    String tScale=(String)request.getParameter("tScale");
                    String tModePay=(String)request.getParameter("tModePay");
                    String tBank=(String)request.getParameter("tBank");
                    String tPan=(String)request.getParameter("tPAN");
                    String tAadhar=(String)request.getParameter("tAadhar");
                    String tMobile=(String)request.getParameter("tMobile");
                    
                    
                   // out.println(data);
                     
                     String insertTableSQL = "INSERT INTO `cdc`.`faculty` (`cCode`, `tName`, `tType`, `tDesignation`, `tQualification`, `tDate`, `tNature`, `tModeApp`, `tScale`, `tModePay`,`tBank`, `tPan`, `tAadhar`, `tMobile`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                     ps=con.prepareStatement(insertTableSQL);
                                    
                      

                    try {
                                    for(int i=0;i<1;i++)
                                    {

                                                  ps.setString(1, cCode);
                                                  ps.setString(2, tName);
                                                  ps.setString(3, tType);
                                                  ps.setString(4, tDesignation);
                                                  ps.setString(5, tQualification);
                                                  ps.setDate(6, sqlStartDate);
                                                  ps.setString(7, tNature);
                                                  ps.setString(8, tModeApp);
                                                  ps.setString(9, tScale);
                                                  ps.setString(10, tModePay);
                                                  ps.setString(11, tBank);
                                                  ps.setString(12, tPan);
                                                  ps.setString(13, tAadhar);
                                                  ps.setString(14, tMobile);
                                                  
                                                 
                                                 

                                                  // execute insert SQL stetement
                                                  ps.executeUpdate();
                                                  logs l=new logs();
                                                
                                            
                                            l.updateLog(cCode, "facultyDetails.jsp", "inserted Faculty Details",ipAddress);
                                                   
                                                  System.out.println("Record is inserted into DBUSER table!");
                                                  response.sendRedirect("facultyDetails.jsp");
                                    }

                    } catch (Exception e) {
                                System.out.println(e.getMessage());
                                %> <script>alert ( "Update failed :<%=e.getMessage()%>" );
                                            window.location='facultyDetails.jsp';</script><%
                               System.out.println(e.getMessage());
                               

                    } finally {

                            if (ps != null) {
                                     ps.close();
                            }

                            if (con != null) {
                                     con.close();
                            }
                            
                    }
                    break;
                    case "course0" :
                    
                    String type=(String)request.getParameter("type");
                    String course=(String)request.getParameter("course");
                    String combination=(String)request.getParameter("combination");
                    String medium=(String)request.getParameter("medium");
                    String intake=(String)request.getParameter("intake");
                    String admit=(String)request.getParameter("admit");
                    System.out.println(type+"\n"+course+"\n"+combination+"\n"+medium+"\n"+intake+"\n");
                    insertTableSQL = "INSERT INTO `cdc`.`courses` (`cCode`, `cType`, `cCourse`, `cCombination`, `cMedium`, `cIntakeSanctioned`, `cStudentsAdmitted`, `cStatus`) VALUES (?, ?, ?, ?, ?, ?, ?, ? )";

                    ps=con.prepareStatement(insertTableSQL);
                    

                    try {
                                    

                                                  ps.setString(1, cCode);
                                                  ps.setString(2, type);
                                                  ps.setString(3, course);
                                                  ps.setString(4, combination);
                                                  ps.setString(5, medium);
                                                  ps.setString(6, intake);
                                                  ps.setString(7, admit);
                                                  ps.setString(8, "Previously Existing Course");
                                                 
                                                 
                                                 
                                                 

                                                  // execute insert SQL stetement
                                                  ps.executeUpdate();
                                                   logs l=new logs();
                                                    l.updateLog(String.valueOf(cCode), "courseDetails.jsp", "inserted Course Details",ipAddress); 
                                                  
                                                  System.out.println("Record is inserted into DBUSER table!");
                                                    response.sendRedirect("courseDetails.jsp");
                                    

                    } catch (Exception e) {
                                 %> <script>alert ( "Update failed :<%=e.getMessage()%>" );
                                            window.location='courseDetails.jsp';</script><%
                               System.out.println(e.getMessage());

                    } finally {

                            if (ps != null) {
                                     ps.close();
                            }

                            if (con != null) {
                                     con.close();
                            }
                              
                           
                    }
                    break;
                    case "course1" :
                    
                     type=(String)request.getParameter("type");
                     course=(String)request.getParameter("course");
                     combination=(String)request.getParameter("combination");
                     medium=(String)request.getParameter("medium");
                     intake=(String)request.getParameter("intake");
                     
                    System.out.println(type+"\n"+course+"\n"+combination+"\n"+medium+"\n"+intake+"\n");
                    insertTableSQL = "INSERT INTO `cdc`.`courses` (`cCode`, `cType`, `cCourse`, `cCombination`, `cMedium`, `cIntakeSanctioned`, `cStudentsAdmitted`, `cStatus`) VALUES (?, ?, ?, ?, ?, ?, ?, ? )";

                    ps=con.prepareStatement(insertTableSQL);
                    

                    try {
                                    

                                                  ps.setString(1, cCode);
                                                  ps.setString(2, type);
                                                  ps.setString(3, course);
                                                  ps.setString(4, combination);
                                                  ps.setString(5, medium);
                                                  ps.setString(6, intake);
                                                  ps.setString(7, "0");
                                                  ps.setString(8, "Inspection fee Pending");
                                                 
                                                 
                                                 
                                                 

                                                  // execute insert SQL stetement
                                                  ps.executeUpdate();
                                                   logs l=new logs();
                                                    l.updateLog(String.valueOf(cCode), "courseDetails1.jsp", "inserted Course Details",ipAddress); 
                                                  
                                                  System.out.println("Record is inserted into DBUSER table!");
                                                  response.sendRedirect("courseDetails1.jsp");
                                    

                    } catch (Exception e) {
                                 %> <script>alert ( "Update failed :<%=e.getMessage()%>" );
                                            window.location='courseDetails1.jsp';</script><%
                               System.out.println(e.getMessage());

                    } finally {

                            if (ps != null) {
                                     ps.close();
                            }

                            if (con != null) {
                                     con.close();
                            }
                              
                           
                    }
                    break;
                    case "generalDetails" :
                      try{
                             int sno=0;
                             String query="select sno from cdc_college_details where cCode='"+cCode+"';";


                            // Connection conn=Database.getConnection();
                             Statement stmt=con.createStatement();
                             ResultSet rs=stmt.executeQuery(query);
                             if(rs.next())
                               sno=rs.getInt("sno");
                        
                            String cName=request.getParameter("cName");
                            String cAddress=request.getParameter("cAddress");
                            String typeOfCollege=request.getParameter("typeOfCollege");
                            String natureOfCollege=request.getParameter("natureOfCollege");

                            String sName = request.getParameter("sName");
                            String sAddress = request.getParameter("sAddress");
                            String areaOfCollege=request.getParameter("areaOfCollege");
                            String sRegNo= request.getParameter("sRegNo");
                            String sYear = request.getParameter("sYear");
                            String cEstd =request.getParameter("cEstd");
                            String secName = request.getParameter("secName");
                            long secPhNo = Long.parseLong(request.getParameter("secPhNo"));
                            String cPrincipal = request.getParameter("cPrincipal");
                            long cPPhNo = Long.parseLong(request.getParameter("cPPhNo"));
                            String cEmail = request.getParameter("cEmail");
                            
                            String uQuery="update cdc_college_details set cAddress = ?,typeOfCollege=?,sName=?,sAddress=?,areaOfCollege=?,sregNo=?,sYear=?,"+
                            "cEstd=?,secName=?,secPhno=?,cPrincipal=?,CPPhNo=?,natureOfCollege=?,cName=?,cEmail=? where sno = ?;";

                            ps = con.prepareStatement(uQuery);
                            ps.setString(1, cAddress);
                            ps.setString(2, typeOfCollege);
                            ps.setString(3,sName);
                            ps.setString(4,sAddress);
                            ps.setString(5,areaOfCollege);
                            ps.setString(6,sRegNo);
                            ps.setString(7,sYear);
                            ps.setString(8,cEstd);
                            ps.setString(9,secName);
                            ps.setLong(10,secPhNo);
                            ps.setString(11,cPrincipal);
                            ps.setLong(12, cPPhNo);
                            
                            ps.setString(13,natureOfCollege);
                            ps.setString(14,cName);
                            ps.setString(15,cEmail);
                            ps.setInt(16,sno);
                            
                            int i=ps.executeUpdate();
                            if(i==1)
                                        {
                                             logs l=new logs();
                                           l.updateLog(String.valueOf(cCode), "General Details", "Updated Basic Details",ipAddress); 

                                            %> <script>alert ( "Update succesfull" );
                                            window.location='basicDetails.jsp';</script><%

                                            System.out.println("updated successfully");
                                        }
                                        else{
                                            %> <script>alert ( "Update failed :");
                                            window.location='basicDetails.jsp';</script><%

                                            out.println("no updation");  
                                        }                           
                       }
                           catch(Exception e){
                                %> <script>alert ( "Update failed : "+<%=e.getMessage()%> );</script><%
                                System.out.println(e.getMessage());       
                            } 


                    break;
                        
                        
                    case "buildingDetails":
                        try{
                             int sno=0;
                             String query="select sno from cdc_college_details where cCode='"+cCode+"';";


                            // Connection conn=Database.getConnection();
                             Statement stmt=con.createStatement();
                             ResultSet rs=stmt.executeQuery(query);
                             if(rs.next())
                               sno=rs.getInt("sno");
                                String valOwnBuilding = request.getParameter("valOwnBuilding");
                                //out.println(valOwnBuilding);
                                String lLessor = request.getParameter("lLessor");
                                String lLessee = request.getParameter("lLessee");
                                int lPeriod =Integer.parseInt( request.getParameter("lPeriod"));
                                String lSurveyNo = request.getParameter("lSurveyNo");
                                String lRegNo= request.getParameter("lRegNo");
                                String lRegDate = request.getParameter("lRegDate");
                                String landSurveyNumber = request.getParameter("landSurveyNumber");
                                String landDocNo= request.getParameter("landDocNo");
                                String landRegDate= request.getParameter("landRegDate");
                                String valRegSociety=request.getParameter("valRegSociety");
                                //out.print(valRegSociety);
                                String valSecMem= request.getParameter("valSecMem");
                               // out.println(valSecMem);
                                String valSocietyMem=request.getParameter("valSocietyMem");
                                String valSingleBit=request.getParameter("valSingleBit");
                                String valLandCert=request.getParameter("valLandCert");
                                String grantPermission = request.getParameter("grantPermission");
                                String mapApproval= request.getParameter("mapApproval");
                                int mapArea =Integer.parseInt( request.getParameter("mapArea"));
                                String valPlayGround = request.getParameter("valPlayGround");
                                String valParkingArea =request.getParameter("valParkingArea");
                                String valDrinkingWater = request.getParameter("valDrinkingWater");
                                String valFireSafety= request.getParameter("valFireSafety");
                                String valSanitaryCert =request.getParameter("valSanitaryCert");
                                int totalLand= Integer.parseInt(request.getParameter("totalLand"));
                                int bPlinthArea= Integer.parseInt(request.getParameter("bPlinthArea"));
                                int priRoomArea=Integer.parseInt( request.getParameter("priRoomArea"));
                                int offRoomArea=Integer.parseInt( request.getParameter("offRoomArea"));
                                int staffRoomArea= Integer.parseInt(request.getParameter("staffRoomArea"));
                                int gamesRoomArea=Integer.parseInt( request.getParameter("gamesRoomArea"));
                                int lWaitingRoom= Integer.parseInt(request.getParameter("lWaitingRoom"));
                                int toiletsRoomArea=Integer.parseInt( request.getParameter("toiletsRoomArea"));
                                int libraryArea=Integer.parseInt( request.getParameter("libraryArea"));
                                int noClassRooms=Integer.parseInt( request.getParameter("noClassRooms"));
                                int classSize=Integer.parseInt( request.getParameter("classSize"));
                                int noLabRooms=Integer.parseInt( request.getParameter("noLabRooms"));
                                int labSize=Integer.parseInt( request.getParameter("labSize"));
                                
                                
                                String uQuery="update cdc_college_details set  lLessor=?,lLessee=?,lPeriod=?,lSurveyNo=?,lRegNo=?,"+
                                "lRegDate=?,landSurveyNumber=?,landDocNo=?,landRegDate=?,valRegSociety = ?,valSecMem=?,valSocietyMem=?,valSingleBit=?,valLandCert=?,"+
                                "grantPermission=?, mapApproval=?, mapArea=?, valPlayGround=?,valParkingArea=?,valDrinkingWater=?,valFireSafety=?, valSanitaryCert=?,"+
                                "totalLand=?, bPlinthArea=?, priRoomArea=?, offRoomArea=?,gamesRoomArea=?, lWaitingRoom=?, toiletsRoomArea=?, libraryArea=?, classSize=?,"+
                                " labSize=?, staffRoomArea=? , noClassRooms=?,noLabRooms=?, valOwnBuilding=? where sno = ?;";

                               
                                ps = con.prepareStatement(uQuery);
                                ps.setString(1,lLessor);
                                ps.setString(2,lLessee);
                                ps.setInt(3,lPeriod);
                                ps.setString(4,lSurveyNo);
                                ps.setString(5,lRegNo);
                                ps.setString(6,lRegDate);
                                ps.setString(7,landSurveyNumber);
                                ps.setString(8,landDocNo);
                                ps.setString(9,landRegDate);
                                ps.setString(10,valRegSociety);
                                ps.setString(11,valSecMem);
                                ps.setString(12,valSocietyMem);
                                ps.setString(13,valSingleBit);
                                ps.setString(14,valLandCert);
                                ps.setString(15,grantPermission);
                                ps.setString(16,mapApproval);
                                ps.setInt(17,mapArea);
                                ps.setString(18,valPlayGround);
                                ps.setString(19, valParkingArea);
                                ps.setString(20,valDrinkingWater);
                                ps.setString(21,valFireSafety);
                                ps.setString(22,valSanitaryCert);
                                ps.setInt(23,totalLand);
                                ps.setInt(24,bPlinthArea);
                                ps.setInt(25,priRoomArea);
                                ps.setInt(26,offRoomArea);
                                ps.setInt(27,gamesRoomArea);
                                ps.setInt(28,lWaitingRoom);
                                ps.setInt(29,toiletsRoomArea);
                                ps.setInt(30,libraryArea);
                                ps.setInt(31,classSize);
                                ps.setInt(32,labSize);
                                ps.setInt(33,staffRoomArea);
                                ps.setInt(34,noClassRooms);
                                ps.setInt(35,noLabRooms);
                                ps.setString(36,valOwnBuilding);
                                

                                ps.setInt(37,sno);
               
                          
                            int i=ps.executeUpdate();
                            if(i==1)
                                        {
                                             logs l=new logs();
                                           l.updateLog(String.valueOf(cCode), "Building details", "Updated Basic Details",ipAddress); 

                                            %> <script>alert ( "Update succesfull" );
                                            window.location='basicDetails.jsp';</script><%

                                            System.out.println("updated successfully");
                                        }
                                        else{
                                            %> <script>alert ( "Update failed" );
                                            window.location='basicDetails.jsp';</script><%

                                            System.out.println("no updation");  
                                        }                           
                       }
                           catch(Exception e){
                                %> <script>alert ( "Update failed :<%=e.getMessage()%> " );</script><%
                                System.out.println(e.getMessage());       
                            } 

                    break;
                    case "staffDetails":
                        try{
                             int sno=0;
                             String query="select sno from cdc_college_details where cCode='"+cCode+"';";


                           //  Connection conn=Database.getConnection();
                             Statement stmt=con.createStatement();
                             ResultSet rs=stmt.executeQuery(query);
                             if(rs.next())
                               sno=rs.getInt("sno");
                             

                            String nLibrarian= request.getParameter("nLibrarian");
                            int noBooks=Integer.parseInt( request.getParameter("noBooks"));
                            int noJournels=Integer.parseInt( request.getParameter("noJournels"));
                            int noPeriodicals= Integer.parseInt(request.getParameter("noPeriodicals"));
                            int noTeachingStaff=Integer.parseInt( request.getParameter("noTeachingStaff"));
                            int noNonTeachingStaff=Integer.parseInt( request.getParameter("noNonTeachingStaff"));
                            
                            String uQuery="update cdc_college_details set nLibrarian=?, noBooks=?, noJournels=?,"+
                            "noPeriodicals=?,noTeachingStaff=?, noNonTeachingStaff=? where sno = ?;";
                            ps = con.prepareStatement(uQuery);
                            ps.setString(1,nLibrarian);
                            ps.setInt(2,noBooks);
                            ps.setInt(3, noJournels);
                            ps.setInt(4,noPeriodicals);
                            ps.setInt(5,noTeachingStaff);
                            ps.setInt(6,noNonTeachingStaff);
                            ps.setInt(7,sno);
                            
                            int i=ps.executeUpdate();
                            if(i==1)
                                        {
                                             logs l=new logs();
                                           l.updateLog(String.valueOf(cCode), "Staff Details", "Updated Basic Details",ipAddress); 

                                            %> <script>alert ( "Update succesfull" );
                                            window.location='basicDetails.jsp';</script><%

                                            System.out.println("updated successfully");
                                        }
                                        else{
                                            %> <script>alert ( "Update failed" );
                                            window.location='basicDetails.jsp';</script><%

                                            out.println("no updation");  
                                        }                           
                       }
                           catch(Exception e){
                                %> <script>alert ( "Update failed :<%=e.getMessage()%> " );</script><%
                                //out.println(e.getMessage());       
                            }

                    break;
                    case "corpusFundDetails":
                        try{
                            

                            // Connection conn=Database.getConnection();
                             Statement stmt=con.createStatement();
                             
                        
                        
                            String CFDNo=request.getParameter("CFDNo");
                            String CFDDate= request.getParameter("CFDDate");
                            int CFDAmount= Integer.parseInt(request.getParameter("CFDAmount"));
                            String CFDIssuingBank= request.getParameter("CFDIssuingBank");
                            String CFDMaturitydate = request.getParameter("CFDMaturitydate");
                            String CFDRenewalDate= request.getParameter("CFDRenewalDate");
                            
                             String uQuery="INSERT INTO `cdc`.`cfd`(`ccode`,`CFDNo`,`CFDDate`,`CFDAmount`,`CFDIssuingBank`,`CFDMaturityDate`,`CFDRenewalDate`)VALUES(?,?,?,?,?,?,?);";
                            
                            ps = con.prepareStatement(uQuery);
                            ps.setString(1,cCode);
                            ps.setString(2,CFDNo);
                            ps.setString(3,CFDDate);
                            ps.setInt(4,CFDAmount);
                            ps.setString(5,CFDIssuingBank);
                            ps.setString(6,CFDMaturitydate);
                            ps.setString(7,CFDRenewalDate);
                           
                             
                            int i=ps.executeUpdate();
                            if(i==1)
                                        {
                                             logs l=new logs();
                                           l.updateLog(String.valueOf(cCode), "CFD details", "Updated Basic Details",ipAddress); 

                                            %> <script>alert ( "Update succesfull" );
                                            window.location='basicDetails.jsp';</script><%

                                            System.out.println("updated successfully");
                                        }
                                        else{
                                            %> <script>alert ( "Update failed" );
                                            window.location='basicDetails.jsp';</script><%

                                            out.println("no updation");  
                                        }                           
                            }
                           catch(Exception e){
                                %> <script>alert ( "Update failed : " <%=e.getMessage()%>);</script><%
                                //out.println(e.getMessage());       
                            }

                            
                    break;
                        
                        
                    case "additionalDetails":
                        
                         try{
                             int sno=0;
                             String query="select sno from cdc_college_details where cCode='"+cCode+"';";


                             //Connection conn=Database.getConnection();
                             Statement stmt=con.createStatement();
                             ResultSet rs=stmt.executeQuery(query);
                             if(rs.next())
                               sno=rs.getInt("sno");
                        
                            String cAttendanceSystem=request.getParameter("cAttendanceSystem");
                            String cCCTV =request.getParameter("cCCTV");
                            String cComputers=request.getParameter("cComputers");
                            String cProjectors=request.getParameter("cProjectors");
                            String cNSSUnit =request.getParameter("cNSSUnit");
                            int cNSSCampsNo=Integer.parseInt( request.getParameter("cNSSCampsNo"));
                            String cMeetings=request.getParameter("cMeetings");
                            
                            String uQuery="update cdc_college_details set cAttendanceSystem=?,cCCTV=?,cComputers=?,cProjectors=?,cNSSUnit=?,cNSSCampsNo=?,cMeetings=? where sno = ?;";
                            
                            ps = con.prepareStatement(uQuery);
                            ps.setString(1,cAttendanceSystem);
                            ps.setString(2,cCCTV);
                            ps.setString(3,cComputers);
                            ps.setString(4,cProjectors);
                            ps.setString(5,cNSSUnit);
                            ps.setInt(6,cNSSCampsNo);
                            ps.setString(7,cMeetings);
                            ps.setInt(8,sno); 
                            int i=ps.executeUpdate();
                            if(i==1)
                                        {
                                             logs l=new logs();
                                           l.updateLog(String.valueOf(cCode), "Additional Details", "Updated Basic Details",ipAddress); 

                                            %> <script>alert ( "Update succesfull" );
                                            window.location='basicDetails.jsp';</script><%

                                            System.out.println("updated successfully");
                                        }
                                        else{
                                            %> <script>alert ( "Update failed" );
                                            window.location='basicDetails.jsp';</script><%

                                            out.println("no updation");  
                                        }                           
                            }
                           catch(Exception e){
                                %> <script>alert ( "Update failed :<%=e.getMessage()%> " );</script><%
                                //out.println(e.getMessage());       
                            }
                            
                    break;  
                      case "Submit Report" :
                    
                    String number=(String)request.getParameter("number");
                    String dDdate=(String)request.getParameter("date");
                    String report=(String)request.getParameter("report");
                    String aCcode=(String)request.getParameter("aCcode");
                   
                    //System.out.println(type+"\n"+course+"\n"+combination+"\n"+medium+"\n"+intake+"\n");
                    insertTableSQL = "INSERT INTO `cdc`.`defieciencyreports`(`cCode`,`reportNo`,`date`,`report`)VALUES(?,?,?,?);";

                    ps=con.prepareStatement(insertTableSQL);
                    

                    try {
                                    

                                                  ps.setString(1, aCcode);
                                                  ps.setString(2, number);
                                                  ps.setString(3, dDdate);
                                                  ps.setString(4, report);
                                                  
                                                  // execute insert SQL stetement
                                                  ps.executeUpdate();
                                                   logs l=new logs();
                                                    l.updateLog(String.valueOf(cCode), "courseDetails.jsp", "Deficiency report inserted",ipAddress); 
                                                  
                                                  System.out.println("Record is inserted into DBUSER table!");
                                                    %> <script>alert ( "Report Inserted." );
                                            window.location='admin/courseDetails.jsp';</script><%
                                    

                    } catch (Exception e) {
                                 %> <script>alert ( "Update failed :<%=e.getMessage()%>" );
                                            window.location='admin/courseDetails.jsp';</script><%
                               System.out.println(e.getMessage());

                    } finally {

                            if (ps != null) {
                                     ps.close();
                            }

                            if (con != null) {
                                     con.close();
                            }
                              
                           
                    }
                    break;   
                    case "delete" :
                    
                      String place=(String)request.getParameter("place");
                      int sno=Integer.parseInt(request.getParameter("sno"));

                      switch(place){

                        case "faculty":
                                try{
                                        Statement st = con.createStatement();
                                        st.executeUpdate("DELETE  FROM faculty WHERE sno="+sno);
                                        out.print("Deleted");
                                         logs l=new logs();
                                         l.updateLog(String.valueOf(cCode), "facultyDetails.jsp", "deleted Faculty Details",ipAddress); 
                                                 
                                        response.sendRedirect("facultyDetails.jsp");
                                    }catch(Exception e){
                                         out.print("Problem");
                                    }
                           break;
                        case "course":
                                try{
                                        Statement st = con.createStatement();
                                        st.executeUpdate("DELETE  FROM courses WHERE sno="+sno);
                                        out.print("Deleted");
                                        logs l=new logs();
                                        l.updateLog(String.valueOf(cCode), "courseDetails.jsp", "deleted course Details",ipAddress); 
                                        String to=(String)request.getParameter("to"); 
                                        if(to.equals("0"))
                                            response.sendRedirect("courseDetails.jsp");
                                        else if(to.equals("1"))
                                            response.sendRedirect("courseDetails1.jsp");
                                    }catch(Exception e){
                                         out.print("Problem");
                                    }
                           break;
                        case "document":
                                try{
                                        Statement st = con.createStatement();
                                        st.executeUpdate("DELETE  FROM documents WHERE id="+sno);
                                        out.print("Deleted");
                                        logs l=new logs();
                                        l.updateLog(String.valueOf(cCode), "documents.jsp", "deleted document ",ipAddress); 
                                        response.sendRedirect("Reports/uploadDocuments.jsp");
                                    }catch(Exception e){
                                         out.print("Problem");
                                    }
                           break;
                        case "cfd":
                                try{
                                        Statement st = con.createStatement();
                                        st.executeUpdate("DELETE  FROM cfd WHERE id="+sno);
                                        out.print("Deleted");
                                        logs l=new logs();
                                        l.updateLog(String.valueOf(cCode), "basicDetails.jsp", "deleted cfd ",ipAddress); 
                                        response.sendRedirect("basicDetails.jsp");
                                    }catch(Exception e){
                                         out.print("Problem");
                                    }
                           break;
                    }
                    break;
                        
                        
                  case "Update" :
                     out.print("1");
                     place=(String)request.getParameter("place");
                     sno=Integer.parseInt(request.getParameter("sno"));
                    
                  switch(place){
                    
                        case "faculty":
                                try{
                                    out.print("2");
                                        Statement st = con.createStatement();
                                        st.executeUpdate("DELETE  FROM faculty WHERE sno="+sno);
                                        out.print("Deleted");
                                         logs l=new logs();
                                         l.updateLog(String.valueOf(cCode), "facultyDetails.jsp", "deleted Faculty Details",ipAddress); 
                                                 
                                        response.sendRedirect("facultyDetails.jsp");
                                    }catch(Exception e){
                                         out.print("Problem");
                                    }
                           break;
                        case "course":
                                    out.print("3");
                                try{
                                        String option= request.getParameter("option");
                                         sno= Integer.parseInt(request.getParameter("sno"));
                                       // Statement st = con.createStatement();
                                         insertTableSQL = "UPDATE `cdc`.`courses` SET `cStatus` ='"+option+"' WHERE `sno` =?;";
                                     ps=con.prepareStatement(insertTableSQL);

                                                  ps.setInt(1, sno);
                                                  ps.executeUpdate();
                                                
                                        logs l=new logs();
                                        l.updateLog("ADMIN", "courseDetails.jsp", "UPDATED course Details sno="+sno,ipAddress); 
                                           %><Script>alert("dsa");</script><%
                                        response.sendRedirect("./admin/courseDetails.jsp");
                                    }catch(Exception e){
                                         out.print("Problem is"+e.getMessage());
                                    }
                           break;
                    }
                    break;
                    

                    case "masters" :
                                String ccode=(String)request.getParameter("ccode");
                                String csno=(String)request.getParameter("csno");
                                String cname=(String)request.getParameter("cname");
                                String cemail=(String)request.getParameter("cemail");
                                String admin=(String)session.getAttribute("Admin_Role");
                                try{
                                    out.print("2");
                                        Statement st = con.createStatement();
                                        String query="update cdc_college_details set ccode='"+ccode+"', cname='"+cname+"', cemail='"+cemail+"' where sno="+csno+";";
                                        System.out.println(query);
                                        st.executeUpdate(query);
                                        out.print("Deleted");
                                         logs l=new logs();
                                         l.updateLog(admin, "masters.jsp", "Updated masters",ipAddress); 
                                         String msg="Dear sir/madam,\nYour request for updation of email/colle code is successsfull.\nNow you can generate the password from the website.\nThanks and Regards.\nDean CDC,KU";
                                         mail_Senddd.sendMail(msg,"KKK",cemail); 
                                        %> <script>alert ( "Updated :");
                                            window.location='admin/masters.jsp';</script><%
                                        
                                    }catch(Exception e){
                                         out.print("Problem");
                                    }
                         



                    break;
            }
        %>
        
    </body>
</html>
m