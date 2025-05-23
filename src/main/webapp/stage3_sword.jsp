<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Player player = (Player) session.getAttribute("player");
    if (player == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    String opponent = (String) session.getAttribute("opponent");
    Integer playerHealth = (Integer) session.getAttribute("playerHealth");
    if (playerHealth == null) playerHealth = 100;
    Integer opponentHealth = (Integer) session.getAttribute("opponentHealth");
    if (opponentHealth == null) opponentHealth = 100;
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>⚔️ Битва с <c:out value="${opponent}"/></title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>⚔️ Битва с <c:out value="${opponent}"/></h1>
</header>
<main class="page-content">
    <div class="container">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; align-items: start; margin-bottom: 1.5rem;">
            <div>
                <h3>👤 <c:out value="${player.playerName}"/></h3>
                <div class="health-bar" aria-label="Здоровье игрока">
                    <div class="health-fill" style="width: <%= playerHealth %>%;"></div>
                    <div class="health-label"><%= playerHealth %> / 100 HP</div>
                </div>
            </div>
            <div>
                <h3>🗡️ Противник: <c:out value="${opponent}"/></h3>
                <div class="health-bar" aria-label="Здоровье противника">
                    <div class="health-fill" style="width: <%= opponentHealth %>%; background: linear-gradient(90deg, #E53935, #F06292); box-shadow: 0 0 8px #E53935;"></div>
                    <div class="health-label"><%= opponentHealth %> / 100 HP</div>
                </div>
            </div>
        </div>

        <p style="text-align: center; margin-bottom: 1rem;">Выбери своё действие:</p>
        <form action="/Stage3SwordBattleServlet" method="post" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
            <button type="submit" name="playerAction" value="attack" class="button">Атаковать</button>
            <button type="submit" name="playerAction" value="defend" class="button" >Защищаться</button>
        </form>
    </div>
</main>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>
