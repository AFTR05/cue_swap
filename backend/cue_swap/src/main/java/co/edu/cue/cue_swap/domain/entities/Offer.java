package co.edu.cue.cue_swap.domain.entities;

import co.edu.cue.cue_swap.domain.enums.OfferState;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "offer")
public class Offer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Publication publication;

    @ManyToOne
    @Nullable
    private Product exchanged_product;

    @ManyToOne
    private User bidder;

    @Enumerated
    private OfferState offerState;

    private Double monetary_value;

    private LocalDate offer_date;

}
