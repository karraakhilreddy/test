<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page import="cdc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>

	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
</head>
<body >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div >
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="80" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="80" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3> <spam>Warangal-506009,Telangana</spam></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
   
    
    <div>
        
        
           <nav>
       
       
    </nav>
    
                     
<div onload="createTable()" class="main">    
        <center>
    <div class="mainBackground">
        
                <nav>
        <div class="navbuttons">
             <ul><button class="" onclick="window.location='indexCDC.jsp'" ><li>Notifications</li></button>
                 <button class="" onclick="window.location='aboutCDC.html'" ><li>About</li></button>
                <button class="active" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                
            
            </ul>
        </div>
       <h3>If you find any error, please fill the Request form <a href="temp/checkMail.html">HERE</a></h3>
    </nav>
        
        <div style="overflow-x: auto; width: 1000px; height: 400px" >
            
            <table id="table" border="1">
                
            <tr>
               
                <td>College Code</td>
                <td>College Name</td>
                <td>Email</td>
                
              </tr>
              
            <%
            
            try
            {
           
            String query="select * from cdc_college_details ORDER BY  ccode ASC;";
           
            Connection conn=Database.getConnection();
            Statement stmt=conn.createStatement();
            
            ResultSet rs=stmt.executeQuery(query);
            
            while(rs.next())
            {

            %>
          
                <tr>
                    <td><%=rs.getString("cCode") %></td>
                    <td><%=rs.getString("cName") %></td>
                    <td><%=rs.getString("cEmail") %></td>
                 </tr>
                  
           <% } %>
            </table>
         </div>   
                   
            <br>
               
    
    
    
    </div></center>
        
        
    </div>
       
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
                  
            
                   
                
            <br><br><br><br><br><br><br>
       
        <div class="footer">
  <div id="button"></div>
<div id="container">
<div id="cont">
<div class="footer_center">
    <div > 
<div class="left">Copyrights reserved by Kakatiya University</div>
<div class="right"><a href="../developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
            
             
</body>
</html>