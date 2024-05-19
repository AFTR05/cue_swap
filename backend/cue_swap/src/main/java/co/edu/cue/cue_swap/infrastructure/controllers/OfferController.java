package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.services.OfferService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/offer")
public class OfferController {
    private final OfferService service;

    @Operation(summary = "Crear una oferta"
            , description = "Este método se utilizará para crear una oferta")
    @PostMapping("/create")
    public ResponseEntity<Map<String, OfferDTO>> createOffer(@RequestBody
                                                                     @Valid
                                                                     OfferRequestDTO offer){
        OfferDTO offerDTO = service.createOffer(offer);
        Map<String, OfferDTO> response = ResponseMessageUtil.responseMessage("offer", offerDTO);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar las ofertas con estado verdadero con multiples filtros"
            , description = "Este método se utilizará para traer todas las publicaciones con estado verdadero con multiples filtros")
    @PostMapping("/filter-offer/")
    public ResponseEntity<Map<String, List<OfferDTO>>> filterOffers(@RequestBody@Valid SearchOfferDTO searchOfferDTO){
        List<OfferDTO> offerDTOS= service.filterOffers(searchOfferDTO);
        Map<String, List<OfferDTO>> response = ResponseMessageUtil.responseMessage("offers",offerDTOS);
        return ResponseEntity.ok(response);
    }
}
