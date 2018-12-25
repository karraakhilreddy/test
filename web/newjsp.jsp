<%-- 
    Document   : newjsp
    Created on : Dec 22, 2018, 5:31:06 PM
    Author     : akhil
--%>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="post">
            <select name="type" id="type" onchange="this.form.submit()"> 
                            <option value="0">select type</option>
                           <%
                                try{
                                        String query="select distinct Type from course_structure order by Type asc;";
                                         Connection conn=Database.getConnection();
                                         Statement stmt=conn.createStatement();
                                         ResultSet rs=stmt.executeQuery(query);
                                         while(rs.next())
                                         {
                                             %><option value="<%= rs.getString("Type") %>"
                                             <% 
                                                    if(request.getParameter("type")!=null){
                                                        if(rs.getString("Type").equals(request.getParameter("type"))){
                                                            out.print("selected");
                                                        }
                                                    }
                                             
                                             %>        
                                             ><%= rs.getString("Type") %></option><%
                                         }

                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
                           %>
                          </select> 
                          <select name="course" id="course" onchange="this.form.submit()">
                              <option value="0">select course</option>
                              <%
                                try{
                                        String query="select distinct Course from course_structure where Type=? order by Course asc";
                                         Connection conn=Database.getConnection();
                                         PreparedStatement stmt=conn.prepareStatement(query);
                                         stmt.setString(1, request.getParameter("type"));
                                         ResultSet rs=stmt.executeQuery();
                                         while(rs.next())
                                         {
                                             %><option value="<%= rs.getString("Course") %>"
                                                     <% 
                                                    if(request.getParameter("course")!=null){
                                                        if(rs.getString("Course").equals(request.getParameter("course"))){
                                                            out.print("selected");
                                                        }
                                                    }
                                             
                                             %>  
                                             ><%= rs.getString("Course") %></option><%
                                         }

                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
                           %>
                          </select>
                          <select name="combination" id="combination" onchange="this.form.submit()">
                              <option value="0">select course</option>
                              <%
                                try{
                                        String query="select distinct Combination from course_structure where Type=? and Course=? order by Combination ASC";
                                         Connection conn=Database.getConnection();
                                         PreparedStatement stmt=conn.prepareStatement(query);
                                         stmt.setString(1, request.getParameter("type"));
                                         stmt.setString(2, request.getParameter("course"));
                                         ResultSet rs=stmt.executeQuery();
                                         while(rs.next())
                                         {
                                             %><option value="<%= rs.getString("Combination") %>"
                                                     <% 
                                                    if(request.getParameter("combination")!=null){
                                                        if(rs.getString("Combination").equals(request.getParameter("combination"))){
                                                            out.print("selected");
                                                        }
                                                    }
                                             
                                             %>  
                                             ><%= rs.getString("Combination") %></option><%
                                         }

                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
                           %>
                          </select>
                          <select name="medium" id="medium" onchange="this.form.submit()">
                              <option value="0">select course</option>
                              <%
                                try{
                                        String query="select distinct medium from course_structure where Type=? and Course=? and Combination=? order by medium ASC";
                                         Connection conn=Database.getConnection();
                                         PreparedStatement stmt=conn.prepareStatement(query);
                                         stmt.setString(1, request.getParameter("type"));
                                         stmt.setString(2, request.getParameter("course"));
                                         stmt.setString(3, request.getParameter("combination"));
                                         ResultSet rs=stmt.executeQuery();
                                         while(rs.next())
                                         {
                                             %><option value="<%= rs.getString("medium") %>"
                                                     <% 
                                                    if(request.getParameter("medium")!=null){
                                                        if(rs.getString("medium").equals(request.getParameter("medium"))){
                                                            out.print("selected");
                                                        }
                                                    }
                                             
                                             %>  
                                             ><%= rs.getString("medium") %></option><%
                                         }

                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
                           %>
                          </select>
                          <input type="number" name="intake" value="0">
        </form>
    </body>
</html>
