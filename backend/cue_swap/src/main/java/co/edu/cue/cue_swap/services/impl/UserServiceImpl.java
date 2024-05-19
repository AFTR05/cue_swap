package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.UserModel;
import co.edu.cue.cue_swap.domain.enums.CodeMessage;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.infrastructure.utils.PasswordUtil;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import co.edu.cue.cue_swap.mapping.dtos.StatusDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserModelDTO;
import co.edu.cue.cue_swap.security.JwtService;
import co.edu.cue.cue_swap.mapping.dtos.AuthenticationResponseDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserAuthDTO;
import co.edu.cue.cue_swap.services.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;

    @Override
    public UserAuthDTO authenticate(UserModelDTO userModelDTO) {
        UserAuthDTO userAuthDTO = new UserAuthDTO();
        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userModelDTO.username(),userModelDTO.password()));
        UserModel userModel=userRepository.findByAccount_Username(userModelDTO.username());
        if (!Validation.isNull(userModel)){
            String token = jwtService.generateToken(userModel);
            userAuthDTO.setAuthenticationResponseDTO(new AuthenticationResponseDTO(token));
            userAuthDTO.setUserModel(userModel);
            userAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.SUCCESSFUL.getCode(),CodeMessage.SUCCESSFUL.getMessage()));
            return userAuthDTO;
        }
        userAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.ERROR_INVALID_RESULT.getCode(),CodeMessage.ERROR_INVALID_RESULT.getMessage()));
        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Usuario no encontrado");
    }
}
