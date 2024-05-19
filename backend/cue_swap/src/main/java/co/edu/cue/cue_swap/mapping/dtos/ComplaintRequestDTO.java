package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.UserModel;
import com.fasterxml.jackson.annotation.JsonProperty;

public record ComplaintRequestDTO (
        @JsonProperty("description") String username,
        @JsonProperty("complainant_id") Long complainant_id,
        @JsonProperty("denounced_id") Long denounced_id
){

}