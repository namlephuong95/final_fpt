package com.example.example_fpt_final.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionHelper {
    private final static String DATABASE_URL_FORMAT = "jdbc:mysql://%s:%d/%s?useUnicode=true&contentEncoding=UTF-8";
    private final static String DATABASE_SERVER = "127.0.0.1";
    private final static int DATABASE_PORT = 3306;
    private final static String DATABASE_NAME = "fpt_example_final";
    private final static String DATABASE_USER = "root";
    private final static String DATABASE_PWD = "";
    private static Connection connection;

    public static Connection getConnection() {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(String.format(DATABASE_URL_FORMAT, DATABASE_SERVER, DATABASE_PORT, DATABASE_NAME), DATABASE_USER, DATABASE_PWD);
                System.out.println("Create connection success");
            }
        } catch (SQLException throwables) {
            System.err.println(throwables.getMessage());
            System.out.println(String.format(DATABASE_URL_FORMAT, DATABASE_SERVER, DATABASE_PORT, DATABASE_NAME));
        }
        return connection;
    }
}
