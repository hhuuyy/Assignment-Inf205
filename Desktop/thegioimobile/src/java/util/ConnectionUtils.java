package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtils {

    public static final String HOST = "localhost", DBNAME = "ASM_JAVA4", USER = "root", PASS = "";
    
    public static final String URL = "jdbc:sqlserver://" + HOST + ";databaseName=" + DBNAME;
    public static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    
    public static final String MYSQL_URL = "jdbc:mysql://" + HOST + ":3306/" + DBNAME + "?characterEncoding=utf-8&useSSL=false";
    public static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(MYSQL_DRIVER);
        return DriverManager.getConnection(MYSQL_URL, USER, PASS);
    }
}