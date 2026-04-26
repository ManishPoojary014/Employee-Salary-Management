package com.dao;
import java.sql.*;

public class DBConnection {
    public static Connection getConn() throws Exception {
        // This is the "Driver" that talks to MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
       
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB", "root", "Manish@119");
    }
}