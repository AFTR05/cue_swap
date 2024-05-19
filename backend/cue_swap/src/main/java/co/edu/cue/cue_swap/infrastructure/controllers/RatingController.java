package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.domain.entities.Rating;
import co.edu.cue.cue_swap.infrastructure.exception.RatingException;
import co.edu.cue.cue_swap.infrastructure.exception.TransactionException;
import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.services.RatingService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/rating")
public class RatingController {
    private final RatingService service;

    @Operation(summary = "Mostrar las valoraciones"
            , description = "Este método se utilizará para traer todas las valoraciones")
    @GetMapping("/get-all")
    public ResponseEntity<Map<String, List<RatingDTO>>> getAllRatings() {
        List<RatingDTO> ratings = service.getAllRatings();
        Map<String, List<RatingDTO>> response = ResponseMessageUtil.responseMessage("ratings", ratings);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Crear una valoracion"
            , description = "Este método se utilizará para crear una valoracion")
    @PostMapping("/create")
    public ResponseEntity<Map<String, RatingDTO>> createRating(@RequestBody
                                                                     @Valid
                                                                    RatingRequestDTO rating){
        RatingDTO createdRating = service.createRating(rating);
        Map<String, RatingDTO> response = ResponseMessageUtil.responseMessage("rating", createdRating);
        return ResponseEntity.ok(response);
    }


    @Operation(summary = "Mostrar solo una valoracion con el id de transferencia"
            , description = "Este método se utilizará para traer a una valoracion con un id de transferencia especifico")
    @GetMapping("/get-by-transaction-id/{id}")
    public ResponseEntity<Map<String, RatingDTO>> getRatingById(@PathVariable
                                                                  Long id) {
        RatingDTO rating = service.getOneRating(id);
        Map<String, RatingDTO> response = ResponseMessageUtil.responseMessage("rating", rating);
        return ResponseEntity.ok(response);
    }
}
