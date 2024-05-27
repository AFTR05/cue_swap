package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.exception.UserException;
import co.edu.cue.cue_swap.infrastructure.utils.Constants;
import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.services.StudentService;
import co.edu.cue.cue_swap.services.UserService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
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
        Map<String, UserAuthDTO> response = ResponseMessageUtil.responseMessage("user_data", authenticatedUser);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Autenticar un usuario por el header"
            , description = "Este método se utilizará para autenticar un usuario por el header")
    @GetMapping("/auth-by-header")
    public ResponseEntity<Map<String, UserAuthDTO>> authByHeader(HttpServletRequest request){
        String authHeader = request.getHeader(Constants.AUTHORIZATION);
        if (authHeader == null || !authHeader.startsWith(Constants.BEARER)) {
            throw new UserException("Token invalid");
        }
        String token = authHeader.substring(Constants.SUB_STRING_HEADER_HTTP);
        UserAuthDTO authenticatedUser = service.authByHeader(token);
        Map<String, UserAuthDTO> response = ResponseMessageUtil.responseMessage("user_data", authenticatedUser);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar los usuarios con estado verdadero"
            , description = "Este método se utilizará para traer todas los usuarios con estado verdadero")
    @GetMapping("/get-all")
    public ResponseEntity<Map<String, List<UserDTO>>> getAllUsers(){
        List<UserDTO> users = service.getAllUsers();
        Map<String, List<UserDTO>> response = ResponseMessageUtil.responseMessage("users", users);
        return ResponseEntity.ok(response);
    }
}
