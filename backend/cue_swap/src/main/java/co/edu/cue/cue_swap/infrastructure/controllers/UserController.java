package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.StudentAuthDTO;
import co.edu.cue.cue_swap.mapping.dtos.StudentRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserAuthDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserModelDTO;
import co.edu.cue.cue_swap.services.StudentService;
import co.edu.cue.cue_swap.services.UserService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/user")
public class UserController {
    private final UserService service;

    @Operation(summary = "Autenticar un usuario"
            , description = "Este método se utilizará para autenticar un usuario")
    @PostMapping("/authenticate")
    public ResponseEntity<Map<String, UserAuthDTO>> authenticate(@RequestBody
                                                                     @Valid
                                                                     UserModelDTO user){
        UserAuthDTO authenticatedUser = service.authenticate(user);
        Map<String, UserAuthDTO> response = ResponseMessageUtil.responseMessage("student", authenticatedUser);
        return ResponseEntity.ok(response);
    }
}
