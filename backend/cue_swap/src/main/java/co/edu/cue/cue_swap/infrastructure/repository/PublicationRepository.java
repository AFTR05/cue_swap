package co.edu.cue.cue_swap.infrastructure.repository;

import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.enums.Category;
import co.edu.cue.cue_swap.domain.enums.State;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PublicationRepository extends JpaRepository<Publication,Long> {
    List<Publication> findByDataState(Boolean state);
    List<Publication> findByDescription(String description);
    List<Publication> findByTitle(String title);
    List<Publication> findByProduct_Description(String description);
    List<Publication> findByProduct_Category(Category category);
    List<Publication> findByState(State state);

}

