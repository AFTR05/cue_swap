package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.OfferDTO;
import co.edu.cue.cue_swap.mapping.dtos.OfferRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.SearchOfferDTO;

import java.util.List;

public interface OfferService {
    OfferDTO createOffer(OfferRequestDTO offerRequestDTO);

    List<OfferDTO> filterOffers(SearchOfferDTO searchOfferDTO);

}
