package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Student;
import co.edu.cue.cue_swap.domain.entities.UserModel;
import lombok.Data;

@Data
public class StudentAuthDTO {
    private StudentDTO studentDTO;
    private AuthenticationResponseDTO authenticationResponseDTO;
    private StatusDTO statusDTO;
}
