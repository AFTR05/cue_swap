package co.edu.cue.cue_swap.infrastructure.repository;

import co.edu.cue.cue_swap.domain.entities.Rating;
import co.edu.cue.cue_swap.domain.entities.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RatingRepository extends JpaRepository<Rating,Long> {
    Rating findByTransaction_Id(Long transactionId);
}
