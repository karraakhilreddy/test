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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Payment Verification report!</h1>
        <%
                    String encStatusData=request.getParameter("encStatusData");//"7OuNG4OlchGQjNFa6cbaTH6jz4rKiRqweXSiTK0gBwBcByVP0Is222w+xPJXrnbkY/p5WA2TFPR7wl9K60cobi/7iqtma/gf42Okz3eiClxO29uMaMPMq8llV50drYvY4+I2LG6CdUkdMh/6T+NipOVH3as172QI6n8IjUSF/DiAuO/mh35uOy++dxu1HHa11/DNK95tdIKIf6MyW0zrWzgQAI54GVlqjlpZCxWSOeiK8EZsRDtw/JBgxIZE3r5qxW0UhEsXig8oMhnp9PEOhToNjSmZWLrmMdbnPWVWTPs="; //(String)request.getParameter("encData");
                    String    Key="fBc5628ybRQf88f/aqDUOQ==";
                    System.out.print(encStatusData);
                    System.out.print("<br>");
                    String   EncryptTrans = AES128Bit.decrypt(encStatusData, Key);
                    String[] data=EncryptTrans.split(Pattern.quote("|"));
                    for(int i=0;i<15;i++){
                        out.println(data[i]);
                        out.print("<br>");
                    }
                    
        %>
    </body>
</html>
