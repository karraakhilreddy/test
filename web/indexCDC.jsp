
<!-- 
    Document   : testform
    Created on : 3 Oct, 2018, 12:35:43 PM
    Author     : akhil
-->
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    
  <!-- <link rel="stylesheet" type="text/css" href="CSS/indexCSS.css">-->
    <link rel="stylesheet" type="text/css" href="CSS/breakDown.css"> 
    <style>
        table{
            width: 100%;
            cellspacing : 1;
            cellpadding : 1;
            border:0;
          
        }
        tr{
            height: 35px;
        }
        tr:hover{
            height: 45px;
        }
        tr:nth-child(even) 
        {
            background-color: #b0cad5;
        }
        tr:nth-child(odd) 
        {
            background-color: #c4dce7;
        }
        a{
            font-family:Verdana, Arial, Helvetica, sans-serif;
            color:#044df2;
            font-size:11px;
            text-decoration:none;
            line-height:20px;
         }

        a:hover{
            font-family:Verdana, Arial, Helvetica, sans-serif;
            color:orangered;
            font-size:12px;
            text-decoration:none;
       }
    </style>
    <script>
        
        
            function openCont(evt, contName,from) {
                    // Declare all variables
                    var i, tabcontent, tablinks;

                    // Get all elements with class="tabcontent" and hide them
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }

                    // Get all elements with class="tablinks" and remove the class "active"
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }

                    // Show the current tab, and add an "active" class to the button that opened the tab
                    document.getElementById(contName).style.display = "block";
                    evt.currentTarget.className += " active";
                    if(from==='but1')
                        button1.className +=" active";
                    
            }
        function openCont1(evt, contName,from) {
                    // Declare all variables
                    var i, tabcontent1, tablinks1;

                    // Get all elements with class="tabcontent" and hide them
                    tabcontent1 = document.getElementsByClassName("tabcontent1");
                    for (i = 0; i < tabcontent1.length; i++) {
                        tabcontent1[i].style.display = "none";
                    }

                    // Get all elements with class="tablinks" and remove the class "active"
                    tablinks1 = document.getElementsByClassName("tablinks1");
                    for (i = 0; i < tablinks1.length; i++) {
                        tablinks1[i].className = tablinks1[i].className.replace(" active", "");
                    }

                    // Show the current tab, and add an "active" class to the button that opened the tab
                    document.getElementById(contName).style.display = "block";
                    evt.currentTarget.className += " active";
                     if(from==='but11')
                        button11.className +=" active";
                    
                    
            }
    </script>
  
</head>
<body >
  <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div >
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="80" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="80" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3> <spam>Warangal-506009,Telangana</spam></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>

    <nav>
        <div class="navbuttons">
             <ul><button class="active" onclick="window.location='indexCDC.jsp'" ><li>Notifications</li></button>
                 <button class="" onclick="window.location='aboutCDC.html'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                
            
            </ul>
        </div>
       
    </nav>
   
    <div class="main">    
        <center>
    <div class="mainBackground">
        <div  style="width: 850px; align-content: center;">
            <h1>Notifications</h1>
            <a href="temp/checkMail.html" style="text-decoration: none; "> Click here to Correct/Check College Code and registered email</a>
            <br> <br>
            <table>
                <tr>
                    
                    
                </tr>
              <%
                                try{
                                        int sno=1;
                                        String query="select * from notifications where off='CDC' order by id desc ;";
                                         Connection conn=Database.getConnection();
                                         Statement stmt=conn.createStatement();
                                         ResultSet rs=stmt.executeQuery(query);
                                          while(rs.next())
                                         {
                                           %>

                                                <tr>
                                                    
                                                    <td>&nbsp;<a href="notifDownload.jsp?from=notifications&&id=<%= rs.getString("id")%>" target="_blank" style="text-decoration: none;"><%= rs.getString("Notification")%></a>
                                                        <% if(sno<=3){ %><img src="IMG/new_icon_red.gif"> <% } %></td>
                                                    
                                                </tr>
                                          <%
                                              sno++;
                                         }
                                         %>
                                        </table>
                                        <%
                                }catch(Exception e){
                                    out.print(e.getMessage());
                                }
            %>
            
            <br><br><br><br><br><br><br>
        </div>
                <br><br><br><br><br><br><br>

    </div>
        </center>
    </div>
    
       
        <div class="footer">
  <div id="button"></div>
<div id="container">
<div id="cont">
<div class="footer_center">
    <div > 
<div class="left">Copyrights reserved by Kakatiya University</div>
<div class="right"><a href="developers.jsp">Developers</a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>