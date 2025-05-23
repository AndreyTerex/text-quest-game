<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    Integer mistakes = (Integer) session.getAttribute("mistakes");
    if (mistakes == null) mistakes = 0;
    Player player = (Player) session.getAttribute("player");
    String playerName = player != null ? player.getPlayerName() : name;
    String stage = player != null && player.getGameStage() != null ? player.getGameStage().getStage() : "?";
    Integer gamesPlayed = player != null && player.getGamesPlayed() != null ? player.getGamesPlayed() : 0;
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Stage 2 — Маска</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<h1>🎭 Ложное воспоминание</h1>
<p>Дверь скрипит. Всё кажется знакомым — но вдруг всё рушится.<br>
Комната искажается. Тень смеётся.<br>
Ты понимаешь: это была ловушка. Это воспоминание — ложь.</p>
<p>Ты потерял шанс. Ошибок: <%= mistakes + 1 %></p>

<form action="/Stage2MaskServlet" method="post">
    <button type="submit">Продолжить</button>
</form>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>
