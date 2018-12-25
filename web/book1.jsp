<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@page import="cdc.Database"%>
<html>

<script>

function change(){
var cid=document.getElementById("type").selectedIndex;
var val = document.getElementById("type").options[cid].text;
window.location.replace("book1.jsp?id="+cid+"&&value="+val);

}
function change2(){
    var cid=document.getElementById("type").selectedIndex;
    var val = document.getElementById("type").options[cid].text;
    var courseid=document.getElementById("course").selectedIndex;
    var vcourse = document.getElementById("course").options[cid].text;
    window.location.replace("book1.jsp?id="+cid+"&&value="+val+"&&course="+vcourse);
}
function extract(){
var ide=document.getElementById("course").selectedIndex;
var bookname = document.getElementById("course").options[ide].text;

window.location.replace("book1.jsp?book="+bookname);
}
function extractsub(){
var sde=document.getElementById("subject").selectedIndex;
var subject = document.getElementById("subject").options[sde].text;

    window.location.replace("book1.jsp?subject="+subject);
}
function enableDisable() {
  if(document.book1.holiday.checked){
     document.book1.txt.disabled = false;
} else {
document.book1.txt.disabled = true;
}
  }
</script>
    <input type="text" name="txt">
    <form name="book1" action="try.jsp" method="post" >
<%!
Connection conn = null;
ResultSet rs =null;
Statement st=null;
String query="";

%>
<%
String value=request.getParameter("value");

    Connection con=Database.getConnection();
st = con.createStatement();
rs = st.executeQuery("SELECT DISTINCT type FROM course_structure ORDER BY type ASC");
%>
<select id="type" name="type" onchange="change();">
<option value="0">--Please Select--</option>
<% 
while(rs.next())
{
%>
<option value="<%=rs.getString("type")%>"><%=rs.getString("type")%></option>
<% 
if(rs.getString("type").equals(value))
{

%>
<option value="<%=value%>" selected disabled><%=value%></option>
<%
}
}
%>
</select>
<select sid="course" name ="course" onchange="change2();>
<option value="0">--Please Select--</option>
<%
String id=request.getParameter("value");
rs=st.executeQuery("SELECT DISTINCT course FROM course_structure where type='"+id+"' ORDER BY course ASC ;");
while(rs.next())
{
%>
<option value="<%=rs.getString("course")%>" ><%=rs.getString("course")%></option>
<%
}
%>
</select>
HOLIDAY<input type ="checkbox" name="holiday" value="HOLIDAY" onclick="radio.disable=!this.checked">
<br><h3>SUBJECTS</h3>
<table>
  <%
String sid=request.getParameter("id");

    rs=st.executeQuery("SELECT DISTINCT combination FROM course_structure where course='"+sid+"'  ;");


 while(rs.next())
           {

%>

<tr><td><%=rs.getString("combination")%></td><td><input type="radio" value="<%=rs.getString("subject")%>" name="subject" onchange="extractsub();"></td>

    <%
       }
    %>


</tr>


</table>
      
    </form>

</body>
</html>