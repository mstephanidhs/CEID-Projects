package company;

import java.sql.*;
import javax.swing.*;

public class MySqlConnect {
    
    Connection conn = null;
    private static final String DB_URL = "jdbc:mariadb://localhost:3306/staff_evaluation";

    
    public static Connection ConnectDB() {
        
        try {
            Connection conn = DriverManager.getConnection(DB_URL, "root", "");
            return conn;
        } 
        catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            return null;
        }       
    }
            
}
