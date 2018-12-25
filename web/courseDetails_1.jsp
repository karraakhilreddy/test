<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page import="cdc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Dynamically Add Remove Table Rows in JavaScript</title>

    <style>
        table 
        {
            width: 70%;
            font: 17px Calibri;
        }
        table, th, td 
        {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
    </style>
    <script>
function myFunction() {
   var type=document.getElementById("type").value;
   var course=document.getElementById("course").value;
   var combination=document.getElementById("combination").value;
   var medium=document.getElementById("medium").value;
   var intake=document.getElementById("intake").value;
   //alert(type+"\n"+course+"\n"+combination+"\n"+medium+"\n"+intake);
   var str="upload.jsp?name=course&type="+type+"&course="+course+"&combination="+combination+"&medium="+medium+"&intake="+intake;
   window.location.replace(str);
   
}
</script>
</head>
<body >
    
    <table>
                      <tr>
                          <td><h1><a href="basicDetails.jsp">1.</a></h1></td>
                          <td><h1><a href="facultyDetails.jsp">2.</a></h1></td>
                          <td><h1><a href="courseDetails.jsp">3.</a></h1></td>
                          <td><h1><a href="inspectionCalculation.jsp">4.</a></h1></td>
                          <td><h1><a href="affiliationCalculation.jsp">5.</a></h1></td>
                       <td><h1><a href="Reports/reports.jsp">6.</a></h1></td>
                      </tr>
    </table>

    <form action=""  method="post">
         <center><h1>Add new Course</h1></center>
         <table> 
             <tr>
                 <td>Type</td>
                 <td>Course</td>
                 <td>Combination</td>
                 <td>Medium</td>
                 <td>Intake sanctioned</td>
                 <td>Action</td>
             </tr>
             <tr>
                 <td> <select name="type" id="type" onchange="this.form.submit()"> 
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
                 </td>
                     <td>
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
                     </td>
                     <td>
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
                     </td>
                     <td>
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
                                         session.setAttribute("tType", request.getParameter("type"));
                                         session.setAttribute("tcourse", request.getParameter("course"));
                                         session.setAttribute("tcombination", request.getParameter("combination"));
                                         session.setAttribute("tmedium", request.getParameter("medium"));
                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
                           %>
                          </select>
                     </td>
                     <td>
                          <input type="number" name="intake" id="intake" >
                          
                     </td>
                      <td>
                          <input type="button"  onclick="myFunction()">
                         
                     </td>
                     
             </tr>
         </table>
         </form>
                          
                         
    </form>
        
    
                          <br><br>
                          <center><h1>Existing Course</h1></center>
                          
            <table border="1">
                
            <tr>
                <td>Type</td>
                <td>Course</td>
                <td>Combination</td>
                <td>Medium</td>
                <td>Intake Sanctioned</td>
                <td>Status</td>
               
                
            </tr>
            <%
                String cCode="567";//(String)session.getAttribute("cCode");
            try
            {
           
            String query="select * from courses where cCode='"+cCode+"' ORDER BY cType ASC;";
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




            %>  
    
    
    
    
    
</body>


</html>