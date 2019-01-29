<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS2.css">
    <style type="text/css">
        
       
         table td{
            border:20px solid lightgrey;
            width:250px;
            height: 250px;
            text-align: center;
            background-color: white;
        }
        .edit{
            height: 150px;
            width: 200px;
        }
        
        
        
        
        
        
        
        
    </style>
    <script>
            
            function openCont(evt,contName){
              var i,tabcontent,tablinks;
                
              tabcontent=document.getElementsByClassName("tabcontent");
                for(i=0;i<tabcontent.length;i++){
                    tabcontent[i].style.display="none";
                }
                
                
                tablinks=document.getElementsByClassName("tablinks");
               for(i=0;i<tablinks.length;i++){
                    tablinks[i].className=tablinks[i].className.replace("active","");
                }
                document.getElementById(contName).style.display="block";
                evt.currentTarget.className +="active";
            }
            
        </script>
</head>
<body  >
   <div style="text-align: center; background:linear-gradient(#50c9c3,#96deda); margin-top: -1em;">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; font-family: Bookman Old Style; ">KAKATIYA UNIVERSITY</h2>
          <h1 style="color:navy; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;"><b>COLLEGE DEVELOPMENT COUNCIL</b></h1>
          <h3><spam>Warangal-506009,Telangana</spam></h3><h3><b>Ph: 9440163189. drchr18@yahoo.com</b></h3>
      </div>
      <a href="#">
       <p style="color:black; border-style: white; text-align: center; background-color: #30cfd0;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To College Development Council</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
             <ul><button class="" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="active" onclick="window.location='dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
     <div class="navbuttons">
          <center>
        <table>
           
            <tr >
                <td><img class="edit" src="IMG\cdc.jpg"  align="inherit"/><br/><br/> <button class="tablinks" onclick="openCont(event,'CDC')" style="width:200px;height:55px; background-color:  darkgrey;" >CDC</button></td> 
                <td> <img class="edit" src="IMG\audit.jpg"  align="inherit"/><br/><br/><button class="tablinks" onclick="openCont(event,'ACADEMIC_AUDIT')" style="width:200px;height:55px; background-color:  darkgrey;">Academic Audit</button></td>
            <br>
            <br>
            <br>
            
            </tr>
            
        </table>
          </center>
         
        </div>
        <center>
             <br>
            <br>
            <br>
            
         <div id="CDC" class="tabcontent">
             
         <iframe src="deanCDC.html"  scroll="auto"></iframe>
        
        </div>
          <div id="ACADEMIC_AUDIT" class="tabcontent">
         <iframe src="deanAcademicaudit.html"  scroll="auto"></iframe>
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