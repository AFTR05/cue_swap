package co.edu.cue.cue_swap.domain.entities;

import co.edu.cue.cue_swap.domain.enums.State;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "publication")
public class Publication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    private Product product;

    @ManyToOne(cascade = CascadeType.ALL)
    private UserModel owner;

    @Column(length = 50)
    private String title;
    private String description;

    private LocalDate date;

    @Enumerated(EnumType.STRING)
    private State state;

    @Column(name = "data_state")
    private Boolean dataState;
}
