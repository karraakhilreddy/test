<%-- 
    Document   : paymentGatewayResponse
    Created on : Jan 4, 2019, 10:21:37 AM
    Author     : akhil
--%>
<%@page import="cdc.logs"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.toml.dp.util.AES128Bit"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
                    String cCode="567";//(String)session.getAttribute("cCode");
                    String encData="7OuNG4OlchGQjNFa6cbaTH6jz4rKiRqweXSiTK0gBwBcByVP0Is222w+xPJXrnbkY/p5WA2TFPR7wl9K60cobi/7iqtma/gf42Okz3eiClxO29uMaMPMq8llV50drYvY4+I2LG6CdUkdMh/6T+NipOVH3as172QI6n8IjUSF/DiAuO/mh35uOy++dxu1HHa11/DNK95tdIKIf6MyW0zrWzgQAI54GVlqjlpZCxWSOeiK8EZsRDtw/JBgxIZE3r5qxW0UhEsXig8oMhnp9PEOhToNjSmZWLrmMdbnPWVWTPs="; //(String)request.getParameter("encData");
                    String    Key="fBc5628ybRQf88f/aqDUOQ==";
                    System.out.print(encData);
                    System.out.print("<br>");
                    String   EncryptTrans = AES128Bit.decrypt(encData, Key);
                    String[] data=EncryptTrans.split(Pattern.quote("|"));
                    
                    
                    // failure --- "7OuNG4OlchGQjNFa6cbaTH6jz4rKiRqweXSiTK0gBwBcByVP0Is222w+xPJXrnbkY/p5WA2TFPR7wl9K60cobi/7iqtma/gf42Okz3eiClxO29uMaMPMq8llV50drYvY4+I2LG6CdUkdMh/6T+NipOVH3as172QI6n8IjUSF/DiAuO/mh35uOy++dxu1HHa11/DNK95tdIKIf6MyW0zrWzgQAI54GVlqjlpZCxWSOeiK8EZsRDtw/JBgxIZE3r5qxW0UhEsXig8oMhnp9PEOhToNjSmZWLrmMdbnPWVWTPs=";
                    //Success --- "/zQHrDnqffLmwtK6AesyPFlW1k0GXys9dOK+Z02En5CITXfA5I37Hm4E621s6Lpcn98x7yGig1DRgOeCP6JasXzx/psmARuu8HBd6E8yFUZZdsmaFlvABiQW3KS0ZvRuZshsG0e5YcAT2JqU/UqnAQ0dcshT87kMU0+kDIJVnZDe9Z82WkBwEGSMVjGQaJVRfyG2rLWJPMABWiV0CUZtb2YuNamjDQwk6yqI+QykGDQ= 567KKU707 "
                    String ipAddress = request.getHeader("X-FORWARDED-FOR");  
                    if (ipAddress == null) {  
                          ipAddress = request.getRemoteAddr();  
                    }
                    Connection con=Database.getConnection();
                    PreparedStatement ps=null;                   
                    for(int i=0;i<15;i++){
                      out.println(data[i]);
                       out.print("<br>");
                    }
                  
                     
                     
                     
                    String startDate=data[10];
                    
                    java.sql.Timestamp date =  Timestamp.valueOf(startDate);
                    //SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                   
                     
                    out.println("amount="+data[4]);

                    try {
                        
                                     String insertTableSQL = "INSERT INTO `cdc`.`payments`(`merchantOrderNo`,`SBIePayReferenceID`,`status`,`amount`,`currency`,`payMode`,`otherDetails`,`reason`,`bankCode`,`bankReferenceNumber`,`transactionDate`,`country`,`cin`)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?);";
                                     ps=con.prepareStatement(insertTableSQL);

                                                  ps.setString(1, data[0]);
                                                  ps.setString(2, data[1]);
                                                  ps.setString(3, data[2]);
                                                  ps.setString(4, data[3]);
                                                  ps.setString(5, data[4]);
                                                  ps.setString(6, data[5]);
                                                  ps.setString(7, data[6]);
                                                  ps.setString(8, data[7]);
                                                  ps.setString(9, data[8]);
                                                  ps.setString(10, data[9]);
                                                  ps.setTimestamp(11, date);
                                                  ps.setString(12, data[11]);
                                                  ps.setString(13, data[12]);
                                                 
                                                  
                                                 
                                                 

                                                  // execute insert SQL stetement
                                                  ps.executeUpdate();
                                                  logs l=new logs();
                                                
                                            
                                            l.updateLog(cCode, "After Payment", "Made Payment of Rs."+data[3],ipAddress);
                                                   
                                                  out.println("Record is inserted into PAYMENT table!");
                                     
                                    

                    } catch (Exception e) {

                               System.out.println(e.getMessage());
                               out.println(e.getMessage());

                    } finally {

                            if (ps != null) {
                                     ps.close();
                            }

                            if (con != null) {
                                     con.close();
                            }
                            //response.sendRedirect("facultyDetails.jsp");
                    }

       %>
    </body>
</html>
