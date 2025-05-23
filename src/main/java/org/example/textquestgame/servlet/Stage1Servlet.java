package org.example.textquestgame.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.textquestgame.gameService.GameService;
import org.example.textquestgame.gameService.StagesService;

import java.io.IOException;

@WebServlet(urlPatterns = "/Stage1Servlet")
public class Stage1Servlet extends BaseServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("stage1.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        gameService.setGameStage(req.getSession(),"stage2");
        stagesService.checkPlayerChoiceStage1(req,resp);

    }
}
