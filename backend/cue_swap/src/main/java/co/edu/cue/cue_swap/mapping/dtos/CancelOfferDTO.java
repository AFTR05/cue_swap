package co.edu.cue.cue_swap.mapping.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;

public record CancelOfferDTO(
                             @JsonProperty("offer_id") Long id
){

}
