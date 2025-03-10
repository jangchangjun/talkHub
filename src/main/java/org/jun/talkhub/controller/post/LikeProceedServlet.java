package org.jun.talkhub.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jun.talkhub.model.dao.PostDao;
import org.jun.talkhub.model.dao.PostLikeDao;
import org.jun.talkhub.model.vo.PostLike;
import org.jun.talkhub.model.vo.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/post/like-proceed")
public class LikeProceedServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int srchId = Integer.parseInt(req.getParameter("id"));
        PostLikeDao postLikeDao = new PostLikeDao();
        User requester = (User) req.getSession().getAttribute("user");
        List<PostLike> likes = postLikeDao.findByUserId(requester.getId());

        boolean alreadyLikes = false;
        for (PostLike like : likes) {
            if (like.getPostId() == srchId) {
                alreadyLikes = true;
                break;  // 이미 좋아요를 눌렀으면 더 이상 반복문을 돌 필요 없음
            }
        }

        if (!alreadyLikes) {
            PostDao dao = new PostDao();
            dao.increaseLikeById(srchId);  // 좋아요 수 증가

            PostLike log = PostLike.builder()
                    .userId(requester.getId())
                    .postId(srchId)
                    .build();
            postLikeDao.create(log);  // 새로운 좋아요 기록 추가
        }

        resp.sendRedirect(req.getContextPath() + "/post/read?id=" + srchId);
    }
}
