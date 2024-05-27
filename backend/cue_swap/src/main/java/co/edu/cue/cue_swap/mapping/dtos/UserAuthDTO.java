package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.User;
import lombok.Data;

@Data
public class UserAuthDTO {
    private UserDTO user;
    private AuthenticationResponseDTO authenticationResponseDTO;
    private StatusDTO statusDTO;
}
