<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page import="cdc.feeCalculation"%>
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
   
    
     
            
    <div class="main">    
        <center>
    <div class="mainBackground">
        <!-- code -->
        <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'inspectionCalculation.jsp'">INSPECTION DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'affiliationCalculation.jsp'">AFFILIATION</button></td>
                                 <td><button onclick="location.href = 'Reports/reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
        
         <table border="1">
             <p>affiliation  fee to  be paid for the following</p> <br> 
            <tr>
                <td>Type</td>
                <td>Course</td>
                <td>Combination</td>
                <td>Intake sanctioned</td>
                <td>Medium</td>
                
               
                
            </tr>
            <%
                String cCode=(String)session.getAttribute("cCode");
            try
            {
           
            String query="select * from courses where cCode='"+cCode+"' and cstatus='Inspection Success'  ORDER BY cType ASC;";
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
                    <td><%=rs.getString("cIntakeSanctioned") %></td>
                    <td><%=rs.getString("cMedium") %></td>
                   
                    
                    
                    </tr>
                    <%

            }
            %>
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

        
                 long amount=0;
                 feeCalculation is=new feeCalculation();
                 amount=is.AffiliationCalculation(cCode);
                 out.print("is = " +amount);
                 System.out.print(amount);
        try{
                 String query="select aAmount,aDate,aOrderNo from cdc_college_details where cCode='"+cCode+"';";
                Connection conn=Database.getConnection();
                Statement stmt=conn.createStatement();
                 ResultSet rs=stmt.executeQuery(query);
                if(rs.next()){
                    if(rs.getInt("aAmount")==0){
                        %>
                            <form action="paymentGateway.jsp" method="POST">
                                    <input type="text" name="amount" value=<%= amount %> hidden>
                                    <input type="text" name="cCode" value=<%= cCode %> hidden>
                                    <input type="text" name="name" value="affiliation" hidden>
                                    <input type="submit" name="" value="Pay Now" >
                            </form>
                        <%
                    }else{
                            %>
                            <h3>Already Affiliation Fee Paid on date <%=rs.getDate("aDate")%> <br>with order number <%=rs.getString("aOrderNo")%>.</h3>
                        <%
                    }
                 }
         }catch(Exception e){
                System.out.println(e.getMessage());
         }
         
         %>
       
        
             <form action="doubleVerification.jsp" method="post">
                 <input type="submit" name="" value="Verify the payment" >
             </form>
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