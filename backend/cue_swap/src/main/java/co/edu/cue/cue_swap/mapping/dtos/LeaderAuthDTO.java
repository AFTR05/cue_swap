package co.edu.cue.cue_swap.mapping.dtos;

import lombok.Data;

@Data
public class LeaderAuthDTO {
    private LeaderDTO leaderDTO;
    private AuthenticationResponseDTO authenticationResponseDTO;
    private StatusDTO statusDTO;
}
