package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.UserDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserModelDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserAuthDTO;

import java.util.List;

public interface UserService {
    UserAuthDTO authenticate(UserModelDTO userModelDTO);

    UserAuthDTO authByHeader(String token);

    List<UserDTO> getAllUsers();


}
