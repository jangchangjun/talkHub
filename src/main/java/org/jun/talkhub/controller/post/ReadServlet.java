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
        int srchId = Integer.parseInt(req.getParameter("id"));

        PostDao postDao = new PostDao();
        Post post = postDao.selectByCode(srchId);

        // 결과가 있으면, pokemon 객체를 request에 저장하고, JSP로 포워딩
        if (post != null) {
            req.setAttribute("post", post);
            req.getRequestDispatcher("/WEB-INF/views/post/read.jsp").forward(req, resp);
        }
    }
}
