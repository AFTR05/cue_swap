package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.StudentAuthDTO;
import co.edu.cue.cue_swap.mapping.dtos.StudentDTO;
import co.edu.cue.cue_swap.mapping.dtos.StudentRequestDTO;
import co.edu.cue.cue_swap.services.StudentService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/student")
public class StudentController {
    private final StudentService service;

    @Operation(summary = "Mostrar los estudiantes con estado verdadero"
            , description = "Este método se utilizará para traer todas los estudiantes con estado verdadero")
    @GetMapping("/get-all")
    public ResponseEntity<Map<String, List<StudentDTO>>> getAllStudents(){
        List<StudentDTO> students = service.getAllStudents();
        Map<String, List<StudentDTO>> response = ResponseMessageUtil.responseMessage("student", students);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Crear un estudiante"
            , description = "Este método se utilizará para crear un estudiante")
    @PostMapping("/create")
    public ResponseEntity<Map<String, StudentAuthDTO>> createStudent(@RequestBody
                                           @Valid
                                           StudentRequestDTO student){
        StudentAuthDTO createdStudent = service.createStudent(student);
        Map<String, StudentAuthDTO> response = ResponseMessageUtil.responseMessage("student", createdStudent);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar solo un estudiante con un id solicitado"
            , description = "Este método se utilizará para traer a un estudiante con un id especifico")
    @GetMapping("/get-by-id/{id}")
    public ResponseEntity<Map<String, StudentDTO>> getStudentById(@PathVariable
                                           Long id) {
        StudentDTO student = service.getOneStudent(id);
        Map<String, StudentDTO> response = ResponseMessageUtil.responseMessage("student", student);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Actualizar un estudiante"
            , description = "Este método se utilizará para actualizar un estudiante")
    @PatchMapping("/update")
    public ResponseEntity<Map<String, StudentDTO>> updateStudent(@RequestBody
                                           @Valid
                                           StudentRequestDTO studentRequestDTO){
        StudentDTO student = service.updateStudent(studentRequestDTO);
        Map<String, StudentDTO> response = ResponseMessageUtil.responseMessage("student", student);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Cambia el estado del estudiante simulando que se elimino"
            , description = "Este método se utilizará para cambiar el estado del estudiante")
    @PatchMapping("/delete-student/{id}")
    public ResponseEntity<Map<String, String>> deleteStudent(@PathVariable Long id){
        service.deactivateStudent(id);
        Map<String, String> response = ResponseMessageUtil.responseMessage("message", "Student deleted");
        return ResponseEntity.ok(response);
    }
}
