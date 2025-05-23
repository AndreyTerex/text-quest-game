<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Start Game</title>
    <link rel="stylesheet" href="static/Styles.css">
</head>
<body>
<div class="container">
    <h1>Вход в мир "Тени за Зеркалом"</h1>
    <div>
    Ты стоишь у порога.
    Мир искажён. Зеркала шепчут твои забытые сны. Чтобы пройти сквозь отражение, тебе нужно имя… и ключ от памяти.

    Если у тебя уже есть путь — войди.
    Если нет — начни его сейчас.
    </div>
    <form action="/start" method="post">
        <label for="name">Имя, с которым ты войдёшь в мир.</label>
        <input type="text" id="name" name="name" required>

        <label for="password">Твой личный ключ от зеркала.</label>
        <input type="password" id="password" name="password" required>

        <button type="submit" name="signInButton">Войти</button>
    </form>
</div>
</body>
</html>