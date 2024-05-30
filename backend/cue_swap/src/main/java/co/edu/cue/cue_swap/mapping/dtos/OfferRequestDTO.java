package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.enums.OfferState;
import co.edu.cue.cue_swap.domain.enums.State;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;

public record OfferRequestDTO(
        @JsonProperty("publication_id") Long publication_id,
        @JsonProperty("exchanged_product_id") Long exchanged_product_id,
        @JsonProperty("bidder_id") Long bidder_id,
        @JsonProperty("offerState") OfferState offerState,
        @JsonProperty("monetary_value") Double monetary_value,
        @JsonProperty("offer_date") LocalDate offer_date
) {
}
