package cdc;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author java2
 */
public class Database {

    private static Connection con = null;

    public static Connection getConnection() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cdc","root","root");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //,V}xNtFkMi2c
        //root,cdcaa321#
        return con;
    }

    PreparedStatement prepareStatement(String insertTableSQL) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
