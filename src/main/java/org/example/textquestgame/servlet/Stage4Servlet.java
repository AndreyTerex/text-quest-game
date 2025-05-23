package org.example.textquestgame.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/Stage4Servlet")
public class Stage4Servlet extends BaseServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        stagesService.checkChoiceStage3(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        gameService.setGameStage(req.getSession(),"stage4");
        stagesService.checkPlayerChoiceStage4(req,resp);
    }
}
