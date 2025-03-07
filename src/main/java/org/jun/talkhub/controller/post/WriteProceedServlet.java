package org.jun.talkhub.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jun.talkhub.model.dao.PostDao;
import org.jun.talkhub.model.vo.User;

import java.io.IOException;

@WebServlet("/post/write-proceed")
public class WriteProceedServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostDao postDao = new PostDao();

        User user =  (User)req.getSession().getAttribute("user");
        String writerId = user.getId();
        String title = req.getParameter("title");
        String category = req.getParameter("category");
        String text = req.getParameter("text");

        boolean r = postDao.create(writerId, title, category, text);
        if (r) {
            resp.sendRedirect(req.getContextPath() + "/post/list");
        }

    }
}
