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
    <title>Stage 2 — Меч</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<h1>⚔️ Зал битвы</h1>
<p>Ты стоишь на арене, израненный, но живой.</p>
<p>Голос в голове требует: «Что двигало тобой в тот день?»</p>

<form action="/Stage2SwordServlet" method="post">
    <input type="radio" id="justice" name="motive" value="справедливости">
    <label for="justice">Жажда справедливости</label><br>

    <input type="radio" id="fear" name="motive" value="любимой">
    <label for="fear">Любимой</label><br>

    <input type="radio" id="power" name="motive" value="власти">
    <label for="power">Жажда власти</label><br><br>

    <button type="submit">Выбрать</button>
</form>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>
