package co.edu.cue.cue_swap.services.impl;
import co.edu.cue.cue_swap.domain.entities.Token;
import co.edu.cue.cue_swap.domain.entities.User;
import co.edu.cue.cue_swap.domain.enums.CodeMessage;
import co.edu.cue.cue_swap.infrastructure.repository.TokenRepository;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.infrastructure.utils.TokenGenerator;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.mapping.mappers.UserMapper;
import co.edu.cue.cue_swap.security.JwtService;
import co.edu.cue.cue_swap.services.AuthService;
import co.edu.cue.cue_swap.services.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserMapper mapper;
    private final UserRepository userRepository;
    private final TokenRepository tokenRepository;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;

    @Override
    public UserAuthDTO authenticate(UserModelDTO userModelDTO) {
        UserAuthDTO userAuthDTO = new UserAuthDTO();
        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userModelDTO.username(),userModelDTO.password()));
        User user =userRepository.findByAccount_Username(userModelDTO.username());
        if (!Validation.isNull(user)){

            String jwt = jwtService.generateToken(user);
            Token token = TokenGenerator.generateToken(jwt, user);
            List<Token> validTokens = tokenRepository.findByUserAndIsLogOut(user, false);
            if (!validTokens.isEmpty()) {
                validTokens.forEach(t -> {
                    t.setIsLogOut(true);
                });
            }
            tokenRepository.saveAll(validTokens);
            tokenRepository.save(token);
            userAuthDTO.setAuthenticationResponseDTO(new AuthenticationResponseDTO(jwt));
            userAuthDTO.setUser(mapper.mapFromEntity(user));
            userAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.SUCCESSFUL.getCode(),CodeMessage.SUCCESSFUL.getMessage()));
            return userAuthDTO;
        }
        userAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.ERROR_INVALID_RESULT.getCode(),CodeMessage.ERROR_INVALID_RESULT.getMessage()));
        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Usuario no encontrado");
    }

    @Override
    public UserAuthDTO authByHeader(String token) {
        try {
            UserAuthDTO userAuthDTO = new UserAuthDTO();
            String username = jwtService.extractUsername(token);
            User user =userRepository.findByAccount_Username(username);
            userAuthDTO.setAuthenticationResponseDTO(new AuthenticationResponseDTO(token));
            userAuthDTO.setUser(mapper.mapFromEntity(user));
            userAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.SUCCESSFUL.getCode(),CodeMessage.SUCCESSFUL.getMessage()));
            return userAuthDTO;
        }catch (Exception e){
            UserAuthDTO userAuthDTO = new UserAuthDTO();
            userAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.ERROR_INVALID_RESULT.getCode(),CodeMessage.ERROR_INVALID_RESULT.getMessage()));
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Usuario no encontrado");
        }
    }

    @Override
    public List<UserDTO> getAllUsers() {
        return userRepository.findAll()
                .stream()
                .filter(User::getData_state)
                .map(mapper::mapFromEntity).toList();
    }
}
