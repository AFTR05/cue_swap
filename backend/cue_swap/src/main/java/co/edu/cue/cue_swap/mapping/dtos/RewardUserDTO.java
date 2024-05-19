package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Reward;
import co.edu.cue.cue_swap.domain.entities.UserModel;
import lombok.Data;

@Data
public class RewardUserDTO {
    RewardDTO reward;
    UserModel userModel;
}
