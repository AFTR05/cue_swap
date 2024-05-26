package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.User;
import co.edu.cue.cue_swap.domain.enums.Category;
import com.fasterxml.jackson.annotation.JsonProperty;

public record ProductDTO (

        @JsonProperty("name") String name,
        @JsonProperty("image") String image,
        @JsonProperty("price") Double price,
        @JsonProperty("description") String description,
        @JsonProperty("category") Category category,
        User user,
        Boolean data_state){
}
