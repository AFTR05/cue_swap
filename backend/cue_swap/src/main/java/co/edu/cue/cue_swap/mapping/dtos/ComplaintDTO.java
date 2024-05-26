package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.User;
import com.fasterxml.jackson.annotation.JsonProperty;

public record ComplaintDTO (
        @JsonProperty("description") String description,
        @JsonProperty("complainant") User complainant,
        @JsonProperty("denounced") User denounced
){

}
