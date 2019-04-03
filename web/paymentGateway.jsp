<%-- 
    Document   : paymentGatewayResponse
    Created on : Jan 4, 2019, 10:21:37 AM
    Author     : akhil
--%>
<%@page import="com.toml.dp.util.AES128Bit"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">
</head>
<body >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;" >Online Services</h2>
          <h1 style="color:black; text-shadow: 2px 2px 50px orange; font-family: Bookman Old Style;"><b>KAKATIYA UNIVERSITY</b></h1>
          <h4>Warangal,506009</h4>

      </div>
      <a href="login.php">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
             <ul>
                <button class="tablinks" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="active" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    
    <div>
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
                    <% 
                        if(session.getAttribute("userId")==null){
                                    response.sendRedirect("login.jsp");
                                }
                String place="";
                if(request.getParameter("name").equals("inspection")){
                    place="1";
                }else if(request.getParameter("name").equals("affiliation")){
                    place="2";
                }
                String cCode=request.getParameter("cCode");
                long amount=Long.parseLong(request.getParameter("amount"));
                String randomNo="KUA";
                int random = (int )(Math.random() * 998 + 1);
                randomNo=place+cCode+randomNo+random;
                out.print(randomNo);
                    
                    
                    String name=request.getParameter("name");
                    String  requestparameter = "1000629|DOM|IN|INR|"+amount+"|Other|https://cdc-aa.kakatiya.ac.in/paymentGatewayResponse.jsp|https://cdc-aa.kakatiya.ac.in/paymentGatewayFailureResponse.jsp|SBIEPAY|"+randomNo+"|2|NB|ONLINE|ONLINE";
                    
                    //String    Key="fBc5628ybRQf88f/aqDUOQ==";
                    
                    String    Key1="tvhkwlcVatJsWTBAAe9Ou9xS91EGFLcFuTZ/W4I3jH4=";//key from panel
                    String    Key2="Fbi1P7Nc7R1Yd7mgVB7EYQ=="; // key from pdf
                    //Hz72KWhj0LW9Mc/W9Rq1tA==
                    //Hz72KWhj0LW9Mc/W9Rq1tA==
            
                        String   Key = AES128Bit.decrypt(Key1, Key2);
            
                        String   EncryptTrans = AES128Bit.encrypt(requestparameter, Key);
                        
                           // String MultiAccountInstructionDtls="200|INR|POST";
                           // String   EncryptTrans2 = AES128Bit.encrypt(MultiAccountInstructionDtls, Key);
                        //String   EncryptbillingDetails = AES128EnDc.encrypt(billingDtls, Key);
                        //String   EncryptshippingDetais = AES128EnDc.encrypt(shippingDtls, Key);
                        //String   EncryptpaymentDetails = AES128EnDc.encrypt(PaymentDtls, Key);
                            EncryptTrans = EncryptTrans.replaceAll("\n","");
                         //   EncryptTrans2 = EncryptTrans2.replaceAll("\n","");
                         //   EncryptbillingDetails = EncryptbillingDetails.replaceAll("\n","");
                         // EncryptshippingDetais = EncryptshippingDetais.replaceAll("\n","");
                         //  EncryptpaymentDetails = EncryptpaymentDetails.replaceAll("\n","");


                      %>
                <h1>Hello World!</h1>
                <table border="1">
                    <tr>
                        <td>College code</td>
                        <td><%=cCode %></td>
                    </tr>
                    <tr>
                        <td>Amount to be paid</td>
                        <td><%=amount %></td>
                    </tr>
                </table>
                <form name="ecom" method="post" action="https://www.sbiepay.com/secure/AggregatorHostedListener">
                        <input type="hidden" name="EncryptTrans" value="<%= EncryptTrans %>">
                        
                       <!-- <input type="text" name="MultiAccountInstructionDtls" value="//= EncryptTrans2 %>" hidden> -->
                        <input type="hidden" name="merchIdVal" value ="1000629"/>
                        <input type="submit" name="submit" value="Submit"> 
                </form>
        
                    
                </div>
            </center>
        </div>
        
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