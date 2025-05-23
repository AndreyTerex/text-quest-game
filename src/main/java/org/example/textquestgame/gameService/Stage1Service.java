package org.example.textquestgame.gameService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class Stage1Service {
    public void checkPlayerChoice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String choice = req.getParameter("choice");
        req.getSession().setAttribute("stage1Choice", choice);
        if (choice.equals("heart")){
            resp.sendRedirect("stage2_heart.jsp");
        } else if (choice.equals("sword")){
            resp.sendRedirect("stage2_sword.jsp");
        } else if (choice.equals("mask")){
            resp.sendRedirect("stage2_mask.jsp");
        }
    }
}

