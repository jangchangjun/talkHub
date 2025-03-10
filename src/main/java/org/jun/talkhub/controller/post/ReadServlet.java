package org.jun.talkhub.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jun.talkhub.model.dao.PostDao;
import org.jun.talkhub.model.dao.PostLikeDao;
import org.jun.talkhub.model.vo.Post;
import org.jun.talkhub.model.vo.PostLike;
import org.jun.talkhub.model.vo.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/post/read")
public class ReadServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostDao postDao = new PostDao();
        int srchId = Integer.parseInt(req.getParameter("id"));

        boolean r = postDao.increaseViewById(srchId);
        Post post = postDao.selectByCode(srchId);

        if (req.getSession().getAttribute("user") == null) {
            req.getSession().setAttribute("read", req.getContextPath() + "/post/read?id="+srchId);
            resp.sendRedirect(req.getContextPath() + "/user/login");
            return;
        }


        User requester = (User) req.getSession().getAttribute("user");
        PostLikeDao postLikeDao = new PostLikeDao();
        List<PostLike> likes = postLikeDao.findByUserId(requester.getId());

        boolean alreadyLikes = false;
        for (PostLike like : likes) {
            if (like.getPostId() == srchId) {
                alreadyLikes = true;
            }
        }if (post != null) {
            req.setAttribute("post", post);
            req.setAttribute("already", alreadyLikes);
            req.getRequestDispatcher("/WEB-INF/views/post/read.jsp").forward(req, resp);
        }

    }
}
