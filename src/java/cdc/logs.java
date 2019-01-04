/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cdc;

import com.mysql.cj.jdbc.PreparedStatementWrapper;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author akhil
 */
public class logs {
    Database db=new Database();
     static Connection con;
     static PreparedStatement  ps=null;
     public logs() throws ClassNotFoundException {
        this.con = Database.getConnection();
    }
    public static void updateLog(String cCode,String in,String action,String IP) throws SocketException, ClassNotFoundException {
        
            
            
            java.util.Date dt = new java.util.Date();

            java.text.SimpleDateFormat sdf = 
            new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            String currentTime = sdf.format(dt);
            
            
             
            System.out.println(currentTime);  
            
            
            
            
             
            

                    try {
                        
                        
                            String insertTableSQL = "INSERT INTO `cdc`.`logs` (`cCode`, `time`, `IP`, `in`, `action`) VALUES (?, ?, ?, ?, ?)";

                             ps = con.prepareStatement(insertTableSQL);

                            ps.setString(1, cCode);
                            ps.setString(2, currentTime);
                            ps.setString(3, IP);
                            ps.setString(4, in);
                            ps.setString(5, action);

                            ps.execute();
                    }catch(Exception e){
                        JOptionPane.showConfirmDialog(null, e.getStackTrace());
                        System.out.println(e.getStackTrace());
                    }
            
        
    }
    

    
}
