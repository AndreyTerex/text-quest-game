package org.example.textquestgame.gameService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;

import java.io.IOException;

public class StagesService {
    @SneakyThrows
    public void checkChoiceStage3(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        String stage1Choice = (String) session.getAttribute("stage1Choice");
        if ("heart".equals(stage1Choice)) {
            String lovedName = (String) session.getAttribute("lovedName");
            String rememberedName = req.getParameter("rememberedName");
            if (lovedName != null && lovedName.equals(rememberedName)) {
                resp.sendRedirect("/stage4.jsp");
                return;
            } else {
                GameService gameService = (GameService) req.getServletContext().getAttribute("GameService");
                if (gameService != null) {
                    gameService.setGameStage(session, "stage3Lose");
                }
                req.getRequestDispatcher("Stage3lose.jsp").forward(req, resp);
            }
        }
    }

    public void checkPlayerChoiceStage1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String choice = req.getParameter("choice");
        if (choice != null) {
            req.getSession().setAttribute("stage1Choice", choice);
            if (choice.equals("heart")){
                resp.sendRedirect("stage2_heart.jsp");
            } else if (choice.equals("sword")){
                resp.sendRedirect("stage2_sword.jsp");
            } else if (choice.equals("mask")){
                resp.sendRedirect("stage2_mask.jsp");
            }
        } else {
            resp.sendRedirect("stage1.jsp"); // Redirect back if no choice
        }
    }

    @SneakyThrows
    public void checkPlayerChoiceStage4(HttpServletRequest req, HttpServletResponse resp) {
        String choice = req.getParameter("choice");
        if (choice != null) {
            if(choice.equals("light")){
                resp.sendRedirect("stageFinalVictory.jsp");
            } else if (choice.equals("dark")){
                resp.sendRedirect("stageFinalDefeat.jsp");
            } else if (choice.equals("leave")){
                resp.sendRedirect("stageFinalNeutral.jsp");
            }
        }
    }
}
