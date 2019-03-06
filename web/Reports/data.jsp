<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@ page import="java.sql.*, java.io.*"%>
<%@page import="com.lowagie.text.*,com.lowagie.text.pdf.*"%>;
<% 
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    con = Database.getConnection();
    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM cdc.courses;"); 
%> 
        <script type="text/javascript">
        function fun(){
            alert("You have Successfully Loggedout");
        }
        </script>
     <table width="100%" border="0">
        <tr bgcolor="royalblue">
            <td>
                <center>
                    <font color="white">View Delegation</font>
                </center>
            </td>
        </tr>
        </table>
                <table width="100%" border="1">
        <tr>
                <td align="right"><a href="role.jsp" style ="text-decoration:none;"><font size="2" color="red"> Back</font></a> 
                <a href="Home.jsp" style ="text-decoration:none;"><font size="2" color="red">Home</font></a> 
                <a href="Logout.jsp" onclick="fun()" style ="text-decoration:none;"> <font size="2" color="red"> Logout</font></a> 
                </td>
        </tr>
        </table><br>
    <center>
    <TABLE BORDER="10" CELLPADDING="6" CELLSPACING="2" WIDTH="70%">
        <tr bgcolor="royalblue">
            <td><b>Employee ID</b></td>
            <td><b>Employee Name</b></td>
            <td><b>Employee Address ID</b></td>
            <td><b>Salary</b></td>

            </tr>
<%

Document document = new Document(PageSize.LETTER.rotate());
String f="D://table.pdf";
PdfWriter.getInstance(document, new FileOutputStream(new File(f)));
document.open();

String[] headers = new String[] {"Emp ID", "Emp Name", "Emp Address", "Salary"};
PdfPTable table = new PdfPTable(headers.length);
            for (int i = 0; i < headers.length; i++) {
                String header = headers[i];
                PdfPCell cell = new PdfPCell();
                cell.setGrayFill(0.9f);
                cell.setPhrase(new Phrase(header.toUpperCase(), new Font(Font.HELVETICA, 10, Font.BOLD)));
                table.addCell(cell);
            }
            table.completeRow();
while (rs.next()){
    String st1=rs.getString(1);
String st2=rs.getString(2);
String st3=rs.getString(3);
String st4=rs.getString(4);
table.addCell(st1);
table.addCell(st2);
table.addCell(st3);
table.addCell(st4);
table.completeRow();
    %>        <tr >
            <td><font size="2"><%=st1%></font></td>
            <td><font size="2"><%=st2%></font></td>
            <td><font size="2"><%=st3%></font></td>
            <td><font size="2"><%=st4%></font></td>
        </tr>

<% 
}
document.add(table);
document.close();
System.out.println(f);
%>
    </TABLE>
    <a href="../download.jsp?ff=<%=f%>">Download the  document</a>
    </center>