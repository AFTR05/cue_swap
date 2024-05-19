package co.edu.cue.cue_swap.mapping.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;

public record RatingRequestDTO(
        @JsonProperty("comment") String comment,
        @JsonProperty("qualification") Integer qualification,
        @JsonProperty("transaction_id") Long transaction_id
) {
}
