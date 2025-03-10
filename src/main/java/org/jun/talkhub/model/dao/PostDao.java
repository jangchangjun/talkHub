package org.jun.talkhub.model.dao;

import org.jun.talkhub.model.vo.Post;
import org.jun.talkhub.util.ConnectionFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PostDao {
    public boolean create(String writerId, String title, String category, String text) {
        boolean result = false;
        try {
            Connection conn = ConnectionFactory.open();

            PreparedStatement ps = conn.prepareStatement("insert into posts values (null,?,?,?,?,0,0,now(),now())");

            ps.setString(1, writerId);
            ps.setString(2, title);
            ps.setString(3, category);
            ps.setString(4, text);

            int r = ps.executeUpdate();
            result = true;

            conn.close();

        } catch (Exception e) {
            System.out.println("PostDAO.create : " + e.toString());
        }
        return result;
    }

    public List<Post> selectAll() {
        List<Post> posts = new ArrayList<>();

        try {
            Connection conn = ConnectionFactory.open();
            PreparedStatement ps = conn.prepareStatement("select * from posts order by id asc");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {  // rs.next()가 호출되어야 커서가 첫 번째 행으로 이동합니다.
                int id = rs.getInt("id");
                String writerId = rs.getString("writer_id");
                String title = rs.getString("title");
                String category = rs.getString("category");
                String text = rs.getString("content");
                int views = rs.getInt("views");
                int likes = rs.getInt("likes");
                Date writerAt = rs.getDate("writer_at");
                Date modifiedAt = rs.getDate("modified_at");

                Post p = new Post(id, writerId, title, category, text, views, likes, writerAt, modifiedAt);
                posts.add(p);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return posts;
    }

    public Post selectByCode(int id) {
        Post post = null;
        try {
            Connection conn = ConnectionFactory.open();
            PreparedStatement ps = conn.prepareStatement("select * from posts where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            // ResultSet에서 데이터를 읽기 전에 next() 호출하여 첫 번째 행으로 커서를 이동
            if (rs.next()) {  // rs.next()가 호출되어야 커서가 첫 번째 행으로 이동합니다.
                String writerId = rs.getString("writer_id");
                String title = rs.getString("title");
                String category = rs.getString("category");
                String text = rs.getString("content");
                int views = rs.getInt("views");
                int likes = rs.getInt("likes");
                Date writerAt = rs.getDate("writer_at");
                Date modifiedAt = rs.getDate("modified_at");

                post = new Post(id, writerId, title, category, text, views, likes, writerAt, modifiedAt);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);

        }
        return post;
    }

    public boolean increaseViewById(int postID) {
        boolean result = false;

        try (Connection conn = ConnectionFactory.open()) {
            PreparedStatement ps = conn.prepareStatement("update posts set views = views+1 where id =?" );
            ps.setInt(1,postID);

            int r = ps.executeUpdate();
            if (r>0){
                result = true;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return result;
    }
    public boolean increaseLikeById(int postID) {
        boolean result = false;

        try (Connection conn = ConnectionFactory.open()) {
            PreparedStatement ps = conn.prepareStatement("update posts set likes = likes+1 where id =?" );
            ps.setInt(1,postID);

            int r = ps.executeUpdate();
            if (r>0){
                result = true;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return result;
    }
}

