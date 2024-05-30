package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.Leader;
import co.edu.cue.cue_swap.domain.entities.Token;
import co.edu.cue.cue_swap.domain.entities.User;
import co.edu.cue.cue_swap.domain.enums.CodeMessage;
import co.edu.cue.cue_swap.infrastructure.exception.LeaderException;
import co.edu.cue.cue_swap.infrastructure.exception.UserException;
import co.edu.cue.cue_swap.infrastructure.repository.LeaderRepository;
import co.edu.cue.cue_swap.infrastructure.repository.TokenRepository;
import co.edu.cue.cue_swap.infrastructure.utils.PasswordUtil;
import co.edu.cue.cue_swap.infrastructure.utils.TokenGenerator;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.mapping.mappers.LeaderMapper;
import co.edu.cue.cue_swap.security.JwtService;
import co.edu.cue.cue_swap.services.LeaderService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
@Service
@AllArgsConstructor
public class LeaderServiceImpl implements LeaderService {
    private final LeaderRepository leaderRepository;
    private final TokenRepository tokenRepository;
    private final LeaderMapper mapper;
    private final JwtService jwtService;
    private final PasswordEncoder passwordEncoder;

    /**
     * Devuelve una lista de todos los directivos con estado true.
     *
     * @return Lista de objetos LeaderDTO que representan a los directivos.
     */
    @Override
    public List<LeaderDTO> getAllLeaders() {
            return leaderRepository.findAll()
                    .stream()
                    .filter(User::getData_state)
                    .map(mapper::mapFromEntity).toList();
    }

    /**
     * Devuelve un solo directivo.
     *
     * @param id Long Id que representa el id del directivo.
     * @return Objeto LeaderDTO que representa al directivo con la id.
     */
    @Override
    public LeaderDTO getOneLeader(Long id) {
        return leaderRepository.findById(id)
                .map(leader -> {
                    try {
                        return mapper.mapFromEntity(leader);
                    } catch (Exception e) {
                        throw new LeaderException("Error al obtener el directivo");
                    }
                })
                .orElseThrow(() -> new UserException("Usuario no encontrado"));
    }

    /**
     * Crea un nuevo directivo y se hace la adaptacion de hash en el guardado.
     *
     * @param leader Objeto LeaderRequestDTO que contiene los detalles del directivo a crear.
     * @return Objeto LeaderAuthDTO que representa al directivo creado.
     */
    @Override
    public LeaderAuthDTO createLeader(LeaderRequestDTO leader) {
        Leader dataModification=mapper.mapFromRequestDTO(leader);
        if (leaderRepository.findAll().stream().anyMatch(stu -> stu.getNid().equals(leader.nid()))) throw new UserException("Usuario Repetido");
        if (leaderRepository.findAll().stream().anyMatch(stu -> stu.getAccount().getUsername().equals(leader.username()))) throw new UserException("Usuario Repetido");
        dataModification.getAccount().setPassword(passwordEncoder.encode(leader.password()));
        dataModification.setData_state(true);
        dataModification.setAvailable_points(0);
        LeaderAuthDTO leaderAuthDTO=new LeaderAuthDTO();
        LeaderDTO leaderDTO=mapper.mapFromEntity(dataModification);
        Leader newLeader = leaderRepository.save(mapper.mapFromDTO(leaderDTO));
        if (!Validation.isNull(newLeader)){
            String jwt = jwtService.generateToken(newLeader);
            Token token = TokenGenerator.generateToken(jwt,newLeader );
            List<Token> validTokens = tokenRepository.findByUserAndIsLogOut(newLeader, false);
            if (!validTokens.isEmpty()) {
                validTokens.forEach(t -> {
                    t.setIsLogOut(true);
                });
            }
            tokenRepository.saveAll(validTokens);
            tokenRepository.save(token);
            leaderAuthDTO.setAuthenticationResponseDTO(new AuthenticationResponseDTO(jwt));
            leaderAuthDTO.setLeaderDTO(mapper.mapFromEntity(newLeader));
            leaderAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.SUCCESSFUL.getCode(), CodeMessage.SUCCESSFUL.getMessage()));
            return leaderAuthDTO;
        } else {
            leaderAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.ERROR_INVALID_RESULT.getCode(), CodeMessage.ERROR_INVALID_RESULT.getMessage()));
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Directivo no encontrado");
        }
    }



    /**
     * Actualizar un nuevo directivo.
     *
     * @param leaderRequestDTO Objeto LeaderRequestDTO que contiene los detalles del directivo a actualizar.
     * @return Objeto LeaderDTO que representa al directivo actualizado.
     */
    @Override
    public LeaderDTO updateLeader(LeaderRequestDTO leaderRequestDTO) {
        Leader dataModified = mapper.mapFromRequestDTO(leaderRequestDTO);
        if (leaderRepository.findAll().stream().anyMatch(stu -> stu.getNid().equals(leaderRequestDTO.nid()))) throw new UserException("Usuario Repetido");
        dataModified.getAccount().setPassword(PasswordUtil.hashPassword(leaderRequestDTO.password()));
        dataModified.setData_state(true);
        return mapper.mapFromEntity(leaderRepository.save(dataModified));
    }

    /**
     * Desactica el directivo o cambia estado de la data simulando eliminacion.
     *
     * @param id Objeto Long que contiene los detalles del directivo a crear.
     */
    @Override
    public void deactiveLeader(Long id) {
        Leader leader=leaderRepository.getReferenceById(id);
        leader.setData_state(false);
        leaderRepository.save(leader);
    }
}
