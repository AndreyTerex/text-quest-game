package org.example.textquestgame.gameDao;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;
import org.example.textquestgame.entity.Player;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class GameDao {
    ObjectMapper mapper;
    File file;
    BCryptPasswordEncoder encoder;

    public GameDao(ObjectMapper mapper, File file, BCryptPasswordEncoder encoder) {
        this.mapper = mapper;
        this.file = file;
        this.encoder = encoder;
    }

    public void incrementGamesPlayed(HttpSession session) {
        Player player = (Player) session.getAttribute("player");
        if (player != null) {
            Integer gamesPlayed = player.getGamesPlayed() == null ? 0 : player.getGamesPlayed();
            player.setGamesPlayed(gamesPlayed + 1);
            savePlayer(player);
            session.setAttribute("player", player);
        }
    }

    @SneakyThrows
    public void savePlayer(Player player) {
        List<Player> players = getPlayers();
        players.remove(player);
        players.add(player);
        mapper.writeValue(file, players);
    }
    public List<Player> getPlayers() throws IOException {
        if (!file.exists() || file.length() == 0) {
            return new ArrayList<>();
        }
        return mapper.readValue(file, new TypeReference<List<Player>>() {});
    }

    @SneakyThrows
    public Optional<Player> getPlayer(String name, String password){
        return getPlayers().stream().
                filter(player -> player.getPlayerName().equals(name) && encoder.matches(password, player.getPassword()))
                .findFirst();

    }
}

