package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.enums.Category;
import com.fasterxml.jackson.annotation.JsonProperty;

public record ProductRequestDTO(
        @JsonProperty("id") Long id,
        @JsonProperty("name") String name,
        @JsonProperty("image") String image,
        @JsonProperty("price") Double price,
        @JsonProperty("description") String description,
        @JsonProperty("category") Category category,
        @JsonProperty("user_id") Long user_id
) {
}
