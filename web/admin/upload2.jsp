<%-- 
    Document   : upload2
    Created on : Mar 20, 2019, 4:09:52 PM
    Author     : akhil
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
        <% 
             Connection con=Database.getConnection();
            PreparedStatement ps;
          String ccode=(String)request.getParameter("ccode");
                                String csno=(String)request.getParameter("csno");
                                String cname=(String)request.getParameter("iorderno");
                                String cemail=(String)request.getParameter("iamount");
                                //String admin=(String)session.getAttribute("Admin_Role");
                                try{
                                   // out.print("2");
                                        Statement st = con.createStatement();
                                        String query="update cdc_college_details set iorderno='"+cname+"', iamount='"+cemail+"' where sno="+csno+";";
                                        System.out.println(query);
                                        st.executeUpdate(query);
                                        out.print("Deleted");
                                         logs l=new logs();
                                         
                                        %> <script>alert ( "Updated :");</script><%
                                        
                                    }catch(Exception e){
                                         out.print("Problem");
                                    }
                         



        %>
    </body>
</html>
