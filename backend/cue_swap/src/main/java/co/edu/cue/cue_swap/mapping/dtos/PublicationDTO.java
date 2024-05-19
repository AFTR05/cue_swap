package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.UserModel;
import co.edu.cue.cue_swap.domain.enums.State;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;

public record PublicationDTO (
        @JsonProperty("product") Product product,
        @JsonProperty("owner") UserModel owner,
        @JsonProperty("title") String title,
        @JsonProperty("description") String description,
        @JsonProperty("date") LocalDate date,
        @JsonProperty("state") State state,
        @JsonProperty("data_state") Boolean data_state
){
}
