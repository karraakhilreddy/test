<%-- 
    Document   : doubleVerification
    Created on : Jan 8, 2019, 1:44:23 PM
    Author     : akhil
--%>

<%@page import="com.toml.dp.util.AES128Bit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%if(request.getParameter("merchantOrderID")==null){ %>
        <form>
            <input type="text" name="merchantOrderID">
            <input type="submit" name="" value="Check" >
        </form>
        <%}else if(request.getParameter("merchantOrderID")!=null){

                String merchantOrderID=request.getParameter("merchantOrderID");
                String requestparameter = "5877309384731|1000003|"+merchantOrderID+"|http://localhost:8084/test_1_1_1/doubleVerificationReport.jsp";

                String Key="fBc5628ybRQf88f/aqDUOQ==";
                String EncryptTrans = AES128Bit.encrypt(requestparameter, Key);
                String EncryptTrans2 = EncryptTrans.replaceAll("\n","");
           %>
            
            <form name="ecom" method="post" action="https://test.sbiepay.com/secure/AggMerchantStatusQueryAction">
                <p>Double verification for <%= request.getParameter("merchantOrderID")%></p>
                    <input type="hidden" name="encryptQuery" value="<%=EncryptTrans2 %>">
                    <input type="hidden" name="merchIdVal" value ="1000003"/>
                    <input type="hidden" name="aggIdVal" value ="SBIEPAY"/>
                    <input type="submit" name="submit" value="Submit">
            </form>
            
        
        <%}%>
        
    </body>
</html>
