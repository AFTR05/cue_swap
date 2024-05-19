package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.entities.UserModel;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.ManyToOne;

import java.time.LocalDate;

public record OfferDTO(
        @JsonProperty("publication") Publication publication,
        @JsonProperty("exchanged_product") Product exchanged_product,
        @JsonProperty("bidder") UserModel bidder,
        @JsonProperty("monetary_value") Double monetary_value,
        @JsonProperty("offer_date") LocalDate offer_date
) {
}
