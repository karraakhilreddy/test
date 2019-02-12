<%@page import="com.toml.dp.util.AES128Bit"%>
<!DOCTYPE html>
<html>

    <head>
    
       <meta charset="utf-8">
	<title>cdc</title>
    
    <link rel="stylesheet" type="text/css" href="CSS/breakDown.css">
    <link rel="stylesheet" type="text/css" href="CSS/Help.css">
    
  
    </head>
    <body style="background-color: white;">

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
    <center>
        <%if(request.getParameter("merchantOrderID")==null){ %>
        <form>
            <h3>Enter the Merchant Order number</h3>
            <input type="text" name="merchantOrderID">
            <input type="submit" name="" value="Check" >
        </form>
        <%}else if(request.getParameter("merchantOrderID")!=null){

                String merchantOrderID=request.getParameter("merchantOrderID");
                String requestparameter = "|1000003|"+merchantOrderID+"|http://localhost:8084/test_1_1_1/doubleVerificationReport.jsp";

                String Key="fBc5628ybRQf88f/aqDUOQ==";
                String EncryptTrans = AES128Bit.encrypt(requestparameter, Key);
                String EncryptTrans2 = EncryptTrans.replaceAll("\n","");
           %>
            
            <form name="ecom" method="post" action="https://test.sbiepay.com/secure/AggMerchantStatusQueryAction">
                <p>Double verification for <%= request.getParameter("merchantOrderID")%></p>
                    <input type="hidden" name="encryptQuery" value="<%=EncryptTrans2 %>">
                    <input type="hidden" name="merchIdVal" value ="1000003"/>
                    <input type="hidden" name="aggIdVal" value ="SBIEPAY"/>
                    <input type="submit" name="submit" value="Submit">
            </form>
            </center>
        
        <%}%>
    
        
 
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
   
