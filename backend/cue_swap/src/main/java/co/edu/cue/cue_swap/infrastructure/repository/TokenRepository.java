package co.edu.cue.cue_swap.infrastructure.repository;

import co.edu.cue.cue_swap.domain.entities.Token;
import co.edu.cue.cue_swap.domain.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TokenRepository extends JpaRepository<Token,Integer> {
    List<Token> findByUserAndIsLogOut(User user, Boolean isLogged);
    Optional<Token> findByToken(String token);
}
