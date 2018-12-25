package cdc;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;

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
        }//?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
        //?verifyServerCertificate=false&useSSL=true
        return con;
    }
}
