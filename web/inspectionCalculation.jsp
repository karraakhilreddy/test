<%-- 
    Document   : inspectionCalculation
    Created on : Dec 12, 2018, 5:55:04 PM
    Author     : akhil
--%>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page import="cdc.feeCalculation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
          <td><h1><a href="basicDetails.jsp">1.</a></h1></td>
                          <td><h1><a href="facultyDetails.jsp">2.</a></h1></td>
                          <td><h1><a href="courseDetails.jsp">3.</a></h1></td>
                          <td><h1><a href="inspectionCalculation.jsp">4.</a></h1></td>
                          <td><h1><a href="affiliationCalculation.jsp">5.</a></h1></td>
                           <td><h1><a href="Reports/reports.jsp">6.</a></h1></td>
        </table>
         <table border="1">
             <p>Inspection fee to  be paid for the following</p> <br> 
            <tr>
                <td>Type</td>
                <td>Course</td>
                <td>Combination</td>
                <td>Medium</td>
                
               
                
            </tr>
            <%
                int cCode=(int)session.getAttribute("cCode");
            try
            {
           
            String query="select * from courses where cCode='"+cCode+"' and cStatus='Inspection fee pending' ORDER BY cType ASC;";
            Connection conn=Database.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {

            %>
                <tr>
                    <td><%=rs.getString("cType") %></td>
                    <td><%=rs.getString("cCourse") %></td>
                    <td><%=rs.getString("cCombination") %></td>
                    <td><%=rs.getString("cMedium") %></td>
                   
                    
                    
                    </tr>
                    <%

            }
            %>
            </table><br>
                <%
                rs.close();
                stmt.close();
                conn.close();
                }
            catch(Exception e)
            {
                e.printStackTrace();
                }

        
                 long amount=0;
                 feeCalculation is=new feeCalculation();
                 amount=is.InspectionCalculation(cCode);
                 out.print("is = " +amount);
                 System.out.print(amount);
        
        %>
        
    </body>
</html>
