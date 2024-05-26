package co.edu.cue.cue_swap.domain.entities;

import co.edu.cue.cue_swap.domain.enums.Category;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String image;

    private Double price;

    @ManyToOne()
    @JoinColumn(name = "user_id")
    private User user;

    private String description;

    @Enumerated(EnumType.STRING)
    private Category category;

    private Boolean data_state;
}
