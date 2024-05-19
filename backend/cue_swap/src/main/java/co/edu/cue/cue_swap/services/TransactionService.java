package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.domain.entities.Transaction;
import co.edu.cue.cue_swap.mapping.dtos.RatingDTO;
import co.edu.cue.cue_swap.mapping.dtos.RatingRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.TransactionDTO;
import co.edu.cue.cue_swap.mapping.dtos.TransactionRequestDTO;

import java.util.List;

public interface TransactionService {
    TransactionDTO createTransaction(TransactionRequestDTO transactionRequestDTO);

    List<TransactionDTO> filterByOfferBidder(Long bidder_id);

}
