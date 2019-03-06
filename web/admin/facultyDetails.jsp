<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
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
    
    
 <div class="main">    
        <center>
    <div class="mainBackground">
       
        <% if(session.getAttribute("aCcode")==null)
                {
                     response.sendRedirect("aWelcome.jsp");
                }else{
                       request.setAttribute("aCcode", request.getParameter("aCcode"));
                    String aCcode=(String)session.getAttribute("aCcode");
                    session.setAttribute("aCcode",aCcode);
                %>
               
<div onload="createTable()">
    
    <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = 'reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
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
    
    
   
</div>
        
        
        
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
<div class="right"><a href="../developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>