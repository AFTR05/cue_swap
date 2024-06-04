package co.edu.cue.cue_swap.domain.entities;

import co.edu.cue.cue_swap.domain.enums.TransactionState;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "transaction")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    private Offer offer;
    private LocalDate transaction_date;
    @Enumerated
    private TransactionState transaction_state;

}
