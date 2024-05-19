package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.ComplaintDTO;
import co.edu.cue.cue_swap.mapping.dtos.ComplaintRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.RatingDTO;
import co.edu.cue.cue_swap.mapping.dtos.RatingRequestDTO;
import co.edu.cue.cue_swap.services.ComplaintService;
import co.edu.cue.cue_swap.services.RatingService;
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
@RequestMapping("/api/complaint")
public class ComplaintController {
    private final ComplaintService service;

    @Operation(summary = "Crear una denuncia"
            , description = "Este método se utilizará para crear una denuncia")
    @PostMapping("/create")
    public ResponseEntity<Map<String, ComplaintDTO>> createComplaint(@RequestBody
                                                                @Valid
                                                                     ComplaintRequestDTO complaint){
        ComplaintDTO complaintDTO = service.createComplaint(complaint);
        Map<String, ComplaintDTO> response = ResponseMessageUtil.responseMessage("complaint", complaintDTO);
        return ResponseEntity.ok(response);
    }
}
