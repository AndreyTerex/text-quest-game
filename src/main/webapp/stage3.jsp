<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String) session.getAttribute("name");
    String stage1Choice = (String) session.getAttribute("stage1Choice");
    if (name == null || stage1Choice == null) response.sendRedirect("index.jsp");
    Player player = (Player) session.getAttribute("player");
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stage 3 — Комната Лжи</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>🧠 Комната Лжи</h1>
</header>

<main class="page-content">
    <div class="container">
        <% if ("heart".equals(stage1Choice)) { %>
        <p>«Ты утверждаешь, что что-то помнишь. Докажи.»</p>
        <p>«Назови имя того, кого ты вспомнил.»</p>
        <form action="/Stage4Servlet" method="get">
            <div class="form-group">
                <input type="text" id="rememberedName" name="rememberedName" required placeholder="Имя...">
            </div>
            <button type="submit" class="button">Ответить</button>
        </form>
        <% } else if ("sword".equals(stage1Choice)) { %>
        <p>«Ты сказал, что дрался ради <%= session.getAttribute("motive") %>. А кто был против тебя?»</p>
        <form action="/Stage3SwordBattleServlet" method="get">
            <div class="form-group">
                <input type="text" id="opponent" name="opponent" required placeholder="Противник...">
            </div>
            <button type="submit" class="button">Ответить</button>
        </form>
        <% } else { %>
        <p>Тень говорит: «Ты уже солгал себе один раз. Хочешь продолжить путь — признай это.»</p>
        <div style="display: grid; gap: 1rem; margin-top: 1.5rem;">
            <form action="/Stage4Servlet" method="get" style="margin:0;">
                <button type="submit" class="button">Признать</button>
            </form>
            <form action="/Stage3LoseServlet" method="post" style="margin:0;">
                <button type="submit" class="button">Не признавать</button>
            </form>
        </div>
        <% } %>
    </div>
</main>

<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>

