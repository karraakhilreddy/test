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
        
        
           <nav>
       
       
    </nav>
    
                     
<div onload="createTable()" class="main">    
        <center>
    <div class="mainBackground">
        
                <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button class="" onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button onclick="location.href = 'reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
        <form action="../upload.jsp" method="POST">
                <input type="text" name="csno" id="sno" hidden=""><br><br>
                College Code:<input type="text" name="ccode" id="ccode" width="200"><br><br>
               
                amount:<input type="text" name="iamount" id="iamount"><br><br>
                order no:<input type="text" name="iorderno" id="iorderno"><br><br>
                <input type="submit" name="name" value="masters"><br><br>
        </form>
        <div style="overflow-x: auto; width: 1000px; height: 400px" >
            <table id="table" border="1">
                
            <tr>
                <td>S.No</td>
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
                    <td><%=rs.getString("sno") %></td>
                    <td><%=rs.getString("cCode") %></td>
                    
                    <td><%=rs.getString("iorderno") %></td>
                    <td><%=rs.getString("iamount") %></td>
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
            
            <script>
    
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("sno").value = this.cells[0].innerHTML;
                         document.getElementById("ccode").value = this.cells[1].innerHTML;
                         document.getElementById("iorderno").value = this.cells[2].innerHTML;
                         document.getElementById("iamount").value = this.cells[3].innerHTML;
                    };
                }
    
         </script>
</body>
</html>