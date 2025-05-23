<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    Player player = (Player) session.getAttribute("player");
    String playerName = player != null ? player.getPlayerName() : name;
    String stage = player != null && player.getGameStage() != null ? player.getGameStage().getStage() : "?";
    Integer gamesPlayed = player != null && player.getGamesPlayed() != null ? player.getGamesPlayed() : 0;
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Stage 2 — Сердце</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<h1>❤️ За дверью — тёплый свет</h1>
<p>Перед тобой человек, которого ты когда-то любил. Он улыбается.</p>
<p>«Ты меня помнишь?.. Назови моё имя…»</p>

<form action="/Stage2HeartServlet" method="post">
    <label for="lovedName">Имя:</label>
    <input type="text" id="lovedName" name="lovedName" required>
    <button type="submit">Ответить</button>
</form>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>
