<%-- 
    Document   : testform
    Created on : 3 Oct, 2018, 12:35:43 PM
    Author     : akhil
--%>

<%@page import="java.util.Arrays"%>
<%@page import="com.mysql.cj.util.StringUtils"%>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KU</title>
    </head>
    <body>
        <% 
            int cCode=(int)session.getAttribute("cCode");
            
            String name=(String)request.getParameter("name");
            
            Connection con=Database.getConnection();
            PreparedStatement ps;
            
            switch(name){
                case "faculty" :
                    int row=Integer.parseInt(request.getParameter("rows"));
                    String array=(String)request.getParameter("array");
                    String data[]=array.split(",");
                    
                    out.println(data);
                     
                     String insertTableSQL = "INSERT INTO `cdc`.`faculty` (`cCode`, `tName`, `tType`, `tDesignation`, `tQualification`, `tDate`, `tNature`, `tModeApp`, `tScale`, `tModePay`,`tBank`, `tPan`, `tAadhar`, `tMobile`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                     ps=con.prepareStatement(insertTableSQL);
                                    
                      

                    try {
                                    for(int i=0;i<row;i++)
                                    {

                                                  ps.setInt(1, cCode);
                                                  ps.setString(2, data[(i*12)+0+i]);
                                                  ps.setString(3, data[(i*12)+1+i]);
                                                  ps.setString(4, data[(i*12)+2+i]);
                                                  ps.setString(5, data[(i*12)+3+i]);
                                                  ps.setString(6, data[(i*12)+4+i]);
                                                  ps.setString(7, data[(i*12)+5+i]);
                                                  ps.setString(8, data[(i*12)+6+i]);
                                                  ps.setString(9, data[(i*12)+7+i]);
                                                  ps.setString(10, data[(i*12)+8+i]);
                                                  ps.setString(11, data[(i*12)+9+i]);
                                                  ps.setString(12, data[(i*12)+10+i]);
                                                  ps.setString(13, data[(i*12)+11+i]);
                                                  ps.setString(14, data[(i*12)+12+i]);
                                                  
                                                 
                                                 

                                                  // execute insert SQL stetement
                                                  ps.executeUpdate();

                                                  System.out.println("Record is inserted into DBUSER table!");
                                    }

                    } catch (Exception e) {

                               System.out.println(e.getMessage());

                    } finally {

                            if (ps != null) {
                                     ps.close();
                            }

                            if (con != null) {
                                     con.close();
                            }
                            response.sendRedirect("facultyDetails.jsp");
                    }
                    break;
                    case "course" :
                    
                    String type=(String)request.getParameter("type");
                    String course=(String)request.getParameter("course");
                    String combination=(String)request.getParameter("combination");
                    String medium=(String)request.getParameter("medium");
                    String intake=(String)request.getParameter("intake");
                    System.out.println(type+"\n"+course+"\n"+combination+"\n"+medium+"\n"+intake+"\n");
                    insertTableSQL = "INSERT INTO `cdc`.`courses` (`cCode`, `cType`, `cCourse`, `cCombination`, `cMedium`, `cIntakeSanctioned`, `cStudentsAdmitted`, `cStatus`) VALUES (?, ?, ?, ?, ?, ?, ?, ? )";

                    ps=con.prepareStatement(insertTableSQL);
                    

                    try {
                                    

                                                  ps.setInt  (1, cCode);
                                                  ps.setString(2, type);
                                                  ps.setString(3, course);
                                                  ps.setString(4, combination);
                                                  ps.setString(5, medium);
                                                  ps.setString(6, intake);
                                                  ps.setString(7, "0");
                                                  ps.setString(8, "Inspection fee pending");
                                                 
                                                 
                                                 
                                                 

                                                  // execute insert SQL stetement
                                                  ps.executeUpdate();

                                                  System.out.println("Record is inserted into DBUSER table!");
                                    

                    } catch (Exception e) {

                               System.out.println(e.getMessage());

                    } finally {

                            if (ps != null) {
                                     ps.close();
                            }

                            if (con != null) {
                                     con.close();
                            }
                              response.sendRedirect("courseDetails.jsp");
                           
                    }
                    break;
                    case "basicDetails" :
                    
                    try{
                        int sno=0;
                        String query="select sno from cdc_college_details where cCode='"+cCode+"';";


                        Connection conn=Database.getConnection();
                        Statement stmt=conn.createStatement();
                        ResultSet rs=stmt.executeQuery(query);
                        if(rs.next())
                          sno=rs.getInt("sno");



                            String cName=request.getParameter("cName");
                            String cAddress=request.getParameter("cAddress");
                            String typeOfCollege=request.getParameter("typeOfCollege");
                            String sName = request.getParameter("sName");
                            String sAddress = request.getParameter("sAddress");
                            int sPostalAddress=Integer.parseInt(request.getParameter("sPostalAddress"));
                            String sRegNo= request.getParameter("sRegNo");
                            String sYear = request.getParameter("sYear");
                            String cEstd =request.getParameter("cEstd");
                            String secName = request.getParameter("secName");
                            String secPhNo = request.getParameter("secPhNo");
                            String cPrincipal = request.getParameter("cPrincipal");
                            String cPPhNo = request.getParameter("cPPhNo");

                            int cExperiencePrincipal =Integer.parseInt( request.getParameter("cExperiencePrincipal"));
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
                           //String pQualification = request.getParameter("pQualification");
                            //tring pDateOfAppointment= request.getParameter("pDateOfAppointment");
                            //String appointmentNature= request.getParameter("appointmentNature");
                            //String appointmentMode= request.getParameter("appointmentMode");
                           // int pSalary = Integer.parseInt(request.getParameter("pSalary"));
                           // String paymentMode= request.getParameter("paymentMode");
                           // int pBankAccNo= Integer.parseInt(request.getParameter("pBankAccNo"));
                           // String pPANNo= request.getParameter("pPANNo");
                            //int pAadharNo= Integer.parseInt(request.getParameter("pAadharNo"));
                            //int pExperience= Integer.parseInt(request.getParameter("pExperience"));
                            String CFDNo=request.getParameter("CFDNo");
                            String CFDDate= request.getParameter("CFDDate");
                            int CFDAmount= Integer.parseInt(request.getParameter("CFDAmount"));
                            String CFDIssuingBank= request.getParameter("CFDIssuingBank");
                            String CFDMaturitydate = request.getParameter("CFDMaturitydate");
                            String CFDRenewalDate= request.getParameter("CFDRenewalDate");
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
                            String nLibrarian= request.getParameter("nLibrarian");
                            int noBooks=Integer.parseInt( request.getParameter("noBooks"));
                            int noJournels=Integer.parseInt( request.getParameter("noJournels"));
                            int noPeriodicals= Integer.parseInt(request.getParameter("noPeriodicals"));
                            int noTeachingStaff=Integer.parseInt( request.getParameter("noTeachingStaff"));
                            int noNonTeachingStaff=Integer.parseInt( request.getParameter("noNonTeachingStaff"));
                            String uQuery="update cdc_college_details set cAddress = ?,typeOfCollege=?,sName=?,sAddress=?,sPostalAddress=?,sregNo=?,sYear=?,"+
                                    "cEstd=?,secName=?,secPhno=?,cPrincipal=?,CPPhNo=?,CExperiencePrincipal=?,lLessor=?,lLessee=?,lPeriod=?,lSurveyNo=?,lRegNo=?,"+
                                    "lRegDate=?,landSurveyNumber=?,landDocNo=?,landRegDate=?,valRegSociety = ?,valSecMem=?,valSocietyMem=?,valSingleBit=?,valLandCert=?,"+
                                    "grantPermission=?, mapApproval=?, mapArea=?, valPlayGround=?,valParkingArea=?,valDrinkingWater=?,valFireSafety=?, valSanitaryCert=?,"+
                                    "CFDNo=?, CFDDate=?, CFDIssuingBank=?, CFDMaturitydate=?, CFDRenewalDate=?, totalLand=?, bPlinthArea=?, priRoomArea=?, offRoomArea=?,"+
                                    "gamesRoomArea=?, lWaitingRoom=?, toiletsRoomArea=?, libraryArea=?, classSize=?, labSize=?, nLibrarian=?, noBooks=?, noJournels=?,"+
                                    "noPeriodicals=?,noTeachingStaff=?, noNonTeachingStaff=?, CFDAmount=?, staffRoomArea=? , noClassRooms=?,noLabRooms=?, valOwnBuilding=? where sno = ?;";
                             ps = conn.prepareStatement(uQuery);
                            ps.setString(1, cAddress);
                            ps.setString(2, typeOfCollege);
                            ps.setString(3,sName);
                            ps.setString(4,sAddress);
                            ps.setInt(5,sPostalAddress);
                            ps.setString(6,sRegNo);
                            ps.setString(7,sYear);
                            ps.setString(8,cEstd);
                            ps.setString(9,secName);
                            ps.setString(10,secPhNo);
                            ps.setString(11,cPrincipal);
                            ps.setString(12, cPPhNo);
                            ps.setInt(13,cExperiencePrincipal);
                            ps.setString(14,lLessor);
                            ps.setString(15,lLessee);
                            ps.setInt(16,lPeriod);
                            ps.setString(17,lSurveyNo);
                            ps.setString(18,lRegNo);
                            ps.setString(19,lRegDate);
                            ps.setString(20,landSurveyNumber);
                            ps.setString(21,landDocNo);
                            ps.setString(22,landRegDate);
                            ps.setString(23,valRegSociety);
                            ps.setString(24,valSecMem);
                            ps.setString(25,valSocietyMem);
                            ps.setString(26,valSingleBit);
                            ps.setString(27,valLandCert);
                            ps.setString(28,grantPermission);
                            ps.setString(29,mapApproval);
                            ps.setInt(30,mapArea);
                            ps.setString(31,valPlayGround);
                            ps.setString(32, valParkingArea);
                            ps.setString(33,valDrinkingWater);
                            ps.setString(34,valFireSafety);
                            ps.setString(35,valSanitaryCert);
                            ps.setString(36,CFDNo);
                            ps.setString(37,CFDDate);
                            ps.setString(38,CFDIssuingBank);
                            ps.setString(39,CFDMaturitydate);
                            ps.setString(40,CFDRenewalDate);
                            ps.setInt(41,totalLand);
                            ps.setInt(42,bPlinthArea);
                            ps.setInt(43,priRoomArea);
                            ps.setInt(44,offRoomArea);
                            ps.setInt(45,gamesRoomArea);
                            ps.setInt(46,lWaitingRoom);
                            ps.setInt(47,toiletsRoomArea);
                            ps.setInt(48,libraryArea);
                            ps.setInt(49,classSize);
                            ps.setInt(50,labSize);
                            ps.setString(51,nLibrarian);
                            ps.setInt(52,noBooks);
                            ps.setInt(53, noJournels);
                            ps.setInt(54,noPeriodicals);
                            ps.setInt(55,noTeachingStaff);
                            ps.setInt(56,noNonTeachingStaff);
                            ps.setInt(57,CFDAmount);
                            ps.setInt(58,staffRoomArea);
                            ps.setInt(59,noClassRooms);
                            ps.setInt(60,noLabRooms);
                            ps.setString(61,valOwnBuilding);
                            ps.setInt(62,sno);
                            int i=ps.executeUpdate();
                            if(i==1)
                            {
                                %> <script>alert ( "Update succesfull" );
                                window.location='basicDetails.jsp';</script><%

                                System.out.println("updated successfully");
                            }
                            else{
                                %> <script>alert ( "Update failed" );
                                window.location='basicDetails.jsp';</script><%

                                out.println("no updation");  
                            }                           
                    }catch(Exception e){
                        %> <script>alert ( "Update failed : " );</script><%
                        System.out.println(e.getMessage());       
                    } 
                    break;
            }
        %>
        
    </body>
</html>
