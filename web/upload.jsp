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
            String cCode=(String)session.getAttribute("cCode");
            
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

                                                  ps.setString  (1, cCode);
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
                                    

                                                  ps.setString  (1, cCode);
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
                    
                    
            }
        %>
        
    </body>
</html>
