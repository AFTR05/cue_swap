package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Leader;
import co.edu.cue.cue_swap.domain.entities.UserModel;
import lombok.Data;

@Data
public class LeaderAuthDTO {
    private LeaderDTO leaderDTO;
    private AuthenticationResponseDTO authenticationResponseDTO;
    private StatusDTO statusDTO;
}
