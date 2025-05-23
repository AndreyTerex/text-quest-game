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
  <title>Stage 3 — Сердце</title>
  <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
  <h1>❤️ Встреча с любимым</h1>
</header>
<main class="page-content">
  <div class="container">
    <p>Ты стоишь напротив него, и время словно останавливается. Его взгляд наполнен теплом и пониманием.</p>
    <p>В этот момент вы оба чувствуете, что прошлое и настоящее сливаются воедино, даря надежду на новое начало.</p>
    <form action="stage4.jsp" method="get" style="margin-top: 1.5rem;">
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

