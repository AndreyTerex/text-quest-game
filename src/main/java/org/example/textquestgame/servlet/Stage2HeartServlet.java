package org.example.textquestgame.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.textquestgame.gameService.GameService;
import org.example.textquestgame.gameService.StagesService;

import java.io.IOException;

@WebServlet(urlPatterns = "/Stage2HeartServlet")
public class Stage2HeartServlet extends BaseServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect("/index.jsp");
            return;
        }
        String lovedName = req.getParameter("lovedName");
        if (lovedName == null || lovedName.isBlank()) {
            resp.sendRedirect("/stage2_heart.jsp");
            return;
        }
        gameService.setGameStage(session,"stage3");
        session.setAttribute("lovedName", lovedName);
        resp.sendRedirect("/stage3.jsp");
    }
}