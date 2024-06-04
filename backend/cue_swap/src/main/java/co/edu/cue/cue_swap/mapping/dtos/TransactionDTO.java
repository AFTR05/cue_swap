package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Offer;
import co.edu.cue.cue_swap.domain.enums.TransactionState;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;

public record TransactionDTO(
        @JsonProperty("id") Long id,
        @JsonProperty("offer") Offer offer,
        @JsonProperty("transaction_state") TransactionState transaction_state,
        @JsonProperty("transaction_date") LocalDate transaction_date
){
}
