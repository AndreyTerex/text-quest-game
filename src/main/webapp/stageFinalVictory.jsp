<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Player player = (Player) session.getAttribute("player");
    Integer gamesPlayed = player != null && player.getGamesPlayed() != null
            ? player.getGamesPlayed() + 1 : 1;
    if (player != null) player.setGamesPlayed(gamesPlayed);
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Победа</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>🌅 Победа</h1>
</header>
<main class="page-content">
    <div class="container">
        <p>Ты сделал выбор.<br>Зеркало поглотило тебя, и ты открыл глаза.<br>Всё было, как раньше… или почти.<br>Вспоминать — больно. Но ты свободен.<br>Ты прошёл испытание.</p>
        <form action="/start" method="get" style="margin-top: 1.5rem;">
            <button type="submit" class="button">Сыграть снова</button>
        </form>
    </div>
</main>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${gamesPlayed}"/></b></span>
</footer>
</body>
</html>

