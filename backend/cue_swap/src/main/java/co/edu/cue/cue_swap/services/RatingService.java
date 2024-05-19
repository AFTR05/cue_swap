package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.*;

import java.util.List;

public interface RatingService {
    List<RatingDTO> getAllRatings();
    RatingDTO getOneRating(Long transaction_id);
    RatingDTO createRating(RatingRequestDTO ratingRequestDTO);
}
