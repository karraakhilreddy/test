
<!-- 
    Document   : testform
    Created on : 3 Oct, 2018, 12:35:43 PM
    Author     : akhil
-->
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
    <link rel="stylesheet" type="text/css" href="CSS/breakDown.css">
    
  
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

    <nav>
        <div class="navbuttons">
             <ul><button class="" onclick="window.open('aboutCDC.html');" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                
            
            </ul>
        </div>
       
    </nav>
   
    <div class="main">    
        <center>
    <div class="mainBackground">
        <div  style="background-color: #b9b992; width: 850px; align-content: center;">
            <h1>Notifications</h1>
            <table>
                <tr>
                    <td>S.No</td>
                    <td>Date</td>
                    <td>Notification</td>
                </tr>
              <%
                                try{
                                        int sno=1;
                                        String query="select * from notifications order by id desc;";
                                         Connection conn=Database.getConnection();
                                         Statement stmt=conn.createStatement();
                                         ResultSet rs=stmt.executeQuery(query);
                                          while(rs.next())
                                         {
                                           %>

                                                <tr>
                                                    <td><%=sno%></td>
                                                    <td><%= rs.getString("date")%></td>
                                                    <td><a href="notifDownload.jsp?id=<%= rs.getString("id")%>" style="text-decoration: none;"><%= rs.getString("Notification")%></a></td>
                                                    
                                                </tr>
                                          <%
                                              sno++;
                                         }
                                         %>
                                        </table>
                                        <%
                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
            %>
            
            <br><br><br><br><br><br><br>
        </div>
                <br><br><br><br><br><br><br>

    </div>
        </center>
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