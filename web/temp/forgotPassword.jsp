<%-- 
    Document   : forgotPassword
    Created on : 28 Dec, 2018, 3:17:26 PM
    Author     : Harika Bale
--%>

<!DOCTYPE html>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.kk.fingerprint.action.mail_Senddd"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>password processing</title>
    </head>
    <body>
     <%  
          
          int cCode=567;//Integer.parseInt(request.getParameter("cCode"));
         // Connection con=Database.getConnection();
          //PreparedStatement ps=con.prepareStatement("select cEmail from cdc_college_details where cCode=?");
          //ps.setInt(1 ,cCode);
          //ResultSet rs=ps.executeQuery();
          //if(rs.next())
            // out.println( rs.getString("cEmail") );
          
     %>
     <%
          try{
                        //GenerateRandomString grs = new GenerateRandomString();   
                        //out.println(grs.randomAlphaNumeric());
                        mail_Senddd.sendMail("myMessage","KKK","akhil.reddyK99@gmail.com");

                        //StringUtils su=new StringUtils();
                        //out.println(su.generateRandomPassword());
     }catch(Exception e){
             out.println(e.getMessage());
             }
       %>  
    </body>
</html>

