package co.edu.cue.cue_swap.domain.entities;


import co.edu.cue.cue_swap.domain.enums.Dependence;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "leader")
public class Leader extends User {
    Dependence dependence;

}
