package org.example.textquestgame.listener;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.example.textquestgame.gameDao.GameDao;
import org.example.textquestgame.gameService.GameService;
import org.example.textquestgame.gameService.StagesService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebListener
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        ObjectMapper objectMapper = new ObjectMapper();
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String filePath = servletContext.getRealPath("/") + "players.json";
        File players = new File(filePath);

        if (!players.exists()) {
            try {
                Path path = Paths.get(filePath);
                Files.createFile(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        GameDao gameDao = new GameDao(objectMapper, players, encoder);
        GameService gameService = new GameService(gameDao,encoder);
        StagesService stagesService = new StagesService();
        servletContext.setAttribute("GameService", gameService);
        servletContext.setAttribute("StagesService", stagesService);
    }
}
