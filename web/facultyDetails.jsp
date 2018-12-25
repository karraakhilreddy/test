<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="cdc.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Dynamically Add Remove Table Rows in JavaScript</title>

    <style>
        table 
        {
            width: 70%;
            font: 17px Calibri;
        }
        table, th, td 
        {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
    </style>
</head>
<body onload="createTable()">
    
    <table>
        <tr>
                            <td><h1><a href="basicDetails.jsp">1.</a></h1></td>
                          <td><h1><a href="facultyDetails.jsp">2.</a></h1></td>
                          <td><h1><a href="courseDetails.jsp">3.</a></h1></td>
                          <td><h1><a href="inspectionCalculation.jsp">4.</a></h1></td>
                          <td><h1><a href="affiliationCalculation.jsp">5.</a></h1></td>
                           <td><h1><a href="Reports/reports.jsp">6.</a></h1></td>
                      
                      </tr>
    </table>
            <table border="1">
                
            <tr>
                <td>Name</td>
                <td>Type</td>
                <td>Designation</td>
                <td>Qualification</td>
                <td>Date of appointment</td>
                <td>Nature of appointment</td>
                <td>Mode of appointment</td>
                <td>Scale of pay</td>
                <td>Mode of pay</td>
                <td>Bank account Number</td>
                <td>PAN card Number</td>
                <td>Aadhar number</td>
                <td>Mobile Number</td>
                
            </tr>
            <%
                String cCode=(String)session.getAttribute("cCode");
            try
            {
           
            String query="select * from faculty where cCode='"+cCode+"';";
            Connection conn=Database.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {

            %>
                <tr>
                    <td><%=rs.getString("tName") %></td>
                    <td><%=rs.getString("tType") %></td>
                    <td><%=rs.getString("tdesignation") %></td>
                    <td><%=rs.getString("tQualification") %></td>
                    <td><%=rs.getString("tDate") %></td>
                    <td><%=rs.getString("tnature") %></td>
                    <td><%=rs.getString("tModeApp") %></td>
                    <td><%=rs.getString("tScale") %></td>
                    <td><%=rs.getString("tModePay") %></td>
                    <td><%=rs.getString("tBank") %></td>
                    <td><%=rs.getString("tPAN") %></td>
                    <td><%=rs.getString("tAadhar") %></td>
                    <td><%=rs.getString("tMobile") %></td>
                    
                </tr>
                    <%

            }
            %>
                </table>
                <%
                rs.close();
                stmt.close();
                conn.close();
                }
            catch(Exception e)
            {
                e.printStackTrace();
                }




            %>  
    
    
    <p>
        <input type="button" id="addRow" value="Add New Row" onclick="addRow()" />
    </p>

    <!--THE CONTAINER WHERE WE'll ADD THE DYNAMIC TABLE-->
    <div id="cont"></div>

    <p><input type="button" id="bt" value="Sumbit Data" onclick="sumbit()" /></p>
</body>

<script>
    // ARRAY FOR HEADER.
    var arrHead = new Array();
    arrHead = ['', 'Name of the Teacher', 'Type','Designation', 'Qualification with specialization','Date of Appointment','Nature of Appointment','Mode of Appointment','Scale of pay','Mode of payment','Bank account Number','PAN card Number','Aadhar card Number','Mobile No'];      // SIMPLY ADD OR REMOVE VALUES IN THE ARRAY FOR TABLE HEADERS.

    // FIRST CREATE A TABLE STRUCTURE BY ADDING A FEW HEADERS AND
    // ADD THE TABLE TO YOUR WEB PAGE.
    function createTable() {
        var empTable = document.createElement('table');
        empTable.setAttribute('id', 'empTable');            // SET THE TABLE ID.

        var tr = empTable.insertRow(-1);

        for (var h = 0; h < arrHead.length; h++) {
            var th = document.createElement('th');          // TABLE HEADER.
            th.innerHTML = arrHead[h];
            tr.appendChild(th);
        }

        var div = document.getElementById('cont');
        div.appendChild(empTable);    // ADD THE TABLE TO YOUR WEB PAGE.
    }

    // ADD A NEW ROW TO THE TABLE.s
    function addRow() {
        var empTab = document.getElementById('empTable');

        var rowCnt = empTab.rows.length;        // GET TABLE ROW COUNT.
        var tr = empTab.insertRow(rowCnt);      // TABLE ROW.
        tr = empTab.insertRow(rowCnt);

        for (var c = 0; c < arrHead.length; c++) {
            var td = document.createElement('td');          // TABLE DEFINITION.
            td = tr.insertCell(c);

            if (c == 0) {           // FIRST COLUMN.
                // ADD A BUTTON.
                var button = document.createElement('input');

                // SET INPUT ATTRIBUTE.
                button.setAttribute('type', 'button');
                button.setAttribute('value', 'Remove');

                // ADD THE BUTTON's 'onclick' EVENT.
                button.setAttribute('onclick', 'removeRow(this)');

                td.appendChild(button);
            }
            else if (c == 2) {           // FIRST COLUMN.
                // ADD A BUTTON.
                                

                //Create array of options to be added
                var array = ["Principal","Teaching","Non-Teaching"];

                //Create and append select list
                var selectList = document.createElement("select");
                selectList.id = "mySelect";
                td.appendChild(selectList);

                //Create and append the options
                for (var i = 0; i < array.length; i++) {
                    var option = document.createElement("option");
                    option.value = array[i];
                    option.text = array[i];
                    selectList.appendChild(option);
                }
               
                
            }
            else if (c == 6) {           // FIRST COLUMN.
                // ADD A BUTTON.
                                

                //Create array of options to be added
                var array = ["Permanent","Temporary"];

                //Create and append select list
                var selectList = document.createElement("select");
                selectList.id = "mySelect";
                td.appendChild(selectList);

                //Create and append the options
                for (var i = 0; i < array.length; i++) {
                    var option = document.createElement("option");
                    option.value = array[i];
                    option.text = array[i];
                    selectList.appendChild(option);
                }
               
                
            }
            else if (c == 7) {           // FIRST COLUMN.
                // ADD A BUTTON.
                                

                //Create array of options to be added
                var array = ["Ratified","Non- Ratified"];

                //Create and append select list
                var selectList = document.createElement("select");
                selectList.id = "mySelect";
                td.appendChild(selectList);

                //Create and append the options
                for (var i = 0; i < array.length; i++) {
                    var option = document.createElement("option");
                    option.value = array[i];
                    option.text = array[i];
                    selectList.appendChild(option);
                }
               
                
            }
            else if (c == 9) {           // FIRST COLUMN.
                // ADD A BUTTON.
                                

                //Create array of options to be added
                var array = ["Cash","Check"];

                //Create and append select list
                var selectList = document.createElement("select");
                selectList.id = "mySelect";
                td.appendChild(selectList);

                //Create and append the options
                for (var i = 0; i < array.length; i++) {
                    var option = document.createElement("option");
                    option.value = array[i];
                    option.text = array[i];
                    selectList.appendChild(option);
                }
               
                
            }
            else {
                // CREATE AND ADD TEXTBOX IN EACH CELL.
                var ele = document.createElement('input');
                ele.setAttribute('type', 'text');
                ele.setAttribute('value', '');

                td.appendChild(ele);
            }
        }
    }

    // DELETE TABLE ROW.
    function removeRow(oButton) {
        var empTab = document.getElementById('empTable');
        empTab.deleteRow(oButton.parentNode.parentNode.rowIndex);       // BUTTON -> TD -> TR.
    }

    // EXTRACT AND SUBMIT TABLE DATA.
    function sumbit() {
        var myTab = document.getElementById('empTable');
        var values = new Array();

        // LOOP THROUGH EACH ROW OF THE TABLE.
        for (row = 1; row < myTab.rows.length - 1; row++) {
            for (c = 1; c < myTab.rows[row].cells.length; c++) {   // EACH CELL IN A ROW.

                var element = myTab.rows.item(row).cells[c];
                if (element.childNodes[0].getAttribute('type') == 'text') {
                    values.push(element.childNodes[0].value);
                }else
                     values.push(element.childNodes[0].value);
            }
        }
        
        console.log(values);
        window.location.href = "upload.jsp?name=faculty&array="+values+"&rows="+row/2;
        //response.sendRedirect("upload.jsp"/*?name=faculty&array="+values+"rows="+row*/);
    }
</script>
</html>