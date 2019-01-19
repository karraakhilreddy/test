/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cdc;

import java.util.Random;

/**
 *
 * @author akhil
 */
public class GenerateRandomString {
    public String randomAlphaNumeric(){
        
        
        String SALTCHARS1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String SALTCHARS2 = "1234567890";
        String SALTCHARS3 = "qwertyuiopkjhgfdsazxcvbnm";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 3) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS1.length());
            salt.append(SALTCHARS1.charAt(index));
        }
        while (salt.length() < 6) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS2.length());
            salt.append(SALTCHARS2.charAt(index));
        }
        while (salt.length() < 9) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS3.length());
            salt.append(SALTCHARS3.charAt(index));
        }
        String saltStr = salt.toString();
        
        return saltStr;
        
        
        
    }
   
}
