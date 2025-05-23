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
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stage 2 — Сердце</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>❤️ За дверью — тёплый свет</h1>
    <p>Перед тобой человек, которого ты когда-то любил. Он улыбается.</p>
    <p>«Ты меня помнишь?.. Назови моё имя…»</p>
</header>

<main class="page-content">
    <form action="/Stage2HeartServlet" method="post" class="container">
        <div class="form-group">
            <label for="lovedName">Имя:</label>
            <input type="text" id="lovedName" name="lovedName" required>
        </div>
        <button type="submit" class="button">Ответить</button>
    </form>
</main>

<footer class="player-footer">
    <span>👤 <b><c:out value="${player.playerName}"/></b></span> |
    <span>Стадия: <b><c:out value="${player.gameStage.stage}"/></b></span> |
    <span>Игр сыграно: <b><c:out value="${player.gamesPlayed}"/></b></span>
</footer>
</body>
</html>

