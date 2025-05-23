<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Player player = (Player) session.getAttribute("player");
    if (player == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stage 1 — Коридор Воспоминаний</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>🧩 Коридор Воспоминаний</h1>
    <p>
        Привет, <c:out value="${player.playerName}"/>! Ты очнулся в узком тёмном коридоре.<br>
        Перед тобой — три двери. На одной — символ сердца, на второй — меч, на третьей — маска.<br>
        Голос в голове шепчет: «Выбери воспоминание, которое приведёт тебя к истине…»
    </p>
</header>

<main class="page-content">
    <form action="/Stage1Servlet" method="post" class="container">
        <div class="radio-group">
            <input type="radio" id="heart" name="choice" value="heart" required>
            <label for="heart" class="radio-label">❤️ Сердце — ты вспоминаешь важного человека.</label>

            <input type="radio" id="sword" name="choice" value="sword">
            <label for="sword" class="radio-label">⚔️ Меч — ты вспоминаешь момент своей борьбы.</label>

            <input type="radio" id="mask" name="choice" value="mask">
            <label for="mask" class="radio-label">🎭 Маска — ты открываешь ложное воспоминание.</label>
        </div>
        <button type="submit" class="button">Выбрать</button>
    </form>
</main>

<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>
