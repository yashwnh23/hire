/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package defaultPackage;
import javax.swing.JApplet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author yashwanth
 */
public class uniqueid extends JApplet {
    public uniqueid(){}
    public static boolean main(String s){
     try {
         String query="select email from users where email=?";
            Connection con=DB.getConnections();
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, s);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
            return false;}
            else{ 
                return true;}
     }catch(Exception e){
         System.out.println(e.getMessage());
         return false;
     }
}
}
