package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.User;
import lombok.Data;

@Data
public class RewardUserDTO {
    RewardDTO reward;
    User user;
}
