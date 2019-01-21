/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package defaultPackage;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author yashwanth
 */
public class md5algorithm {
     public static String md5(String s) throws NoSuchAlgorithmException{
    String password =s;
    String st="";
    	
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        
        byte byteData[] = md.digest();
        String s1,s2;
//       s2= DigestUtils.md5Hex(password).toString();
        s1 = byteData.toString();
        System.out.println(s1);
       // System.out.println( Hex.encodeHexString( byteData ));
    for(byte b:byteData){
         st += String.format("%02X", b);
            System.out.print(st);
           
    }
     return st;}
     
}
