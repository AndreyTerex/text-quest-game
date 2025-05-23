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
    <title>Stage 4 — Лабиринт Решения</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>🌀 Лабиринт Решения</h1>
</header>
<main class="page-content">
    <div class="container">
        <p>Перед тобой — два зеркала.<br>Одно — светлое, прозрачное.<br>Второе — тёмное, с трещинами.</p>
        <p>Голос говорит:<br>«Ты можешь уйти... забыв всё. Или остаться... сохранив себя. Но останешься здесь навсегда.»</p>
        <form action="/Stage4Servlet" method="post">
            <div class="radio-group">
                <input type="radio" id="light" name="choice" value="light" required>
                <label for="light" class="radio-label">Войти в светлое зеркало — победа, но память теряется.</label>
                <input type="radio" id="dark" name="choice" value="dark">
                <label for="dark" class="radio-label">Войти в тёмное зеркало — поражение, но ты остаёшься собой.</label>
                <input type="radio" id="leave" name="choice" value="leave">
                <label for="leave" class="radio-label">Уйти прочь, не выбрав — нейтральная концовка.</label>
            </div>
            <button type="submit" class="button">Выбрать</button>
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

