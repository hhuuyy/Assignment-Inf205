/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Nguyen
 */
public class DBConnect {
    public static Connection getConnection() {
        Connection cons = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //Class.forName("com.mysql.jdbc.Driver");
            //cons = DriverManager.getConnection("jdbc:mysql://localhost:3306/ASM_JAVA4","root","");
            //cons = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ASM_JAVA4;user=sa;password=");
            cons = DriverManager.getConnection("jdbc:sqlserver://Datamobile.mssql.somee.com;"
                    + "databaseName=Datamobile;"
                    + "user=hiennt3006_SQLLogin_1;"
                    + "password=3mjvhsa6af");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cons;
    }
 
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
