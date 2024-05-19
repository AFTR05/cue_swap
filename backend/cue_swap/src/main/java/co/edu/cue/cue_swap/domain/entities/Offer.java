package co.edu.cue.cue_swap.domain.entities;

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
    private Product exchanged_product;

    @ManyToOne
    private UserModel bidder;

    private Double monetary_value;

    private LocalDate offer_date;

}
