package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Offer;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;

public record TransactionDTO(
        @JsonProperty("offer") Offer offer,
        @JsonProperty("transaction_date") LocalDate transaction_date
){
}
