package co.edu.cue.cue_swap.mapping.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;

public record ComplaintRequestDTO (
        @JsonProperty("description") String description,
        @JsonProperty("complainant_id") Long complainant_id,
        @JsonProperty("denounced_id") Long denounced_id
){

}