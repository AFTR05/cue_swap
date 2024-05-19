package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.enums.State;

import java.time.LocalDate;

public record PublicationRequestDTO(
        Long id,
        Long product_id,
        Long owner_id,
        String title,
        String description,
        LocalDate date,
        State state
) {
}
