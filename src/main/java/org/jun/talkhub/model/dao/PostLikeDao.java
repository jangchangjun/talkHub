package org.jun.talkhub.model.dao;

import org.jun.talkhub.model.vo.PostLike;
import org.jun.talkhub.util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PostLikeDao {

    public boolean create(PostLike one){
        boolean result = false;
        try {
            Connection conn = ConnectionFactory.open();

            PreparedStatement ps = conn.prepareStatement("insert into post_likes values (null,?,?,now())");
            ps.setString(1, one.getUserId());
            ps.setInt(2, one.getId());


            int r = ps.executeUpdate();
            result = true;

            conn.close();

        } catch (Exception e) {
            System.out.println("PostLikeDAO.create : " + e.toString());
        }
        return result;
    }
    public List<PostLike> selectAll(String userId) {
        List<PostLike> postLikes = new ArrayList<>();
        try {
            Connection conn = ConnectionFactory.open();
            PreparedStatement ps = conn.prepareStatement("select * from post_likes where user_id = ? order by created_at desc");
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String userIdFromDb = rs.getString("user_id");
                int postId = rs.getInt("post_id");
                Date createdAt = rs.getDate("created_at");

                PostLike p = new PostLike(id, userIdFromDb, postId, createdAt);
                postLikes.add(p);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postLikes;
    }

    public PostLike findById(String specificId) {
        PostLike one = null;
        try {
            Connection conn = ConnectionFactory.open();
            PreparedStatement ps = conn.prepareStatement("select * from post_likes where user_id = ?");
            ps.setString(1, specificId);  // user_id를 사용
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String userId = rs.getString("user_id");
                int postId = rs.getInt("post_id");
                Date createdAt = rs.getDate("created_at");

                one = new PostLike(id, userId, postId, createdAt);
            }
        } catch (Exception e) {
            e.printStackTrace();  // 예외 처리에서 콘솔에 오류 출력
        }
        return one;
    }

}
