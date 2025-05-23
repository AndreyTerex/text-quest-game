<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) response.sendRedirect("index.jsp");
    Player player = (Player) session.getAttribute("player");
    Integer mistakes = (Integer) session.getAttribute("mistakes");
    if (mistakes == null) mistakes = 0;
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stage 2 — Маска</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>🎭 Ложное воспоминание</h1>
</header>

<main class="page-content">
    <div class="container">
        <p>Дверь скрипит. Всё кажется знакомым — но вдруг всё рушится.<br>
            Комната искажается. Тень смеётся.<br>
            Ты понимаешь: это была ловушка. Это воспоминание — ложь.</p>
        <p>Ты потерял шанс. Ошибок: <b><%= mistakes + 1 %></b></p>
        <form action="/Stage2MaskServlet" method="post">
            <button type="submit" class="button">Продолжить</button>
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
