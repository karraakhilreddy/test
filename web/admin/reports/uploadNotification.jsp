<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CDC</title>
</head>
<body>
    <center>
        <h1>File Upload to Database Demo</h1>
        <%
                String message=request.getParameter("message");
                if(request.getParameter("message")!=null){
                    %>
                    <h1>Uploaded Successfully</h1>
        <%
                }
        %>
        
        <form method="post" action="../../uploadServlet" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>Notification</td>
                    <td><textarea rows="4" cols="50" name="firstName"></textarea>
                    </td>
                        
                </tr>
                <tr>
                    <td><lable hidden>Last Name: </lable></td>
                    <td><input type="text" name="lastName" size="50" value="CDC" hidden/></td>
                </tr>
                <tr>
                    <td>Portrait Photo: </td>
                    <td><input type="file" name="photo" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>