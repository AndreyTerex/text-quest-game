<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Start Game</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<header class="page-header">
    <h1>Вход в мир «Тени за Зеркалом»</h1>
    <p>
        Ты стоишь у порога.<br>
        Мир искажён. Зеркала шепчут твои забытые сны. Чтобы пройти сквозь отражение, тебе нужно имя… и ключ от памяти.
    </p>
</header>

<main class="page-content">
    <form action="/start" method="post" class="container">
        <div class="form-group">
            <label for="name">Имя, с которым ты войдёшь в мир.</label>
            <input type="text" id="name" name="name" required>
        </div>

        <div class="form-group">
            <label for="password">Твой личный ключ от зеркала.</label>
            <input type="password" id="password" name="password" required>
        </div>

        <button type="submit" name="signInButton" class="button">Войти</button>
    </form>
</main>

<footer class="player-footer">
    <span>👤 <b>— гость —</b></span> |
    <span>Стадия: <b>—</b></span> |
    <span>Игр сыграно: <b>—</b></span>
</footer>
</body>
</html>
