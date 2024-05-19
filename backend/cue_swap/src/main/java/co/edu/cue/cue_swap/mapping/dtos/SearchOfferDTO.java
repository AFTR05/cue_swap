package co.edu.cue.cue_swap.mapping.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;

public record SearchOfferDTO(
        @JsonProperty("off_publication_id") Long offPublicationId,
        @JsonProperty("off_user_id") Long offUserId
){

}
