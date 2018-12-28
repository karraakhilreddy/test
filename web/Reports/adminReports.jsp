<%-- 
    Document   : adminReports
    Created on : Dec 26, 2018, 12:52:13 PM
    Author     : akhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Reports</h1>
        <form action="generateReportsPDF.jsp" method="post">
        <table>
            <tr>
                <td>College</td>
                <td><input type="submit" name="button" value="adminCollege"></td>
            </tr>
            <tr>
                <td>College-course</td>
                <td><input type="submit" name="button" value="adminCollegeCourse"></td>
            </tr>
            <tr>
                <td>College-Amount</td>
                <td><input type="submit" name="button" value="adminCollegeAmount"></td>
            </tr>
            
        </table>
            </form>
    </body>
</html>
