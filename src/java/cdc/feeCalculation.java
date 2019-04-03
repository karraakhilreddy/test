/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cdc;

import java.sql.Connection;
import java.sql.*;

/**
 *
 * @author akhil
 */
public class feeCalculation {

    
    long amount=0;
    long aamount=0;
    
    public long InspectionCalculation(String cCode) throws ClassNotFoundException, SQLException{
        
       
        Connection conn=Database.getConnection();
        String query="SELECT cType, COUNT(*) as cCount FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' GROUP BY cType ;";
        
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
        {
            
            String type=rs.getString("cType");
            switch(type){
                
                case "Pharmacy": //if type == pharmacy
                  
                     String query2="SELECT cCourse,count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='Pharmacy' group by cCourse;";
        
                     Statement stmt2=conn.createStatement();
                     ResultSet rs2=stmt2.executeQuery(query2);
                     while(rs2.next())
                     {
                         String course=rs2.getString("cCourse");
                         switch(course){
                             
                             case "B. Pharmacy":    //if type == pharmacy and course==b.pharmacy
                                 
                                 amount=amount+20000;
                                 
                                 break;
                             case "M. Pharmacy":    //if type == pharmacy and course==m.pharmacy
                                 
                                 
                                 if(rs2.getInt("tCourse")<=2){
                                     amount=amount+20000;
                                 }else if(rs2.getInt("tCourse")<=4){
                                     amount=amount+30000;
                                 }else
                                     amount=amount+40000;
                                 
                                 break;
                                 case "Pharm. D":    //if type == pharmacy and course==m.pharmacy
                                        amount=amount+25000;
                                  break;
                                 case "Pharm. PB":    //if type == pharmacy and course==m.pharmacy
                                        amount=amount+25000;
                                  break; 
                         }
                         
                     }
                     rs2.close();
                     stmt2.close();
                    break;
                case "Engineering":
                     query2="SELECT cCourse,count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='Engineering' group by ccourse;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     while(rs2.next())
                     {
                         String course=rs2.getString("cCourse");
                         switch(course){
                             
                             case "B. Tech":    //if type == Engineering and course==B. Tech
                                 
                                 amount=amount+17500;
                                 
                                 break;
                             case "M. Tech":    //if type == Engineering and course==M. Tech
                                 
                                     amount=amount+(rs2.getInt("tCourse")*20000);
                                
                                 break;
                                 
                         }
                        
                     }
                      rs2.close();
                     stmt2.close();
                     
                    break;
                    case "Education":
                     query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='Education';";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                            amount=amount+(rs2.getInt("tCourse")*17500); //if type == Education and course==B. Ed || M. Ed
                     }
                      rs2.close();
                     stmt2.close();
                     
                    break;
                    case "M.B.A.":
                     
                            amount=amount+20000; //if type == M.B.A. 
                            
                    break;
                    case "M.C.A.":
                     
                            amount=amount+20000; //if type == M.C.A. 
                            
                    break;
                    case "Law":
                     
                          query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='Law' and cCourse='LL.M' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                                     amount=amount+(rs2.getInt("tCourse")*20000);
                                
                     }
                      query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='Law' and cCourse='LL.B' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                                     amount=amount+10000;
                                
                     }
                      rs2.close();
                     stmt2.close();
                            
                    break;
                    case "UG":
                     query2="SELECT count( distinct ccourse) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='UG' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                         if(rs2.getInt("tCourse")<=2){
                                     amount=amount+5000;
                                 }else 
                                     amount=amount+10500;
                                 
                                 
                     }
                      rs2.close();
                     stmt2.close();
                    break;
                    case "PG":
                     query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='PG' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                          if(rs2.getInt("tCourse")==1){
                               amount=amount+5000;
                          }
                          else if(rs2.getInt("tCourse")<=3){
                                amount=amount+10000;
                          }else 
                                amount=amount+15000;
                                 
                                 
                     }
                      rs2.close();
                     stmt2.close();
                    break;
                    case "Physical Education":
                     query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='Physical Education' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     { 
                                amount=amount+(rs2.getInt("tCourse")*17500);
                      }
                      rs2.close();
                     stmt2.close();
                    break;
                    case "Hotel Management":
                     query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection fee pending' and cType='Hotel Management' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     { 
                                amount=amount+(rs2.getInt("tCourse")*5000);
                      }
                      rs2.close();
                     stmt2.close();
                    break;
            }
            
        }
        return amount;
    }
    public long AffiliationCalculation(String cCode) throws ClassNotFoundException, SQLException{
        
       
        Connection conn=Database.getConnection();
        String query="SELECT cType, COUNT(*) as cCount FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' GROUP BY cType ;";
        
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
        {
            
            String type=rs.getString("cType");
            switch(type){
                
                case "Pharmacy": //if type == pharmacy
                  
                     String query2="SELECT cCourse,count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='Pharmacy' group by cCourse;";
        
                     Statement stmt2=conn.createStatement();
                     ResultSet rs2=stmt2.executeQuery(query2);
                     while(rs2.next())
                     {
                         String course=rs2.getString("cCourse");
                         switch(course){
                             
                             case "B. Pharmacy":    //if type == pharmacy and course==b.pharmacy
                                 
                                 aamount=aamount+20000;
                                 
                                 break;
                             case "M. Pharmacy":    //if type == pharmacy and course==m.pharmacy
                                 
                                 
                                 aamount=aamount+rs2.getInt("tCourse")*15000;
                                 
                                 break;
                                 case "Pharm. D":    //if type == pharmacy and course==m.pharmacy
                                 
                                 
                                 aamount=aamount+50000;
                                 
                                 break;
                                 case "Pharm. PB":    //if type == pharmacy and course==m.pharmacy
                                 
                                 
                                 aamount=aamount+50000;
                                 
                                 break;
                                 
                         }
                         
                     }
                     rs2.close();
                     stmt2.close();
                    break;
                case "Engineering":
                     query2="SELECT cCourse,count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='Engineering' group by ccourse;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     while(rs2.next())
                     {
                         String course=rs2.getString("cCourse");
                         switch(course){
                             
                             case "B. Tech":    //if type == Engineering and course==B. Tech
                                 
                                 aamount=aamount+(rs2.getInt("tCourse")*25000);
                                 
                                 break;
                             case "M. Tech":    //if type == Engineering and course==M. Tech
                                 
                                     aamount=aamount+(rs2.getInt("tCourse")*25000);
                                
                                 break;
                                 
                         }
                        
                     }
                      rs2.close();
                     stmt2.close();
                     
                    break;
                    case "Education":
                     query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='Education';";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                            aamount=aamount+(rs2.getInt("tCourse")*15000); //if type == Education and course==B. Ed || M. Ed
                     }
                      rs2.close();
                     stmt2.close();
                     
                    break;
                    case "M.B.A.":
                     
                        query2="SELECT cIntakeSanctioned FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='M.B.A.';";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                            aamount=aamount+((int) Math.ceil((rs2.getInt("cIntakeSanctioned")/60)))*20000; 
                     }
                      rs2.close();
                     stmt2.close();
                             
                            
                    break;
                    case "M.C.A.":
                     
                            
                        query2="SELECT cIntakeSanctioned FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='M.C.A.';";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                            aamount=aamount+((int) Math.ceil((rs2.getInt("cIntakeSanctioned")/60)))*20000; //if type == Education and course==B. Ed || M. Ed
                     }
                      rs2.close();
                     stmt2.close();
                            
                    break;
                    case "Law":
                        
                      query2="SELECT cCourse,count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='Law' group by ccourse;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     while(rs2.next())
                     {
                         String course=rs2.getString("cCourse");
                         switch(course){
                             
                             case "LL.B":    //if type == Engineering and course==B. Tech
                                 
                                 aamount=aamount+15000;
                                 
                                 break;
                             case "LL.M":    //if type == Engineering and course==M. Tech
                                 
                                     aamount=aamount+(rs2.getInt("tCourse")*15000);
                                
                                 break;
                                 
                         }
                        
                     }
                      rs2.close();
                     stmt2.close();
                     
                     
                    break;
                    case "UG":
                     query2="SELECT count(distinct ccourse) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='UG' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                      
                      String query3="SELECT sum(cIntakeSanctioned) as tIntake FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='UG';";
        
                      Statement stmt3=conn.createStatement();
                      ResultSet rs3=stmt3.executeQuery(query3);
                     if(rs2.next() && rs3.next())
                     {
                         if(rs2.getInt("tCourse")==1 && rs3.getInt("tIntake")<=500 ){
                                     aamount=aamount+6000;
                         }else if(rs2.getInt("tCourse")==1 && rs3.getInt("tIntake")<=1000 ){
                                     aamount=aamount+12000;
                         } else if(rs2.getInt("tCourse")==1 && rs3.getInt("tIntake")<=1500 ){
                                     aamount=aamount+18000;
                         } else if(rs2.getInt("tCourse")==1 && rs3.getInt("tIntake")>1500 ){
                                     aamount=aamount+21000;
                         } else if(rs2.getInt("tCourse")>1 && rs3.getInt("tIntake")<=500 ){
                                     aamount=aamount+15000;
                         } else if(rs2.getInt("tCourse")>1 && rs3.getInt("tIntake")<=1000 ){
                                     aamount=aamount+21000;
                         }else if(rs2.getInt("tCourse")>1 && rs3.getInt("tIntake")<=1500 ){
                                     aamount=aamount+30000;
                         } else if(rs2.getInt("tCourse")>1 && rs3.getInt("tIntake")>1500 ){
                                     aamount=aamount+50000;
                         }    
                                 
                     }
                      rs2.close();
                     stmt2.close();
                     rs3.close();
                     stmt3.close();
                    break;
                    case "PG":
                        
                        int totalPGcourses=0,totalLabCourses=0,totalNonLabCourses=0;
                     query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='PG' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                         totalPGcourses=rs2.getInt("tCourse");
                      
                      }
                     query2="SELECT count(cCourse) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='PG' and cCourse='M.Sc.' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     {
                         totalLabCourses=rs2.getInt("tCourse");
                          aamount=aamount+(rs2.getInt("tCourse")*10000);
                      }
                      rs2.close();
                     stmt2.close();
                     totalNonLabCourses=totalPGcourses-totalLabCourses;
                     aamount=aamount+(totalNonLabCourses*8000);
                    break;
                    case "Physical Education":
                     query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='Physical Education' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     { 
                                aamount=aamount+(rs2.getInt("tCourse")*15000);
                      }
                      rs2.close();
                     stmt2.close();
                    break;
                    case "Hotel Management":
                     query2="SELECT count(*) as tCourse FROM courses where cCode='"+cCode+"' and cstatus='Inspection Success' and cType='Hotel Management' ;";
        
                      stmt2=conn.createStatement();
                      rs2=stmt2.executeQuery(query2);
                     if(rs2.next())
                     { 
                                amount=amount+(rs2.getInt("tCourse")*15000);
                      }
                      rs2.close();
                     stmt2.close();
                    break;
            }
            
        }
        return aamount;
    }
    
}
