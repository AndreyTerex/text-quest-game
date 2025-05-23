package org.example.textquestgame.gameService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Builder;
import lombok.SneakyThrows;
import org.example.textquestgame.entity.GameStage;
import org.example.textquestgame.entity.Player;
import org.example.textquestgame.gameDao.GameDao;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.IOException;
import java.util.Optional;
import java.util.Random;
import java.util.UUID;

public class GameService {
    GameDao gameDao;
    BCryptPasswordEncoder encoder;

    public GameService(GameDao gameDao, BCryptPasswordEncoder encoder) {
        this.gameDao = gameDao;
        this.encoder = encoder;
    }

    public void incrementGamesPlayed(HttpSession session) {
        gameDao.incrementGamesPlayed(session);
    }

    public void startGame(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();

        String name = req.getParameter("name");
        String password = req.getParameter("password");

        session.setAttribute("name", name);
        session.setAttribute("password", password);

        Optional<Player> optionalPlayer = gameDao.getPlayer(name, password);

        if (optionalPlayer.isEmpty()) {
            Player newPlayer = Player.builder()
                    .playerName(name)
                    .password(encoder.encode(password))
                    .gamesPlayed(0)
                    .gameStage(new GameStage("stage1"))
                    .id(UUID.randomUUID())
                    .build();
            gameDao.savePlayer(newPlayer);
            session.setAttribute("player", newPlayer);
            resp.sendRedirect("/Stage1Servlet");

        } else {
            Player player = optionalPlayer.get();
            player.saveStage("stage1");
            session.setAttribute("player", player);
            gameDao.savePlayer(player);
            resp.sendRedirect("/Stage1Servlet");
        }
    }


    public void setGameStage(HttpSession session, String stage) throws IOException {
        Player player = (Player) session.getAttribute("player");
        if (player != null) {
            player.saveStage(stage); // внутри saveStage уже вызывается gameStage.setStage(stage)
            gameDao.savePlayer(player);
            session.setAttribute("player", player);
        }
    }

    public boolean Stage3SwordBattle(HttpSession session) {
        Integer opponentHealth = (Integer) session.getAttribute("opponentHealth");
        Integer playerHealth = (Integer) session.getAttribute("playerHealth");
        String playerAction = (String) session.getAttribute("playerAction");
        if (playerAction.equals("attack")) {
            int playerAttackDamage = new Random().nextInt(5, 20);
            opponentHealth -= playerAttackDamage;
            if (opponentHealth > 0) {
                int opponentAttackDamage = new Random().nextInt(5, 20);
                playerHealth -= opponentAttackDamage;
            }
        }

        if (playerAction.equals("defend")) {
            int opponentAttackDamage = new Random().nextInt(8, 25);
            playerHealth -= opponentAttackDamage / 2;
            if (playerHealth > 0) {
                int playerAttackDamage = new Random().nextInt(1, 5);
                opponentHealth -= playerAttackDamage;
            }
        }

        session.setAttribute("opponentHealth", opponentHealth);
        session.setAttribute("playerHealth", playerHealth);

        if (opponentHealth <= 0 && playerHealth > 0) {
            return false;
        } else if (playerHealth <= 0 && opponentHealth > 0) {
            return false;
        } else if (playerHealth <= 0 && opponentHealth <= 0) {
            return false;
        }
        return true;
    }
}
