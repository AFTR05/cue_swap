package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.UserModelDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserAuthDTO;

public interface UserService {
    UserAuthDTO authenticate(UserModelDTO userModelDTO);


}
