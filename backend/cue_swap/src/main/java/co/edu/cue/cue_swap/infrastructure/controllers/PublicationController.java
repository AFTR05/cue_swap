package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.domain.enums.Category;
import co.edu.cue.cue_swap.domain.enums.State;
import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.PublicationDTO;
import co.edu.cue.cue_swap.mapping.dtos.PublicationRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.SearchPublicationDTO;
import co.edu.cue.cue_swap.services.PublicationService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/publication")
public class PublicationController {
    private final PublicationService service;

    @Operation(summary = "Mostrar las publicaciones con estado verdadero"
            , description = "Este método se utilizará para traer todas las publicaciones con estado verdadero")
    @GetMapping("/get-all")
    public ResponseEntity<Map<String, List<PublicationDTO>>> getAllPublications(){
        List<PublicationDTO> publications = service.getAllPublications();
        Map<String, List<PublicationDTO>> response = ResponseMessageUtil.responseMessage("publications", publications);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Crear una publicacion"
            , description = "Este método se utilizará para crear una publicacion")
    @PostMapping("/create")
    public ResponseEntity<Map<String, PublicationDTO>> createPublication(@RequestBody
                                                                 @Valid
                                                                     PublicationRequestDTO publicationRequestDTO){
        PublicationDTO createdPublication = service.createPublication(publicationRequestDTO);
        Map<String, PublicationDTO> response = ResponseMessageUtil.responseMessage("publication", createdPublication);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar solo una publicacion con un id solicitado"
            , description = "Este método se utilizará para traer a una publicacion con un id especifico")
    @GetMapping("/get-by-id/{id}")
    public ResponseEntity<Map<String, PublicationDTO>> getPublicationById(@PathVariable
                                                                  Long id) {
        PublicationDTO publication = service.getOnePublication(id);
        Map<String, PublicationDTO> response = ResponseMessageUtil.responseMessage("publication", publication);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Actualizar un publicacion"
            , description = "Este método se utilizará para actualizar un publicacion")
    @PatchMapping("/update")
    public ResponseEntity<Map<String, PublicationDTO>> updatePublication(@RequestBody
                                                                 @Valid
                                                                 PublicationRequestDTO publicationRequestDTO){
        PublicationDTO publication = service.updatePublication(publicationRequestDTO);
        Map<String, PublicationDTO> response = ResponseMessageUtil.responseMessage("publication", publication);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Cambia el estado del publicacion simulando que se elimino"
            , description = "Este método se utilizará para cambiar el estado del publicacion")
    @PatchMapping("/delete-publication/{id}")
    public ResponseEntity<Map<String, String>> deletePublication(@PathVariable Long id){
        service.deactivatePublication(id);
        Map<String, String> response = ResponseMessageUtil.responseMessage("message", "Publication deleted");
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar las publicaciones con estado verdadero con multiples filtros ya sea descripcion, titulo, descripcion de producto y categoria de producto"
            , description = "Este método se utilizará para traer todas las publicaciones con estado verdadero con multiples filtros ya sea descripcion, titulo, descripcion de producto y categoria de produc")
    @PostMapping("/filter-publication/")
    public ResponseEntity<Map<String, List<PublicationDTO>>> filterPublications(@RequestBody@Valid SearchPublicationDTO searchPublicationDTO){
        List<PublicationDTO> publicationDTOS= service.filterPublications(searchPublicationDTO);
        Map<String, List<PublicationDTO>> response = ResponseMessageUtil.responseMessage("publications",publicationDTOS);
        return ResponseEntity.ok(response);
    }


    @Operation(summary = "Mostrar las publicaciones con estado verdadero con una descripción es especifico"
            , description = "Este método se utilizará para traer todas las publicaciones con estado verdadero con una descripción es especifico")
    @GetMapping("/get-by-description/{description}")
    public ResponseEntity<Map<String, List<PublicationDTO>>> getByDescription(@PathVariable String description){
        List<PublicationDTO> publications = service.filterByDescription(description);
        Map<String, List<PublicationDTO>> response = ResponseMessageUtil.responseMessage("publications", publications);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar las publicaciones con estado verdadero con un titulo en especifico"
            , description = "Este método se utilizará para traer todas las publicaciones con estado verdadero con un titulo en especifico")
    @GetMapping("/get-by-title/{title}")
    public ResponseEntity<Map<String, List<PublicationDTO>>> getByTitle(@PathVariable String title){
        List<PublicationDTO> publications = service.filterByTitle(title);
        Map<String, List<PublicationDTO>> response = ResponseMessageUtil.responseMessage("publications", publications);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar las publicaciones con estado verdadero con un estado de publicacion especifico"
            , description = "Este método se utilizará para traer todas las publicaciones con estado verdadero con un estado de publicacion especifico")
    @GetMapping("/get-by-state/{state}")
    public ResponseEntity<Map<String, List<PublicationDTO>>> getByState(@PathVariable State state){
        List<PublicationDTO> publications = service.filterByState(state);
        Map<String, List<PublicationDTO>> response = ResponseMessageUtil.responseMessage("publications", publications);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar las publicaciones con estado verdadero con una categoria de producto especifico"
            , description = "Este método se utilizará para traer todas las publicaciones con estado verdadero con una categoria de producto especifico")
    @GetMapping("/get-by-product-category/{category}")
    public ResponseEntity<Map<String, List<PublicationDTO>>> getByProductCategory(@PathVariable Category category){
        List<PublicationDTO> publications = service.filterByProduct_Category(category);
        Map<String, List<PublicationDTO>> response = ResponseMessageUtil.responseMessage("publications", publications);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar las publicaciones con una descripcion de producto especifica"
            , description = "Este método se utilizará para traer todas las publicaciones con estado verdadero con una descripcion de producto especifica")
    @GetMapping("/get-by-product-description/{description}")
    public ResponseEntity<Map<String, List<PublicationDTO>>> getByProductDescription(@PathVariable String description){
        List<PublicationDTO> publications = service.filterByProduct_Description(description);
        Map<String, List<PublicationDTO>> response = ResponseMessageUtil.responseMessage("publications", publications);
        return ResponseEntity.ok(response);
    }
}
