package co.edu.cue.cue_swap.infrastructure.repository;

import co.edu.cue.cue_swap.domain.entities.Complaint;
import co.edu.cue.cue_swap.domain.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ComplaintRepository extends JpaRepository<Complaint,Long> {
}
