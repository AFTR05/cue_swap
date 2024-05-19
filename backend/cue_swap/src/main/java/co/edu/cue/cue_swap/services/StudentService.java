package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.StudentAuthDTO;
import co.edu.cue.cue_swap.mapping.dtos.StudentDTO;
import co.edu.cue.cue_swap.mapping.dtos.StudentRequestDTO;

import java.util.List;

public interface StudentService {
    List<StudentDTO> getAllStudents();
    StudentDTO getOneStudent(Long id);


    StudentAuthDTO createStudent(StudentRequestDTO student);

    StudentDTO updateStudent(StudentRequestDTO studentUpdateInterfaceDTO);

    void deactivateStudent(Long id);
}
