<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Dynamically Add Remove Table Rows in JavaScript</title>

    
</head>
<% if(session.getAttribute("aCcode")==null)
                { %>
                <form action="facultyDetails.jsp" method="post">
                    <input type="text" name="aCcode">
                    <input type="submit" name="submit">
                </form>
                <% }else{
                       request.setAttribute("aCcode", request.getParameter("aCcode"));
                    String aCcode=(String)session.getAttribute("aCcode");
                %>
                <form action="facultyDetails.jsp" method="post">
                    <input type="text" name="aCcode" value="<%=aCcode%>">
                    <input type="submit" name="submit">
                </form>
<body onload="createTable()">
    
    <table >
        <tr>
                             <td><h1><a href="aindex.jsp">1.</a></h1></td>
                          <td><h1><a href="facultyDetails.jsp">2.</a></h1></td>
                          <td><h1><a href="courseDetails.jsp">3.</a></h1></td>
                          <td><h1><a href="../Reports/reports.jsp">4.</a></h1></td>
                         
                          
                      
                      </tr>
    </table>
            <table border="1">
                
            <tr>
                <td>Name</td>
                <td>Type</td>
                <td>Designation</td>
                <td>Qualification</td>
                <td>Date of appointment</td>
                <td>Nature of appointment</td>
                <td>Mode of appointment</td>
                <td>Scale of pay</td>
                <td>Mode of pay</td>
                <td>Bank account Number</td>
                <td>PAN card Number</td>
                <td>Aadhar number</td>
                <td>Mobile Number</td>
                
            </tr>
            <%
              
            try
            {
           
            String query="select * from faculty where cCode='"+aCcode+"';";
            Connection conn=Database.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {

            %>
                <tr>
                    <td><%=rs.getString("tName") %></td>
                    <td><%=rs.getString("tType") %></td>
                    <td><%=rs.getString("tdesignation") %></td>
                    <td><%=rs.getString("tQualification") %></td>
                    <td><%=rs.getString("tDate") %></td>
                    <td><%=rs.getString("tnature") %></td>
                    <td><%=rs.getString("tModeApp") %></td>
                    <td><%=rs.getString("tScale") %></td>
                    <td><%=rs.getString("tModePay") %></td>
                    <td><%=rs.getString("tBank") %></td>
                    <td><%=rs.getString("tPAN") %></td>
                    <td><%=rs.getString("tAadhar") %></td>
                    <td><%=rs.getString("tMobile") %></td>
                    
                </tr>
                    <%

            }
            %>
                </table>
                <%
                rs.close();
                stmt.close();
                conn.close();
                }
            catch(Exception e)
            {
                e.printStackTrace();
                }


        }

            %>  
    
    
   
</body>

</html>