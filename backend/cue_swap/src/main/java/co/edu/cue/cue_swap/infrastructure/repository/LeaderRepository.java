package co.edu.cue.cue_swap.infrastructure.repository;

import co.edu.cue.cue_swap.domain.entities.Leader;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LeaderRepository extends JpaRepository<Leader,Long> {
}
