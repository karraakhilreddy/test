<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	<title>cdc</title>
    
    <link rel="stylesheet" type="text/css" href="CSS/indexCSS2.css">
    
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
<body style="background: black">
  <div style="text-align: center; background:linear-gradient(#34e89e,#0f3443);">
      <div>
           <div ><img src="IMG/1.png" height="150" width="150" align="left" hspace="120" ></div>
            <div ><img src="IMG/2.png" height="150" width="200" align="right" hspace="120" ></div>
          <h2 style="color:black; text-shadow: 0 0 20px #FFFFFF; font-family: Bookman Old Style;" >Online Services</h2>
          <h1 style="color:black; text-shadow: 2px 2px 50px orange; font-family: Bookman Old Style;"><b>KAKATIYA UNIVERSITY</b></h1>
          <h4>Warangal,506009</h4>

      </div>
      <a href="login.php">
       <p style="color:black; border-style: white; text-align: center; background-color: deepskyblue;"><marquee  behavior="alternate" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()"><b><i>Welcome To Online Services-Kakatiya University</i></b></marquee></p></a>
  </div>
    <nav>
        <div class="navbuttons">
             <ul><button class="active" onclick="window.location='home.jsp'" ><li>About</li></button>
                <button class="tablinks" onclick="window.location='login.jsp'"><li>College Login</li></button>
                <button class="tablinks" onclick="window.location='admin/aindex.jsp'"><li>Admin Login</li></button>
                <button class="tablinks" onclick="window.location='dean.jsp'"><li>Dean</li></button>
                <button onclick="window.open('https://www.kakatiya.ac.in');" ><li>University</li></button>
                <button class="tablinks" onclick="window.location='help.jsp'"><li>Help</li></button>
            
            </ul>
        </div>
       
    </nav>
    <div class="navbuttons">
             <ul><button class="tablinks" onclick="openCont(event,'CDC')" ><li>CDC</li></button>
                <button class="tablinks" onclick="openCont(event,'ACADEMIC_AUDIT')"><li>Academic Audit</li></button>
                
            
            
            </ul>
        <center>
         <div id="CDC" class="tabcontent">
         <iframe src="deanCDC.html"  scroll="auto"></iframe>
        
        </div>
          <div id="ACADEMIC_AUDIT" class="tabcontent">
         <iframe src="deanAcademicaudit.html"  scroll="auto"></iframe>
            </div>
            
            </center>
        </div>
       
    
     
       
              
                  
            
                   
                
        
       
        <footer>
            <center>
            <p id="copyright"> Copyrights reserved by Kakatiya University<br>
                <a href="developers.jsp">Developers</a></p>
            </center>
            
        </footer>
</body>
</html>