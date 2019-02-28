<%-- 
    Document   : test
    Created on : Feb 28, 2019, 7:13:37 PM
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
        <%
                 String    Key="tvhkwlcVatJsWTBAAe9Ou9xS91EGFLcFuTZ/W4I3jH4=";
                 String    Key2="Fbi1P7Nc7R1Yd7mgVB7EYQ==";
            
            
                        String   EncryptTrans = AES128Bit.encrypt(Key2, Key);
                        System.out.println(EncryptTrans);
        %>
    </body>
</html>
