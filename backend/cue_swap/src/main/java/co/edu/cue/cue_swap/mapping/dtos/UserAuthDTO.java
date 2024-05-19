package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.UserModel;
import lombok.Data;

@Data
public class UserAuthDTO {
    private UserModel userModel;
    private AuthenticationResponseDTO authenticationResponseDTO;
    private StatusDTO statusDTO;
}
