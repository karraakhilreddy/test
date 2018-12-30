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
<body style="background: black">
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="../IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="../IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h3 style="color:navyblue; font-family: Bookman Old Style; ">COLLEGE DEVELOPMENT COUNCIL</h3>
         <h1 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>KAKATIYA UNIVERSITY.</b></h1>
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
    
 <div class="main">    
        <center>
    <div class="mainBackground">
       
        <% if(session.getAttribute("aCcode")==null)
                { %>
                <form action="facultyDetails.jsp" method="post">
                    <input type="text" name="aCcode">
                    <input type="submit" name="submit">
                </form>
                <% }else{
                       request.setAttribute("aCcode", request.getParameter("aCcode"));
                    int aCcode=(int)session.getAttribute("aCcode");
                    session.setAttribute("aCcode",aCcode);
                %>
                <form action="facultyDetails.jsp" method="post">
                    <input type="text" name="aCcode" value="<%=aCcode%>">
                    <input type="submit" name="submit">
                </form>
<div onload="createTable()">
    
    <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'aindex.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = 'reports.jsp'">REPORTS</button></td>
                                 
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
       
              
                  
            
                   
                
        
       
        <footer>
            <p id="copyright"> Copyrights reserved by Kakatiya University&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="developers.jsp">Developers</a></p>
            
            
        </footer>
</body>
</html>