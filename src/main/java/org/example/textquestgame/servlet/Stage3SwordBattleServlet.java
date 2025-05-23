package org.example.textquestgame.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/Stage3SwordBattleServlet")
public class Stage3SwordBattleServlet extends BaseServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        gameService.setGameStage(session, "stage3battle");
        String opponent = req.getParameter("opponent");
        session.setAttribute("opponent", opponent);
        session.setAttribute("opponentHealth", 100);
        session.setAttribute("playerHealth", 100);
        resp.sendRedirect("/stage3_sword.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String playerAction = req.getParameter("playerAction");
        session.setAttribute("playerAction", playerAction);

        boolean battleContinues = gameService.Stage3SwordBattle(session);
        

        Integer opponentHealth = (Integer) session.getAttribute("opponentHealth");
        Integer playerHealth = (Integer) session.getAttribute("playerHealth");
        
        if (!battleContinues) {
            if (opponentHealth <= 0 && playerHealth > 0) {
                resp.sendRedirect("stage3_sword_win.jsp");
            } else if (playerHealth <= 0 && opponentHealth > 0) {
                resp.sendRedirect("stage3_sword_lose.jsp");
            }
        } else {
            resp.sendRedirect("stage3_sword.jsp");
        }
    }
}

