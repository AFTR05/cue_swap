package co.edu.cue.cue_swap.mapping.dtos;

import lombok.Data;

@Data
public class StudentAuthDTO {
    private StudentDTO studentDTO;
    private AuthenticationResponseDTO authenticationResponseDTO;
    private StatusDTO statusDTO;
}
