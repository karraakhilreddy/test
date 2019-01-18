<%-- 
    Document   : receipts
    Created on : Jan 18, 2019, 11:15:17 AM
    Author     : akhil
--%>

<%@page import="com.lowagie.text.Image"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.Chunk"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.lowagie.text.PageSize"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String cCode=(String)session.getAttribute("cCode");
            File tempFile = File.createTempFile(cCode+"_transaction", ".pdf");
            Document document = new Document(PageSize.A4);
            
                    String f=tempFile.getAbsolutePath();
                    PdfWriter.getInstance(document, new FileOutputStream(tempFile));
                    document.open();
        
                    
                    
                    
                    document.add(Chunk.NEWLINE);
                    document.add(Chunk.NEWLINE);
                    Paragraph p=new Paragraph("College Development Council");
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                    p=new Paragraph("KAKATIYA UNIVERSITY\nWarangal-506001");
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);

                    Image image = Image.getInstance("http://localhost:8084/test_1_1_1/IMG/1.png");
                     image.scaleAbsolute(80f, 80f);
                    image.setAbsolutePosition(85f, 740f);
                    document.add(image);

                     p=new Paragraph("Receipt for the Payment of "+(String)request.getParameter("feeFor"));
                    p.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(p);
                     document.add(Chunk.NEWLINE);
                    
                     
                     
                     
                    PdfPTable table = new PdfPTable(2);
                    
                    
        
                    table.addCell("Merchant order No.");
                    table.addCell((String)request.getParameter("merchantOrderNo"));
                    
                    table.addCell("Fee of");
                    table.addCell((String)request.getParameter("feeFor"));
                    
                    table.addCell("Reference ID");
                    table.addCell((String)request.getParameter("SBIePayReferenceID"));
                    
                    table.addCell("Status");
                    table.addCell((String)request.getParameter("status"));
                    
                    table.addCell("Amount");
                    table.addCell((String)request.getParameter("amount"));
                    
                    table.addCell("Paymode");
                    table.addCell((String)request.getParameter("payMode"));
                              
                    table.addCell("Bank Code");
                    table.addCell((String)request.getParameter("bankCode"));
                    
                    table.addCell("Bank Reference No");
                    table.addCell((String)request.getParameter("bankReferenceNumber"));
                    
                    table.addCell("Transaction Date");
                    table.addCell((String)request.getParameter("transactionDate"));
                    
                    table.addCell("CIN");
                    table.addCell((String)request.getParameter("CIN"));
                    
                    table.completeRow();
                    
                    document.add(table);
                    document.close();
                    

                    response.sendRedirect("download.jsp?ff="+f);
        %>
                    
                    
        
        
    </body>
</html>
