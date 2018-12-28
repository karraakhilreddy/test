<%-- 
    Document   : loginac
    Created on : 14 Aug, 2018, 6:10:10 PM
    Author     : Harika Bale
--%>


<%@page import="javafx.scene.control.Alert"%>
<%@page import="javax.sound.midi.SysexMessage"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <%
            String button=request.getParameter("button");
            switch(button){
                
                case "login":
                                    try{
                                    Connection con= Database.getConnection();

                                    int cCode=Integer.parseInt(request.getParameter("cCode"));
                                    String password=request.getParameter("password");

                                    String insertTableSQL = "select cCode,cPassword from cdc_college_details where cCode=?;";

                                       PreparedStatement      ps=con.prepareStatement(insertTableSQL);


                                     //ps=con.prepareStatement("select cCode,password from cdc_college_details where cCode=?;");
                                    ps.setInt(1,cCode);


                                    ResultSet rs=ps.executeQuery();
                                    if(rs.next())
                                    {
                                        //out.println("welcome"+rs.getString(1));
                                        if(rs.getString("cPassword").equals(password)){
                                            session.setAttribute("cCode", cCode);
                                            response.sendRedirect("basicDetails.jsp");

                                        }else
                                            out.print("password doesnt match");

                                    }
                                    else
                                    {
                                        out.print("user doesnt exists");
                                    }
                                        //response.sendRedirect("loginPage.html");
                                    }catch(Exception e){
                                        System.out.print(e.getMessage());
                                    }
                                    break;
            
                    case "register" :  
                                        
                                        
                                        
                    try{
                        int tCCode=0;
                                        String query="select MAX(cCode) as cCode from cdc_college_details ";
                                         Connection conn=Database.getConnection();
                                         Statement stmt=conn.createStatement();
                                         ResultSet rs=stmt.executeQuery(query);
                                         if(rs.next())
                                         {
                                             tCCode = 1+ rs.getInt("cCode");
                                         }  
                        
                      
                      String cName=request.getParameter("cName");
                      String cEmail=request.getParameter("cEmail");
                      String cPPhNo=request.getParameter("cPhNo");
                      String password=request.getParameter("Pwd");
                      String pwdC=request.getParameter("pwdC"); 
                      if (password.equals(pwdC))
                      { 
                          query = "insert into cdc_college_details (cCode,cEmail,cName,cPassword,cPPhNo) values (?,?,?,?,?);";
                         PreparedStatement ps=conn.prepareStatement(query);
                         ps.setInt(1,tCCode);
                         ps.setString(2,cEmail);
                         ps.setString(3,cName);
                         ps.setString(4,password );
                         ps.setString(5,cPPhNo);
                         
                        int res = ps.executeUpdate();
                         if(res > 0)
                         {
                             
                         response.sendRedirect("loginPage.jsp"); 
                         }
                       else
                      {
                          out.print("unsuccess");
                          response.sendRedirect("register.jsp");
                      }  
                      }

                        }
                       catch (Exception e) {

                                                   out.println(e.getMessage());

                                        }
                    break;
            }
        %>
    </body>
</html>
