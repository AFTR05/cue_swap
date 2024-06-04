package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Transaction;
import com.fasterxml.jackson.annotation.JsonProperty;

public record RatingDTO(
        @JsonProperty("comment") String comment,
        @JsonProperty("qualification") Integer qualification,
        @JsonProperty("transaction") Transaction transaction
){
}
