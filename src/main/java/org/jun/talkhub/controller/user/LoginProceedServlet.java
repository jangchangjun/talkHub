package org.jun.talkhub.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jun.talkhub.model.dao.UserDao;
import org.jun.talkhub.model.vo.User;

import java.io.IOException;

@WebServlet("/user/login-proceed")
public class LoginProceedServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String password = req.getParameter("password");

        UserDao userDao = new UserDao();
        User found = userDao.findById(id);

        if (found == null) {
            req.setAttribute("error", "사용자 아이디 또는 비밀번호가 일치하지 않습니다.");
            req.getRequestDispatcher("/WEB-INF/views/user/login-fail.jsp").forward(req, resp);
        } else {
            if (found.getPassword().equals(password)) {
                HttpSession session = req.getSession();
                session.setAttribute("user", found);

                // 응답을 커밋하기 전에 리디렉션 처리
                String callback = (String) session.getAttribute("callback");
                if (callback != null) {
                    session.removeAttribute("callback");
                    resp.sendRedirect(callback);
                    return;
                }

                String read = (String) session.getAttribute("read");
                if (read != null) {
                    session.removeAttribute("read");
                    resp.sendRedirect(read);
                    return;
                }

                String write = (String) session.getAttribute("write");
                if (write != null) {
                    session.removeAttribute("write");
                    resp.sendRedirect(write);
                    return;
                }

                // 아무 조건도 맞지 않으면 기본 페이지로 리디렉션
                resp.sendRedirect(req.getContextPath() + "/index");
            } else {
                req.getRequestDispatcher("/WEB-INF/views/user/login-fail.jsp").forward(req, resp);
            }
        }
    }
}
