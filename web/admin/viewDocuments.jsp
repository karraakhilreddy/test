<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="cdc.Database"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="../CSS/indexCSS.css">
       <style>
         table, th, td{
    
    
    align-content: center;
     padding: 10px;
  text-align: left;
  
  
    
}
table {
  border-collapse: collapse;
  
  background-color:white;
  color:black;
  
}
tr:hover 
{
    background-color:deepskyblue;
    color: white ;
}

th{
    font-weight: 900;
}
a{
    text-decoration: none;
}

     </style>
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
        
        <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
        
                    <h1>Uploaded files</h1>
            
            <br> <br>
            <table style="background-color: lightgray;">
                <tr>
                    <td>S.No</td>
                    <td>Date</td>
                    <td>Document</td>
                    
                </tr>
              <%
                                String cCode=(String)session.getAttribute("aCcode");
                                try{
                                        int sno=1;
                                        String query="select * from documents where cCode='"+cCode+"' order by id desc;";
                                         Connection conn=Database.getConnection();
                                         Statement stmt=conn.createStatement();
                                         ResultSet rs=stmt.executeQuery(query);
                                          while(rs.next())
                                         {
                                           %>

                                                <tr>
                                                    <td><%=sno%></td>
                                                    <td><%= rs.getString("date")%></td>
                                                    <td><a href="../notifDownload.jsp?from=documents&&id=<%= rs.getString("id")%>" target="_blank" style="text-decoration: none;"><%= rs.getString("Document")%></a></td>
                                                    
                                                </tr>
                                          <%
                                              sno++;
                                         }
                                         %>
                                        </table>
                                        <br>
                                        
                                        <%
                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
            %>
            
            <br><br><br><br><br><br><br>
        </div>
  
                 
</div>
<br><br><br><br>
                        


    
               </center>

            
        
        
        
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