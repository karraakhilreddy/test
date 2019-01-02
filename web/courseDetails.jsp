<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
</head>
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
<body style="background: black">
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
           <h3 style="color:navyblue; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h3>
          <h1 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h4><spam>Warangal-506 009,Telangana</spam></h4><h5><b>Ph: 9440163189. drchr18@yahoo.com</b></h5>
      </div>
      <a href="login.php">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>welcome to college development council</i></b></marquee></p></a>
  </div>
    
        <nav>
        <div class="navbuttons">
             <ul><button class="tablinks" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="active" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
            
     <div class="main">    
        <center>
    <div class="mainBackground">
        <!-- code -->
        <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = 'inspectionCalculation.jsp'">INSPECTION DETAILS</button></td>
                                 <td><button onclick="location.href = 'affiliationCalculation.jsp'">AFFILIATION</button></td>
                                 <td><button onclick="location.href = 'Reports/reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
        

    <form action=""  method="post">
         <center><h1>Add new Course</h1></center>
         <table border="1"> 
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
                <td>Action</td>
               
                
            </tr>
            <%
                String cCode=(String)session.getAttribute("cCode");
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
                    
                    <% if(rs.getString("cStatus").equals("Inspection fee pending"))
                            {  
                                
                                          if(rs.getString("cStatus").equals("Inspection fee pending")){
                                            String url="<td><a href=\"upload.jsp?name=delete&&place=course&&sno="+ rs.getInt("sno") +"\">Remove</a></td>";
                                            out.print(url);
                                }
                           }%>
                    
                    
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
    
    
    </div>  
        </center>
     </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        
        
    
    <script>
            
            function openCont(evt,contName){
              var i,tabcontent,tablinks;
                
              tabcontent=document.getElementsByClassName("tabcontent");
                for(i=0;i<tabcontent.length;i++){
                    tabcontent[i].style.display="none";
                }
                
                
                tablinks=document.getElementsByClassName("tablinks");
               for(i=0;i<tablinks.length;i++){
                    tablinks[i].className=tablinks[i].className.replace("active","");
                }
                document.getElementById(contName).style.display="block";
                evt.currentTarget.className +="active";
            }
            
        </script>
        <div>
            
            
            
        </div>
       
        <footer>
            <p id="copyright"> Copyrights reserved by Kakatiya University&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="developers.jsp">Developers</a></p>
            
            
        </footer>
</body>
</html>