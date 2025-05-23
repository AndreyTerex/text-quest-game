<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Player player = (Player) session.getAttribute("player");
    if (player == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    pageContext.setAttribute("player", player);
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Stage 1 — Коридор Воспоминаний</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<h1>🧩 Коридор Воспоминаний</h1>
<p>Привет, <c:out value="${player.playerName}"/>! Ты очнулся в узком тёмном коридоре.<br>
Перед тобой — три двери.<br>
На одной — символ сердца, на второй — меч, на третьей — маска.<br>
Голос в голове нашёптывает: «Выбери воспоминание, которое приведёт тебя к истине…»</p>

<form action="/Stage1Servlet" method="post">
    <input type="radio" id="heart" name="choice" value="heart" required>
    <label for="heart">❤️ Сердце — ты вспоминаешь важного человека.</label><br>

    <input type="radio" id="sword" name="choice" value="sword">
    <label for="sword">⚔️ Меч — ты вспоминаешь момент своей борьбы.</label><br>

    <input type="radio" id="mask" name="choice" value="mask">
    <label for="mask">🎭 Маска — ты открываешь ложное воспоминание.</label><br><br>

    <button type="submit">Выбрать</button>
</form>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>