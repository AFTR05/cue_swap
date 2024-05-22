package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.Leader;
import co.edu.cue.cue_swap.domain.entities.Student;
import co.edu.cue.cue_swap.domain.entities.Token;
import co.edu.cue.cue_swap.domain.entities.UserModel;
import co.edu.cue.cue_swap.domain.enums.CodeMessage;
import co.edu.cue.cue_swap.infrastructure.exception.StudentException;
import co.edu.cue.cue_swap.infrastructure.exception.UserException;
import co.edu.cue.cue_swap.infrastructure.repository.StudentRepository;
import co.edu.cue.cue_swap.infrastructure.repository.TokenRepository;
import co.edu.cue.cue_swap.infrastructure.utils.TokenGenerator;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.mapping.mappers.StudentMapper;
import co.edu.cue.cue_swap.security.JwtService;
import co.edu.cue.cue_swap.services.StudentService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import co.edu.cue.cue_swap.infrastructure.utils.PasswordUtil;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
@AllArgsConstructor
public class StudentServiceImpl implements StudentService {

    private final StudentRepository studentRepository;
    private final TokenRepository tokenRepository;
    private final StudentMapper mapper;
    private final JwtService jwtService;

    /**
     * Devuelve una lista de todos los estudiantes con estado true.
     *
     * @return Lista de objetos StudentDTO que representan a los estudiantes.
     */
    @Override
    public List<StudentDTO> getAllStudents() {
        return studentRepository.findAll()
                .stream()
                .filter(UserModel::getData_state)
                .map(mapper::mapFromEntity).toList();
    }


    /**
     * Devuelve un solo estudiante.
     *
     * @param id Long Id que representa el id del estudiante.
     * @return Objeto StudentDTO que representa al estudiante con la id.
     */
    @Override
    public StudentDTO getOneStudent(Long id) {
        return studentRepository.findById(id)
                .map(student -> {
                    try {
                        return mapper.mapFromEntity(student);
                    } catch (Exception e) {
                        // Manejar el error adecuadamente, por ejemplo, lanzando una excepción
                        throw new StudentException("Error al obtener el estudiante");
                    }
                })
                .orElseThrow(() -> new UserException("Usuario no encontrado"));
    }

    /**
     * Crea un nuevo estudiante y se hace la adaptacion de hash en el guardado.
     *
     * @param student Objeto StudentRequestDTO que contiene los detalles del estudiante a crear.
     * @return Objeto StudentDTO que representa al estudiante creado.
     */
    @Override
    public StudentAuthDTO createStudent(StudentRequestDTO student) {
        Student dataModification=mapper.mapFromRequestDTO(student);
        if (studentRepository.findAll().stream().anyMatch(stu -> stu.getNid().equals(student.nid()))) throw new UserException("Usuario Repetido");
        if (studentRepository.findAll().stream().anyMatch(stu -> stu.getAccount().getUsername().equals(student.username()))) throw new UserException("Usuario Repetido");
        dataModification.getAccount().setPassword(PasswordUtil.hashPassword(student.password()));
        dataModification.setData_state(true);
        dataModification.setAvailable_points(0);
        StudentAuthDTO studentAuthDTO = new StudentAuthDTO();
        StudentDTO studentDTO=mapper.mapFromEntity(dataModification);
        Student newStudent = studentRepository.save(mapper.mapFromDTO(studentDTO));
        if (!Validation.isNull(newStudent)){
            String jwt = jwtService.generateToken(newStudent);
            Token token = TokenGenerator.generateToken(jwt, newStudent);
            List<Token> validTokens = tokenRepository.findByUserAndIsLogOut(newStudent, false);
            if (!validTokens.isEmpty()) {
                validTokens.forEach(t -> {
                    t.setIsLogOut(true);
                });
            }
            tokenRepository.saveAll(validTokens);
            tokenRepository.save(token);
            studentAuthDTO.setAuthenticationResponseDTO(new AuthenticationResponseDTO(jwt));
            studentAuthDTO.setStudentDTO(mapper.mapFromEntity(newStudent));
            studentAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.SUCCESSFUL.getCode(),CodeMessage.SUCCESSFUL.getMessage()));
            return studentAuthDTO;
        } else {
            studentAuthDTO.setStatusDTO(new StatusDTO(CodeMessage.ERROR_INVALID_RESULT.getCode(),CodeMessage.ERROR_INVALID_RESULT.getMessage()));
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Estudiante no encontrado");
        }
    }

    /**
     * Actualizar un nuevo estudiante.
     *
     * @param updateUser Objeto StudentRequestDTO que contiene los detalles del estudiante a actualizar.
     * @return Objeto StudentDTO que representa al estudiante actualizado.
     */
    @Override
    public StudentDTO updateStudent(StudentRequestDTO updateUser) {
        Student dataModified = mapper.mapFromRequestDTO(updateUser);
        if (studentRepository.findAll().stream().anyMatch(stu -> stu.getNid().equals(updateUser.nid()))) throw new UserException("Usuario Repetido");
        dataModified.getAccount().setPassword(PasswordUtil.hashPassword(updateUser.password()));
        dataModified.setData_state(true);
        return mapper.mapFromEntity(studentRepository.save(dataModified));
    }


    /**
     * Desactica el estudiante o cambia estado de la data simulando eliminacion.
     *
     * @param id Objeto Long que contiene los detalles del estudiante a crear.
     */
    @Override
    public void deactivateStudent(Long id) {
        Student student=studentRepository.getReferenceById(id);
        student.setData_state(false);
        studentRepository.save(student);
    }
}
