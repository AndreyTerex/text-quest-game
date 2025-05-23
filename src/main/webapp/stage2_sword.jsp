<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.textquestgame.entity.Player" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) response.sendRedirect("index.jsp");
    Player player = (Player) session.getAttribute("player");
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stage 2 — Меч</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>⚔️ Зал битвы</h1>
    <p>Ты стоишь на арене, израненный, но живой.</p>
    <p>Голос в голове требует: «Что двигало тобой в тот день?»</p>
</header>

<main class="page-content">
    <form action="/Stage2SwordServlet" method="post" class="container">
        <div class="radio-group">
            <input type="radio" id="justice" name="motive" value="справедливости" required>
            <label for="justice" class="radio-label">Жажда справедливости</label>

            <input type="radio" id="fear" name="motive" value="любимой">
            <label for="fear" class="radio-label">Любимая</label>

            <input type="radio" id="power" name="motive" value="власти">
            <label for="power" class="radio-label">Жажда власти</label>
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

