package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.UserModel;
import com.fasterxml.jackson.annotation.JsonProperty;

public record ComplaintDTO (
        @JsonProperty("description") String username,
        @JsonProperty("complainant") UserModel complainant,
        @JsonProperty("denounced") UserModel denounced
){

}
