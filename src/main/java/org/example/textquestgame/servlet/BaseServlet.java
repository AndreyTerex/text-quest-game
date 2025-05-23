package org.example.textquestgame.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import org.example.textquestgame.gameService.GameService;
import org.example.textquestgame.gameService.StagesService;

public class BaseServlet extends HttpServlet {
    GameService gameService;
    StagesService stagesService;
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext servletContext = getServletContext();
        gameService = (GameService) servletContext.getAttribute("GameService");
        stagesService = (StagesService) servletContext.getAttribute("StagesService");
    }
}
