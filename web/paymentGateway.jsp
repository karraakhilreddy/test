<%-- 
    Document   : paymentGateway
    Created on : Jan 2, 2019, 12:17:31 PM
    Author     : akhil
--%>

<%@page import="java.util.Random"%>
<%@page import="com.toml.dp.util.AES128Bit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="cdc.Database"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
                String place="";
                if(request.getParameter("name").equals("inspection")){
                    place="1";
                }else if(request.getParameter("name").equals("affiliation")){
                    place="2";
                }
                String cCode="567";//request.getParameter("cCode");
                long amount=200;//Long.parseLong(request.getParameter("amount"));
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
       </body>
</html>
