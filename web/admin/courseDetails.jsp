<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page import="cdc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>

	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="../CSS/indexCSS.css">
</head>
<body >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div >
           <div ><img src="../IMG/1.png" height="150" width="150" align="left" hspace="80" ></div>
            <div ><img src="../IMG/2.png" height="150" width="200" align="right" hspace="80" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3> <spam>Warangal-506009,Telangana</spam></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
   
    
    <div>
        
        <% if(session.getAttribute("aCcode")==null)
                { 
                    response.sendRedirect("aWelcome.jsp");
                }else{
                       
                    String aCcode=(String)session.getAttribute("aCcode");
                %>
           <nav>
       
       
    </nav>
    
                     
<div onload="createTable()" class="main">    
        <center>
    <div class="mainBackground">
        <form action="courseDetails.jsp" method="post">
                    <input type="text" name="aCcode" value="<%=aCcode%>" hidden>
                    <input type="submit" name="submit" hidden>
                </form>
                <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = 'reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
                         
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
                
                     <% if(rs.getString("cStatus").equals("Inspection fee Paid")){ %>
                     <td><a href="../upload.jsp?place=course&&name=Update&&sno=<%=rs.getString("sno") %>&&option=Inspection success">Inspection success</a></td>
                     <td><a href="../upload.jsp?place=course&&name=Update&&sno=<%=rs.getString("sno") %>&&option=Inspection failed">Inspection failed</a></td>
                         
                        <% } else if(rs.getString("cStatus").equals("Affiliation fee Paid")){ %>
                            <td><a href="../upload.jsp?place=course&&name=Update&&sno=<%=rs.getString("sno") %>&&option=Affiliation success">Affiliation success</a></td>
                            <td><a href="../upload.jsp?place=course&&name=Update&&sno=<%=rs.getString("sno") %>&&option=Affiliation failed">Affiliation failed</a></td>
                     
                
                         <% } %>
                    </td>
                   
           
                      </tr>
                  
           <% } %>
            </table>
            
                   
            <br>
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
    
    
    
    </div></center>
        
        
    </div>
            
       
              
                  
            
                   
                
        
       
        <div class="footer">
  <div id="button"></div>
<div id="container">
<div id="cont">
<div class="footer_center">
    <div > 
<div class="left">Copyrights reserved by Kakatiya University</div>
<div class="right"><a href="developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>