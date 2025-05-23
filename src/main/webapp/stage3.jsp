<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String) session.getAttribute("name");
    String stage1Choice = (String) session.getAttribute("stage1Choice");
    if (name == null || stage1Choice == null) {
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
    <title>Stage 3 — Комната Лжи</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<h1>🧠 Комната Лжи</h1>

<% if ("heart".equals(stage1Choice)) { %>
    <p>«Ты утверждаешь, что что-то помнишь. Докажи.»</p>
    <p>«Назови имя того, кого ты вспомнил.»</p>
    <form action="/Stage4Servlet" method="get">
        <input type="text" id = "rememberedName" name="rememberedName" required>
        <button type="submit">Ответить</button>
    </form>
<% } else if ("sword".equals(stage1Choice)) { %>
    <p>«Ты сказал, что дрался ради <%= session.getAttribute("motive") != null ? session.getAttribute("motive") : "..." %>. А кто был против тебя?»</p>
    <form action="/Stage4Servlet" method="get">
        <input type="text" name="opponent" required>
        <button type="submit">Ответить</button>
    </form>
<% } else if ("mask".equals(stage1Choice)) { %>
    <p>Тень говорит: «Ты уже солгал себе один раз. Хочешь продолжить путь — признай это.»</p>
    <form action="/Stage4Servlet" method="get">
        <button type="submit">Признать</button>
    </form>
<form action="/Stage3LoseServlet" method="post">
    <button type="submit">Не признавать</button>
</form>
<% } %>

</body>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</html>
