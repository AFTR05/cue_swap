package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.services.ComplaintService;
import co.edu.cue.cue_swap.services.TransactionService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/transaction")
public class TransactionController {
    private final TransactionService service;

    @Operation(summary = "Crear una transacción"
            , description = "Este método se utilizará para crear una transacción")
    @PostMapping("/create")
    public ResponseEntity<Map<String, TransactionDTO>> createTransaction(@RequestBody
                                                                     @Valid
                                                                       TransactionRequestDTO transactionRequestDTO){
        TransactionDTO transactionDTO = service.createTransaction(transactionRequestDTO);
        Map<String, TransactionDTO> response = ResponseMessageUtil.responseMessage("transaction", transactionDTO);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar solo una transacción con un id de bidder"
            , description = "Este método se utilizará para traer a una transacción con un id de bidder")
    @GetMapping("/get-by-bidder-id/{bidder_id}")
    public ResponseEntity<Map<String, List<TransactionDTO>>> getLeaderById(@PathVariable
                                                                Long bidder_id) {
        List<TransactionDTO> transactionDTO = service.filterByOfferBidder(bidder_id);
        Map<String, List<TransactionDTO>> response = ResponseMessageUtil.responseMessage("transaction", transactionDTO);
        return ResponseEntity.ok(response);
    }
}
