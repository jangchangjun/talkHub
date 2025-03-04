package org.jun.talkhub.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UserRepository {
    public boolean create(String id, String password, String nickname, String gender, int birth) {
        boolean result = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://database.cb4ykygcod66.ap-northeast-2.rds.amazonaws.com:3306/talkhub",
                    "admin", "jang7890!");

            PreparedStatement ps = conn.prepareStatement("insert into users values (?,?,?,?,?,now())");
            ps.setString(1, id);
            ps.setString(2, password);
            ps.setString(3, nickname);
            ps.setString(4, gender);
            ps.setInt(5, birth);

            int r = ps.executeUpdate();
            result = true;

            conn.close();

        } catch (Exception e) {
            System.out.println("UserDAO.create : " + e.toString());
        }
        return result;
    }
}//