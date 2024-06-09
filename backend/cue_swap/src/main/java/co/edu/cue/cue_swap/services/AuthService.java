package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.UserAuthDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserModelDTO;

public interface AuthService {
    UserAuthDTO authenticate(UserModelDTO userModelDTO);

    UserAuthDTO authByHeader(String token);
}
