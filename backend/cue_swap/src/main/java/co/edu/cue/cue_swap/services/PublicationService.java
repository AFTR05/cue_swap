package co.edu.cue.cue_swap.services;


import co.edu.cue.cue_swap.domain.enums.Category;
import co.edu.cue.cue_swap.domain.enums.State;
import co.edu.cue.cue_swap.mapping.dtos.PublicationDTO;
import co.edu.cue.cue_swap.mapping.dtos.PublicationRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.SearchPublicationDTO;

import java.util.List;

public interface PublicationService {
    List<PublicationDTO> getAllPublications();
    PublicationDTO getOnePublication(Long id);

    PublicationDTO createPublication(PublicationRequestDTO publication);

    PublicationDTO updatePublication(PublicationRequestDTO publicationRequestDTO);

    List<PublicationDTO> filterByDescription(String description);
    List<PublicationDTO> filterByTitle(String title);
    List<PublicationDTO> filterByProduct_Description(String product_description);
    List<PublicationDTO> filterByProduct_Category(Category product_category);
    List<PublicationDTO> filterByState(State state);

    void deactivatePublication(Long id);

    List<PublicationDTO> filterPublications(SearchPublicationDTO searchPublicationDTO);
}
