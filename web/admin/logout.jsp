<%-- 
    Document   : logout.jsp
    Created on : Jan 1, 2019, 6:23:51 PM
    Author     : akhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            session.invalidate(); 
            response.sendRedirect("aindex.jsp");
        %>
        <h1>Hello World!</h1>
    </body>
</html>
