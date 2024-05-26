package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.Rating;
import co.edu.cue.cue_swap.infrastructure.exception.RatingException;
import co.edu.cue.cue_swap.infrastructure.exception.TransactionException;
import co.edu.cue.cue_swap.infrastructure.repository.RatingRepository;
import co.edu.cue.cue_swap.infrastructure.repository.TransactionRepository;
import co.edu.cue.cue_swap.mapping.dtos.RatingDTO;
import co.edu.cue.cue_swap.mapping.dtos.RatingRequestDTO;
import co.edu.cue.cue_swap.mapping.mappers.RatingMapper;
import co.edu.cue.cue_swap.services.RatingService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class RatingServiceImpl implements RatingService {
    private final RatingRepository ratingRepository;
    private final TransactionRepository transactionRepository;
    private final RatingMapper mapper;


    @Override
    public List<RatingDTO> getAllRatings() {
        return ratingRepository.findAll()
                .stream()
                .map(mapper::mapFromEntity).toList();
    }

    @Override
    public RatingDTO getOneRating(Long transaction_id) {
        return mapper.mapFromEntity(ratingRepository.findByTransaction_Id(transaction_id));
    }

    @Override
    public RatingDTO createRating(RatingRequestDTO ratingRequestDTO) {
        return transactionRepository.findById(ratingRequestDTO.transaction_id())
                .map(transaction -> {
                    Rating dataModification = mapper.mapFromRequestDTO(ratingRequestDTO);
                    dataModification.setTransaction(transaction);
                    try {
                        Rating savedRating = ratingRepository.save(dataModification);
                        return mapper.mapFromEntity(savedRating);
                    } catch (Exception e) {
                        // Manejar el error adecuadamente, por ejemplo, lanzando una excepción
                        throw new RatingException("Error al guardar la valoracion");
                    }
                })
                .orElseThrow(() -> new TransactionException("Transferencia no encontrada"));
    }
}
