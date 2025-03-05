package org.jun.talkhub.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jun.talkhub.model.dao.UserDao;
import org.jun.talkhub.model.vo.User;

import java.io.IOException;

@WebServlet("/user/join-proceed")
public class JoinProceedServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();

        boolean hasError = false;
        String id = req.getParameter("id");
        User foundId = userDao.findById(id);
        if(id.length()<=4){
            hasError = true;
            req.setAttribute("idError", "아이디는 4글자 이상이여야함.");
        }
        if (foundId != null){
            hasError = true;
            req.setAttribute("idUniqueError", "이미 사용중인 아이디.");
        }
        String password = req.getParameter("password");
        if (password.length() <=6){
            hasError = true;
            req.setAttribute("passError", "비밀번호는 6글자 이상이여야함.");
        }
        String nickname = req.getParameter("nickname");
        User foundNick = userDao.findById(nickname);
        if (nickname.length()<=2){
            hasError = true;
            req.setAttribute("nickError", "닉네임은 2글자 이상이여야함.");
        }
        String gender = req.getParameter("gender");
        int birth = Integer.parseInt(req.getParameter("birth"));


        if (hasError) {
            req.getRequestDispatcher("/WEB-INF/views/user/join-fail.jsp").forward(req,resp);
            }else {
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }
}
