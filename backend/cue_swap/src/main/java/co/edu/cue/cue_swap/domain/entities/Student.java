package co.edu.cue.cue_swap.domain.entities;


import co.edu.cue.cue_swap.domain.enums.Career;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "student")
public class Student extends UserModel {
    @Enumerated(EnumType.STRING)
    private Career career;
    private Integer semester;


}
