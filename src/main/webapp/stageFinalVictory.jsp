<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Player player = (Player) session.getAttribute("player");
    String playerName = player != null ? player.getPlayerName() : "?";
    String stage = player != null && player.getGameStage() != null ? player.getGameStage().getStage() : "?";
    Integer gamesPlayed = player != null && player.getGamesPlayed() != null ? player.getGamesPlayed() : 0;
    if (gamesPlayed == null) gamesPlayed = 0;
    session.setAttribute("gamesPlayed", gamesPlayed + 1);
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Победа</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<h1>🌅 Победа</h1>
<p>Ты сделал выбор.<br>
Зеркало поглотило тебя, и ты открыл глаза.<br>
Всё было, как раньше… или почти.<br>
Вспоминать — больно. Но ты свободен.<br>
Ты прошёл испытание.</p>

<form action="/start" method="get">
    <button type="submit">Сыграть снова</button>
</form>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>
