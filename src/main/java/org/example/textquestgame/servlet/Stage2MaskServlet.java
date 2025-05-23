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

@WebServlet(urlPatterns = "/Stage2MaskServlet")
public class Stage2MaskServlet extends BaseServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        gameService.setGameStage(session, "stage3");
        Integer playerMistakes = 1;
        session.setAttribute("mistakes", playerMistakes);
        resp.sendRedirect("/stage3.jsp");
    }
}
