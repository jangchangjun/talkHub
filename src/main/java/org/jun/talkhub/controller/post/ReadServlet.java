package org.jun.talkhub.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jun.talkhub.model.dao.PostDao;
import org.jun.talkhub.model.vo.Post;

import java.io.IOException;

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

        if (post != null) {
            req.setAttribute("post", post);
            req.getRequestDispatcher("/WEB-INF/views/post/read.jsp").forward(req, resp);
        }

    }
}
