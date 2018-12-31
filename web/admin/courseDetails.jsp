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
<body style="background: black">
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="../IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="../IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
           <h3 style="color:navyblue; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h3>
          <h1 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h4><spam>Warangal-506 009,Telangana</spam></h4><h5><b>Ph: 9440163189. drchr18@yahoo.com</b></h5>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>welcome to college development council</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
              <ul>
                <button class="tablinks" onclick="window.location='../home.jsp'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='../login.jsp'"><li>College Login</li></button>
                <button class="active" onclick="window.location='../admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='../dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='../help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
    <div>
        
        <% if(session.getAttribute("aCcode")==null)
                { %>
                <form action="courseDetails.jsp" method="post">
                    <input type="text" name="aCcode">
                    <input type="submit" name="submit">
                </form>
                <% }else{
                       request.setAttribute("aCcode", request.getParameter("aCcode"));
                    int aCcode=(int)session.getAttribute("aCcode");
                %>
                
                     
<div onload="createTable()" class="main">    
        <center>
    <div class="mainBackground">
        <form action="courseDetails.jsp" method="post">
                    <input type="text" name="aCcode" value="<%=aCcode%>">
                    <input type="submit" name="submit">
                </form>
                <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'aindex.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = 'reports.jsp'">REPORTS</button></td>
                                 
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
    
    
    
    </div></center>
        
        
    </div>
            
       
              
                  
            
                   
                
        
       
        <footer>
            <p id="copyright"> Copyrights reserved by Kakatiya University&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="developers.jsp">Developers</a></p>
            
            
        </footer>
</body>
</html>