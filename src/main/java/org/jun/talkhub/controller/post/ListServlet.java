package org.jun.talkhub.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jun.talkhub.model.dao.PostDao;
import org.jun.talkhub.model.vo.Post;

import java.io.IOException;
import java.util.List;

@WebServlet("/post/list")
public class ListServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostDao postDao = new PostDao();
        List<Post> posts = postDao.selectAll();

        req.setAttribute("total", posts.size());
        req.setAttribute("datas", posts);

        req.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(req, resp);
    }
}
