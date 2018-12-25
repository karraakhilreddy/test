<%-- 
    Document   : reports
    Created on : Dec 22, 2018, 10:28:42 AM
    Author     : akhil
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@ page import="java.sql.*, java.io.*"%>
<%@page import="com.lowagie.text.*,com.lowagie.text.pdf.*"%>;

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table>
          <td><h1><a href="../basicDetails.jsp">1.</a></h1></td>
                          <td><h1><a href="../facultyDetails.jsp">2.</a></h1></td>
                          <td><h1><a href="../courseDetails.jsp">3.</a></h1></td>
                          <td><h1><a href="../inspectionCalculation.jsp">4.</a></h1></td>
                          <td><h1><a href="../affiliationCalculation.jsp">5.</a></h1></td>
                           <td><h1><a href="reports.jsp">6.</a></h1></td>
        </table>
        
        <form action="generateReportsPDF.jsp" method="post">
            <input type="submit" name="button" value="Basic">
            <input type="submit" name="button" value="Course">
            <input type="submit" name="button" value="Faculty">
        </form>
            
        
        
        
        
        
    </body>
</html>
