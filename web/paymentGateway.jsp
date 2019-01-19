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
<body style="background: black">
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;" >Online Services</h2>
          <h1 style="color:black; text-shadow: 2px 2px 50px orange; font-family: Bookman Old Style;"><b>KAKATIYA UNIVERSITY</b></h1>
          <h4>Warangal,506009</h4>

      </div>
      <a href="login.php">
       <p style="color:black; border-style: white; text-align: center; background-color: deepskyblue;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To Online Services-Kakatiya University</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
             <ul>
                <button class="active" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='login.jsp'"><li>College Login</li></button>
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
                String place="";
                if(request.getParameter("name").equals("inspection")){
                    place="1";
                }else if(request.getParameter("name").equals("affiliation")){
                    place="2";
                }
                String cCode=request.getParameter("cCode");
                long amount=Long.parseLong(request.getParameter("amount"));
                String randomNo="KKU";
                int random = (int )(Math.random() * 998 + 1);
                randomNo=place+cCode+randomNo+random;
                out.print(randomNo);
                    
                    
                    String name=request.getParameter("name");
                    String  requestparameter = "1000003|DOM|IN|INR|"+amount+"|Other|http://localhost:8084/test_1_1_1/paymentGatewayResponse.jsp|https://test.sbiepay.com/secure/fail3.jsp|SBIEPAY|"+randomNo+"|2|NB|ONLINE|ONLINE";
                    //http://162.241.200.162:8080/test_1_1_1/paymentGatewayResponse.jsp
                    //String billingDtls= cCode+"|Telangana|Warangal|506002|"+name+"|+91|222|1234567|9892456281|biller@gmail.com|N";
                    //String shippingDtls="ShipperName|Mayuresh Enclave, Sector 20, Plat A-211, Nerul west,Navi-Mumbai,403706|Mumbai|Maharastra|India|403706|+91|222|30988373|9812345678|N";
      
                    String    Key="fBc5628ybRQf88f/aqDUOQ==";
            
            
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
                <form name="ecom" method="post" action="https://test.sbiepay.com/secure/AggregatorHostedListener">
                        <input type="hidden" name="EncryptTrans" value="<%= EncryptTrans %>">
                        
                       <!-- <input type="text" name="MultiAccountInstructionDtls" value="//= EncryptTrans2 %>" hidden> -->
                        <input type="hidden" name="merchIdVal" value ="1000003"/>
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