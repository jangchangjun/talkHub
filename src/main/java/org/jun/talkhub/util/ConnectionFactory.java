package org.jun.talkhub.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
    public static Connection open() throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://database.cb4ykygcod66.ap-northeast-2.rds.amazonaws.com:3306/talkhub",
                "admin", "jang7890!");

        return conn;
    }
}
