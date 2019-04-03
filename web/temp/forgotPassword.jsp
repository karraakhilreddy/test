<%-- 
    Document   : forgotPassword
    Created on : 28 Dec, 2018, 3:17:26 PM
    Author     : Harika Bale
--%>

<%@page import="cdc.mail_Senddd"%>
<%@page import="cdc.GenerateRandomString"%>
<%@page import="cdc.Database"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>password processing</title>
    </head>
    <body>
     <%  
          
          String cCode=request.getParameter("cCode");
         Connection con=Database.getConnection();
          PreparedStatement ps=con.prepareStatement("select sno,cEmail from cdc_college_details where cCode=?");
          ps.setString(1 ,cCode);
          ResultSet rs=ps.executeQuery();
          try{
         if(rs.next())
         {  
               
                        String msg="College Login Details\n";
                        GenerateRandomString grs = new GenerateRandomString();
                        String newPassword="qwertyuiop";//grs.randomAlphaNumeric();
                        out.println(newPassword);
                        Statement stmt = con.createStatement();
                            String sql = "UPDATE cdc_college_details SET cPassword='"+newPassword+"' WHERE sno="+rs.getInt("sno");
                            stmt.executeUpdate(sql);
                            msg=msg+"College Code : "+cCode+"\nPassword : "+newPassword;
                        mail_Senddd.sendMail(msg,"KKK",rs.getString("cEmail"));
                        %> <script>
                                window.alert("Password sent to registered mail.");
                                window.location = "../login.jsp";
                            </script>
                            <%
              }          
            }catch(Exception e){
             System.out.println(e.getMessage());
             }
         
       %>  
    </body>
</html>

