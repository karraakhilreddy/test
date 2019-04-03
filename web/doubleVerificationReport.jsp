<%-- 
    Document   : doubleVerification
    Created on : Jan 8, 2019, 1:44:23 PM
    Author     : akhil
--%>

<%@page import="java.util.regex.Pattern"%>
<%@page import="com.toml.dp.util.AES128Bit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
    
       <meta charset="utf-8">
	<title>cdc</title>
    
    <link rel="stylesheet" type="text/css" href="CSS/breakDown.css">
    <link rel="stylesheet" type="text/css" href="CSS/Help.css">
    
  
    </head>
    <body style="background-color: white;">

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
    <center>
         <div class="main">    
            <center>
                <div class="mainBackground">
                    <nav class="nav2">
                        <table>
                             <tr>
                                 <td><button  onclick="location.href = 'basicDetails.jsp';">COLLEGE DETAILS</button></td>
                                 <td><button  onclick="location.href = 'facultyDetails.jsp'">FACULTY DETAILS</button></td>
                                 <td><button onclick="location.href = 'courseDetails.jsp'">COURSE DETAILS</button></td>
                                 <td><button class="active" onclick="location.href = 'inspectionCalculation.jsp'">INSPECTION DETAILS</button></td>
                                 <td><button onclick="location.href = 'affiliationCalculation.jsp'">AFFILIATION</button></td>
                                 <td><button onclick="location.href = 'Reports/reports.jsp'">REPORTS</button></td>
                                 <td><button onclick="location.href = 'logout.jsp'">LOGOUT</button></td>
                            </tr>
                        </table>
                    </nav>
        <h1>Payment Verification report!</h1>
        <%
            //
                    String encStatusData=request.getParameter("encStatusData");//"TSJwyBQ/NznHX3CMDwYMFAPX3JXTchDG0cZgI+dCGEGnsaukBIdRm/IqxhjUVn0BAcc8ufJ70NMcOYNtSIB/OKOb7ZDSry6/C1qygZdTquqY6HrQjo3exmv6vSZyEZY6SKW/LCH2TvUeJUBfMptt9p7Q/siY1mmBS6goM6C1mXV7IxnOehS7MUGEQZtDPLxyb12h5phVZa6FNCrS81EClxVbM31ImsYl9SbvqD+yZDAsYyBV8+T+sQ4eC7g29vni"; //(String)request.getParameter("encData");
                    String    Key1="tvhkwlcVatJsWTBAAe9Ou9xS91EGFLcFuTZ/W4I3jH4=";//key from panel
                    String    Key2="Fbi1P7Nc7R1Yd7mgVB7EYQ=="; // key from pdf
                    
            
                        String   Key = AES128Bit.decrypt(Key1, Key2);
                    System.out.print(encStatusData);
                    System.out.print("<br>");
                    String   EncryptTrans = AES128Bit.decrypt(encStatusData, Key);
                    String[] data=EncryptTrans.split(Pattern.quote("|"));
                    /*for(int i=0;i<15;i++){
                        out.println(data[i]);
                        out.print("<br>");
                    }*/
                    String feeFor="";
                    if(data[5].charAt(0)=='1'){
                        feeFor="Inspection";
                    }else if(data[5].charAt(0)==2){
                         feeFor="Affiliation";
                    }
                    %> 
                                            <table border="2">
                                               
                                                <tr>
                                                    <td>Fee of</td>
                                                    <td><%= feeFor %></td>
                                                </tr>
                                                <tr>
                                                    <td>SBIePay Reference ID</td>
                                                    <td><%= data[0] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Merchant order No</td>
                                                    <td><%= data[5]%></td>
                                                </tr>
                                                <tr>
                                                    <td>Reference ID</td>
                                                    <td><%= data[0] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Status</td>
                                                    <td><%=data[1] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Amount</td>
                                                    <td><%=data[6] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Paymode</td>
                                                    <td><%= data[11]%></td>
                                                </tr>
                                                <tr>
                                                    <td>Reason</td>
                                                    <td><%=data[7] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Bank Code</td>
                                                    <td><%=data[8] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Bank Reference No</td>
                                                    <td><%=data[9] %></td>
                                                </tr>
                                                <tr>
                                                    <td>Transaction Date</td>
                                                    <td><%=data[10] %></td>
                                                </tr>
                                                <tr>
                                                    <td>CIN</td>
                                                    <td><%=data[12] %></td>
                                                </tr>
                                                
                                            </table>
                    
        
   </center>
                                                    <% if(data[1].equals("SUCCESS")){%>
                                                <form action="doubleVerificationResponse.jsp" method="POST">
                                                    <input type="text" hidden="" name="encStatusData" value="<%= encStatusData %>">
                                                    <br>
                                                    <input type="submit">
                                                </form>
                                                    <%}%>
 
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
