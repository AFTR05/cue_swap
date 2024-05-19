package co.edu.cue.cue_swap.infrastructure.repository;

import co.edu.cue.cue_swap.domain.entities.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<UserModel,Long> {
    Optional<UserModel> findById(Long id);
    UserModel findByAccount_Username(String username);
}
