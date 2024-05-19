package co.edu.cue.cue_swap.infrastructure.repository;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.entities.Student;
import co.edu.cue.cue_swap.domain.entities.Transaction;
import co.edu.cue.cue_swap.domain.enums.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TransactionRepository extends JpaRepository<Transaction,Long> {
    Optional<Transaction> findById(Long id);
    List<Transaction> findByOffer_Bidder_Id(Long bidderId);

}
