package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.entities.User;
import co.edu.cue.cue_swap.domain.enums.OfferState;
import co.edu.cue.cue_swap.domain.enums.State;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;

public record OfferDTO(
        @JsonProperty("id") Long id,
        @JsonProperty("publication") Publication publication,
        @JsonProperty("exchanged_product") Product exchanged_product,
        @JsonProperty("bidder") User bidder,
        @JsonProperty("offerState") OfferState offerState,
        @JsonProperty("monetary_value") Double monetary_value,
        @JsonProperty("offer_date") LocalDate offer_date
) {
}
