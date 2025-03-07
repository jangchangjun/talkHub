package org.jun.talkhub.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jun.talkhub.model.dao.UserDao;
import org.jun.talkhub.model.vo.User;


import java.io.IOException;

@WebServlet("/user/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getSession().getAttribute("user") == null) {
            req.getSession().setAttribute("callback", req.getContextPath()+"/user/profile");
            resp.sendRedirect(req.getContextPath()+"/user/login");
            return;
        }

        User user = (User) req.getSession().getAttribute("user");
        req.setAttribute("user", user);

        String userId = user.getId();
        UserDao userDao = new UserDao();
        userDao.findById(userId);

        req.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(req,resp);

    }
}