package co.edu.cue.cue_swap.infrastructure.repository;

import co.edu.cue.cue_swap.domain.entities.Complaint;
import co.edu.cue.cue_swap.domain.entities.Offer;
import co.edu.cue.cue_swap.domain.entities.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface OfferRepository extends JpaRepository<Offer,Long> {
    Optional<Offer> findById(Long id);
}
