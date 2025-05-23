<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Player player = (Player) session.getAttribute("player");
    String playerName = player != null ? player.getPlayerName() : "?";
    String stage = player != null && player.getGameStage() != null ? player.getGameStage().getStage() : "?";
    Integer gamesPlayed = player != null && player.getGamesPlayed() != null ? player.getGamesPlayed() : 0;
    session.setAttribute("gamesPlayed", gamesPlayed + 1);
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Зеркальная концовка</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<h1>🌒  Зеркальный мир </h1>
<p>Ты стоишь на грани двух миров — реального и зеркального. Твой страх заставил тебя отступить, но это не конец пути.<br>
    В каждом отражении скрывается возможность начать заново и изменить свою судьбу.<br>
    Не бойся заглянуть в глубину зеркала — там тебя ждут новые испытания и открытия.</p>

<form action="/start" method="get">
    <button type="submit">Попробовать снова</button>
</form>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>