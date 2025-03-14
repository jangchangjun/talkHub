package org.jun.talkhub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/index")
public class HomeServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        boolean r = false;
        String sid = session.getId();
        long ct = session.getCreationTime();
        long lat = session.getLastAccessedTime();

        System.out.println("id" + sid + "timr" +ct);


        if(session.getAttribute("user") != null) {
            req.setAttribute("authentication", true);
        }else {
            req.setAttribute("authentication", false);
        }
        req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req,resp);
    }
}
