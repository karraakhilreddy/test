<%-- 
    Document   : notifDownload
    Created on : Jan 29, 2019, 8:35:17 PM
    Author     : akhil
--%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            
               int BUFFER_SIZE = 4096;
            int uploadId = Integer.parseInt(request.getParameter("id"));
         
        Connection conn = null; // connection to the database
         String from=request.getParameter("from");
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = Database.getConnection();
 
            // queries the database
            String sql = "SELECT pdf FROM "+from+" WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, uploadId);
 
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                // gets file name and file blob data
                String fileName = "test.pdf";//result.getString("pdf");
                Blob blob = result.getBlob("pdf");
                InputStream inputStream = blob.getBinaryStream();
                int fileLength = inputStream.available();
                 
                System.out.println("fileLength = " + fileLength);
 
                ServletContext context = getServletContext();
 
                // sets MIME type for the file download
                String mimeType = context.getMimeType(fileName);
                if (mimeType == null) {        
                    mimeType = "application/PDF";
                }              
                 
                // set content properties and header attributes for the response
                response.setContentType(mimeType);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("inline; filename=\"%s\"", fileName);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close();             
            } else {
                // no file found
                response.getWriter().print("File not found for the id: " + uploadId);  
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            response.getWriter().print("IO Error: " + ex.getMessage());
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }          
        }
            %>
    </body>
</html>
