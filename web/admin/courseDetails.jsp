<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page import="cdc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
</head>
<% if(session.getAttribute("aCcode")==null)
                { %>
                <form action="courseDetails.jsp" method="post">
                    <input type="text" name="aCcode">
                    <input type="submit" name="submit">
                </form>
                <% }else{
                       request.setAttribute("aCcode", request.getParameter("aCcode"));
                    String aCcode=(String)session.getAttribute("aCcode");
                %>
                <form action="courseDetails.jsp" method="post">
                    <input type="text" name="aCcode" value="<%=aCcode%>">
                    <input type="submit" name="submit">
                </form>
                     
<body onload="createTable()">
    
    <table>
                      <tr>
                          <td><h1><a href="aindex.jsp">1.</a></h1></td>
                          <td><h1><a href="facultyDetails.jsp">2.</a></h1></td>
                          <td><h1><a href="courseDetails.jsp">3.</a></h1></td>
                         
                      
                      </tr>
    </table>
            <table border="1">
                
            <tr>
                <td>Type</td>
                <td>Course</td>
                <td>Combination</td>
                <td>Medium</td>
                <td>Intake Sanctioned</td>
                <td>Status</td>
                <td>Update to</td>
                <td>Update </td>
               
                
            </tr>
            <%
                
            try
            {
           
            String query="select * from courses where cCode='"+aCcode+"' ORDER BY cType ASC;";
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
                    <td><%=rs.getString("cIntakeSanctioned") %></td>
                    <td><%=rs.getString("cStatus") %></td>
                    <td> <% if(rs.getString("cStatus").equals("Inspection fee pending")){ %>
                        <select>
                            <option value="Inspection success">Inspection success</option>
                            <option value="Inspection failed">Inspection failed</option>
                        </select> 
                        <% } else if(rs.getString("cStatus").equals("affiliation fee pending")){ %>
                        <select>
                            <option value="Affiliation success">Affiliation success</option>
                            <option value="Affiliation failed">Affiliation failed</option>
                        </select>  
                         <% } %>
                    </td>
                    <td><a href="update.jsp"><input type="button" name="cdc" value="done"></a></td>
                    
                    
                    </tr>
                   
           <% } %>
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

}


            %>  
    
    
    
</body>

</script>
</html>