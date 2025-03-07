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
        List<PostLike> likes = postLikeDao.selectAll(requester.getId());

        boolean alreadyLikes = false;
        for (PostLike like : likes) {
            if (like.getPostId() == srchId) {
                alreadyLikes = true;
            }
            break;
        }

        if (!alreadyLikes){
            PostDao dao = new PostDao();
            dao.increaseLikeById(srchId);

            PostLike log = PostLike.builder().userId(requester.getId()).postId(srchId).build();
            postLikeDao.create(log);
        }

        resp.sendRedirect(req.getContextPath() + "/post/read?id=" + srchId);
    }
}
