package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.LeaderAuthDTO;
import co.edu.cue.cue_swap.mapping.dtos.LeaderDTO;
import co.edu.cue.cue_swap.mapping.dtos.LeaderRequestDTO;
import co.edu.cue.cue_swap.services.LeaderService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/leader")
public class LeaderController {
    private final LeaderService service;

    @Operation(summary = "Mostrar los directivos con estado verdadero"
            , description = "Este método se utilizará para traer todas los directivos con estado verdadero")
    @GetMapping("/get-all")
    public ResponseEntity<Map<String, List<LeaderDTO>>> getAllLeaders(){
        List<LeaderDTO> leaders = service.getAllLeaders();
        Map<String, List<LeaderDTO>> response = ResponseMessageUtil.responseMessage("leader", leaders);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Crear un directivo"
            , description = "Este método se utilizará para crear un directivo")
    @PostMapping("/create")
    public ResponseEntity<Map<String, LeaderAuthDTO>> createLeader(@RequestBody
                                                                 @Valid
                                                               LeaderRequestDTO leader){
        LeaderAuthDTO createdLeader = service.createLeader(leader);
        Map<String, LeaderAuthDTO> response = ResponseMessageUtil.responseMessage("leader", createdLeader);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar solo un directivo con un id solicitado"
            , description = "Este método se utilizará para traer a un directivo con un id especifico")
    @GetMapping("/get-by-id/{id}")
    public ResponseEntity<Map<String, LeaderDTO>> getLeaderById(@PathVariable
                                                                  Long id) {
        LeaderDTO student = service.getOneLeader(id);
        Map<String, LeaderDTO> response = ResponseMessageUtil.responseMessage("leader", student);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Actualizar un directivo"
            , description = "Este método se utilizará para actualizar un directivo")
    @PatchMapping("/update")
    public ResponseEntity<Map<String, LeaderDTO>> updateLeader(@RequestBody
                                                                 @Valid
                                                                 LeaderRequestDTO leaderRequestDTO){
        LeaderDTO leader = service.updateLeader(leaderRequestDTO);
        Map<String, LeaderDTO> response = ResponseMessageUtil.responseMessage("leader", leader);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Cambia el estado del estudiante simulando que se elimino"
            , description = "Este método se utilizará para cambiar el estado del estudiante")
    @PatchMapping("/delete-leader/{id}")
    public ResponseEntity<Map<String, String>> deleteLeader(@PathVariable Long id){
        service.deactiveLeader(id);
        Map<String, String> response = ResponseMessageUtil.responseMessage("message", "Leader deleted");
        return ResponseEntity.ok(response);
    }
}
