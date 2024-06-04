package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.Offer;
import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.entities.Rating;
import co.edu.cue.cue_swap.domain.entities.Transaction;
import co.edu.cue.cue_swap.domain.enums.OfferState;
import co.edu.cue.cue_swap.domain.enums.State;
import co.edu.cue.cue_swap.domain.enums.TransactionState;
import co.edu.cue.cue_swap.infrastructure.exception.OfferException;
import co.edu.cue.cue_swap.infrastructure.exception.RatingException;
import co.edu.cue.cue_swap.infrastructure.exception.TransactionException;
import co.edu.cue.cue_swap.infrastructure.repository.OfferRepository;
import co.edu.cue.cue_swap.infrastructure.repository.TransactionRepository;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import co.edu.cue.cue_swap.mapping.dtos.TransactionDTO;
import co.edu.cue.cue_swap.mapping.dtos.TransactionRequestDTO;
import co.edu.cue.cue_swap.mapping.mappers.TransactionMapper;
import co.edu.cue.cue_swap.services.TransactionService;
import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class TransactionServiceImpl implements TransactionService {
    private final OfferRepository offerRepository;
    private final TransactionRepository transactionRepository;
    private final TransactionMapper mapper;

    @Override
    public TransactionDTO createTransaction(TransactionRequestDTO transactionRequestDTO) {
        return offerRepository.findById(transactionRequestDTO.offer_id())
                .map(offer -> {
                    Transaction dataModification = mapper.mapFromRequestDTO(transactionRequestDTO);
                    dataModification.setOffer(offer);
                    dataModification.setTransaction_state(TransactionState.INCOMPLETA);
                    dataModification.getOffer().getBidder();

                    dataModification.setTransaction_date(LocalDate.now());
                    try {
                        validatePublicationAvailableState(dataModification);
                        changePublicationState(dataModification);
                        changeOfferState(dataModification);
                        Transaction savedTransaction = transactionRepository.save(dataModification);
                        return mapper.mapFromEntity(savedTransaction);
                    } catch (Exception e) {
                        throw new TransactionException("Error al guardar la transaccion");
                    }
                })
                .orElseThrow(() -> new OfferException("Oferta no encontrada"));
    }

    private void changePublicationState(@NotNull Transaction transaction){
        transaction.getOffer().getPublication().setState(
                transaction.getOffer().getExchanged_product() != null
                        ? State.INTERCAMBIADO
                        : State.VENDIDO
        );
    }

    private void validatePublicationAvailableState(@NotNull Transaction transaction){
        if (transaction.getOffer().getPublication().getState() != State.DISPONIBLE){
            throw new TransactionException("Transaccion no disponible");
        }
    }

    private void changeOfferState(@NotNull Transaction transaction){
        List<Offer> offersByPublication = offerRepository.findAll().stream()
                .filter(offer -> offer.getPublication().getId().equals(transaction.getOffer().getPublication().getId()))
                .toList();
        offersByPublication.forEach(offer ->
                offer.setOfferState(offer.getId().equals(transaction.getOffer().getId())
                        ? OfferState.ACEPTADO
                        : OfferState.CANCELADO
                )
        );
    }

    @Override
    public List<TransactionDTO> filterByOfferBidder(Long bidder_id) {
        return mapper.mapFrom(transactionRepository.findByOffer_Bidder_Id(bidder_id).stream().toList());
    }
}
