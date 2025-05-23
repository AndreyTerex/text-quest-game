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

@WebServlet(urlPatterns = "/Stage4Servlet")
public class Stage4Servlet extends HttpServlet {
    GameService gameService;
    StagesService stagesService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext servletContext = getServletContext();
        gameService = (GameService) servletContext.getAttribute("GameService");
        stagesService = (StagesService) servletContext.getAttribute("StagesService");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        stagesService.checkChoiceStage3(req,resp);
        req.getRequestDispatcher("/stage4.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        gameService.setGameStage(req.getSession(),"stage4");
        stagesService.checkPlayerChoiceStage4(req,resp);
    }
}
