import cdc.Database;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sun.security.pkcs11.wrapper.Functions;
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     
    // database connection settings
    
     
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String fileType = request.getParameter("fileType");
        java.util.Date dt = new java.util.Date();

        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");

        String currentTime = sdf.format(dt);
            
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        
        switch(fileType){
            case "Notification" :
                    
                            try {
                                    // connects to the database
                                    //DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                                    conn = Database.getConnection();

                                    // constructs SQL statement
                                    String sql = "INSERT INTO `cdc`.`notifications`(`Notification`,`of`,`pdf`,`date`)VALUES(?,?,?,?);";
                                    PreparedStatement statement = conn.prepareStatement(sql);
                                    statement.setString(1, firstName);
                                    statement.setString(2, lastName);
                                    statement.setString(4, currentTime);

                                    if (inputStream != null) {
                                        // fetches input stream of the upload file for the blob column
                                        statement.setBlob(3, inputStream);
                                    }

                                    // sends the statement to the database server
                                    int row = statement.executeUpdate();
                                    if (row > 0) {
                                        message = "File uploaded and saved into database";
                                    }
                                } catch (SQLException ex) {
                                    message = "ERROR: " + ex.getMessage();
                                    ex.printStackTrace();
                                } catch (ClassNotFoundException ex) {
                                    Logger.getLogger(FileUploadDBServlet.class.getName()).log(Level.SEVERE, null, ex);
                                } finally {
                                    if (conn != null) {
                                        // closes the database connection
                                        try {
                                            conn.close();
                                        } catch (SQLException ex) {
                                            ex.printStackTrace();
                                        }
                                    }
                                    // sets the message in request scope
                                    request.setAttribute("Message", message);

                                    // forwards to the message page
                                    response.sendRedirect("admin/reports/uploadNotification.jsp?message=1");
                                   //getServletContext().getRequestDispatcher("/admin/reports/uploadNotification.jsp?message=uploaded").forward(request, response);
                                }
                            break;
            case "Document" :
                        String cCode=request.getParameter("lastName");
                        
                        try {
                                    // connects to the database
                                    //DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                                    conn = Database.getConnection();

                                    // constructs SQL statement
                                    String sql = "INSERT INTO `cdc`.`documents`(`document`,`cCode`,`pdf`,`date`)VALUES(?,?,?,?);";
                                    PreparedStatement statement = conn.prepareStatement(sql);
                                    statement.setString(1, firstName);
                                    statement.setString(2, lastName);
                                    statement.setString(4, currentTime);

                                    if (inputStream != null) {
                                        // fetches input stream of the upload file for the blob column
                                        statement.setBlob(3, inputStream);
                                    }

                                    // sends the statement to the database server
                                    int row = statement.executeUpdate();
                                    if (row > 0) {
                                        message = "File uploaded and saved into database";
                                    }
                                } catch (SQLException ex) {
                                    message = "ERROR: " + ex.getMessage();
                                    ex.printStackTrace();
                                } catch (ClassNotFoundException ex) {
                                    Logger.getLogger(FileUploadDBServlet.class.getName()).log(Level.SEVERE, null, ex);
                                } finally {
                                    if (conn != null) {
                                        // closes the database connection
                                        try {
                                            conn.close();
                                        } catch (SQLException ex) {
                                            ex.printStackTrace();
                                        }
                                    }
                                    // sets the message in request scope
                                    request.setAttribute("Message", message);

                                    // forwards to the message page
                                    response.sendRedirect("Reports/uploadDocuments.jsp?message=1");
                                   //getServletContext().getRequestDispatcher("/admin/reports/uploadNotification.jsp?message=uploaded").forward(request, response);
                                }
                break;
                
            }
    }
}