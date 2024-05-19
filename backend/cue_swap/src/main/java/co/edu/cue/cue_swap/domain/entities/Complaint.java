package co.edu.cue.cue_swap.domain.entities;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "complaint")
public class Complaint {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String description;

    @ManyToOne()
    @JoinColumn(name = "complainant_id")
    private UserModel complainant;

    @ManyToOne()
    @JoinColumn(name = "denounced_id")
    private UserModel denounced;

}
