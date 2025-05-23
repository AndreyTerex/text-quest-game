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
  <title>Поражение в битве</title>
  <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
  <h1>⚔️ Поражение в битве</h1>
</header>
<main class="page-content">
  <div class="container">
    <p>Ты проиграл сражение с противником. Прими свое поражение.</p>
    <form action="stage3_lose.jsp" method="get" style="margin-top: 1.5rem;">
      <button type="submit" class="button">Продолжить</button>
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

