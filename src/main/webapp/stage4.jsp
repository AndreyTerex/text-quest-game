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
    <title>Stage 4 — Лабиринт Решения</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<h1>🌀 Лабиринт Решения</h1>
<p>Перед тобой — два зеркала.<br>
Одно — светлое, прозрачное.<br>
Второе — тёмное, с трещинами.</p>
<p>Голос говорит:<br>
«Ты можешь уйти... забыв всё. Или остаться... сохранив себя. Но останешься здесь навсегда.»</p>

<form action="/Stage4Servlet" method="post">
    <input type="radio" id="light" name="choice" value="light" required>
    <label for="light">Войти в светлое зеркало — победа, но память теряется.</label><br>

    <input type="radio" id="dark" name="choice" value="dark">
    <label for="dark">Войти в тёмное зеркало — поражение, но ты остаёшься собой.</label><br>

    <input type="radio" id="leave" name="choice" value="leave">
    <label for="leave">Уйти прочь, не выбрав — нейтральная концовка.</label><br><br>

    <button type="submit">Выбрать</button>
</form>
<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>
