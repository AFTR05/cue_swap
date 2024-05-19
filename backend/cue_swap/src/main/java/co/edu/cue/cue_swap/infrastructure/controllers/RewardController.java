package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.services.ProductService;
import co.edu.cue.cue_swap.services.RewardService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/reward")
public class RewardController {
    private final RewardService service;

    @Operation(summary = "Mostrar las recompensas con estado verdadero"
            , description = "Este método se utilizará para traer todas las recompensas con estado verdadero")
    @GetMapping("/get-all")
    public ResponseEntity<Map<String, List<RewardDTO>>> getAllRewards(){
        List<RewardDTO> rewards = service.getAllRatings();
        Map<String, List<RewardDTO>> response = ResponseMessageUtil.responseMessage("rewards", rewards);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Crear un producto"
            , description = "Este método se utilizará para crear un producto")
    @PostMapping("/create")
    public ResponseEntity<Map<String, RewardDTO>> createReward(@RequestBody
                                                                 @Valid
                                                               RewardRequestDTO rewardRequestDTO){
        RewardDTO createdReward = service.createReward(rewardRequestDTO);
        Map<String, RewardDTO> response = ResponseMessageUtil.responseMessage("reward", createdReward);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar solo una recompensa con un id solicitado"
            , description = "Este método se utilizará para traer a una recompensa con un id especifico")
    @GetMapping("/get-by-id/{id}")
    public ResponseEntity<Map<String, RewardDTO>> getRewardById(@PathVariable
                                                                  Long id) {
        RewardDTO rewardDTO = service.getOneRating(id);
        Map<String, RewardDTO> response = ResponseMessageUtil.responseMessage("reward", rewardDTO);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Cajear una recompensa"
            , description = "Este método se utilizará para cajear una recompensa")
    @PostMapping("/redeem-reward")
    public ResponseEntity<Map<String, RewardUserDTO>> redeemReward(@RequestBody
                                                               @Valid RewardUserRequestDTO rewardUserRequestDTO){
        RewardUserDTO redeemData = service.redeemReward(rewardUserRequestDTO);
        Map<String, RewardUserDTO> response = ResponseMessageUtil.responseMessage("redeem", redeemData);
        return ResponseEntity.ok(response);
    }
}
