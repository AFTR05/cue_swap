package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.*;
import co.edu.cue.cue_swap.infrastructure.exception.ComplaintException;
import co.edu.cue.cue_swap.infrastructure.exception.ProductException;
import co.edu.cue.cue_swap.infrastructure.exception.PublicationException;
import co.edu.cue.cue_swap.infrastructure.exception.UserException;
import co.edu.cue.cue_swap.infrastructure.repository.OfferRepository;
import co.edu.cue.cue_swap.infrastructure.repository.ProductRepository;
import co.edu.cue.cue_swap.infrastructure.repository.PublicationRepository;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import co.edu.cue.cue_swap.mapping.dtos.OfferDTO;
import co.edu.cue.cue_swap.mapping.dtos.OfferRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.SearchOfferDTO;
import co.edu.cue.cue_swap.mapping.mappers.OfferMapper;
import co.edu.cue.cue_swap.mapping.mappers.PublicationMapper;
import co.edu.cue.cue_swap.services.OfferService;
import lombok.AllArgsConstructor;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@AllArgsConstructor
public class OfferServiceImpl implements OfferService {

    private final OfferRepository offerRepository;
    private final UserRepository userRepository;
    private final PublicationRepository publicationRepository;
    private final ProductRepository productRepository;
    private final OfferMapper mapper;

    @Override
    public OfferDTO createOffer(OfferRequestDTO offerRequestDTO) {
        UserModel bidder = userRepository.findById(offerRequestDTO.bidder_id())
                .orElseThrow(() -> new UserException("Bidder not found"));
        Product exchanged_product = productRepository.findById(offerRequestDTO.exchanged_product_id())
                .orElseThrow(() -> new ProductException("Product not found"));
        Publication publication = publicationRepository.findById(offerRequestDTO.publication_id())
                .orElseThrow(() -> new PublicationException("Publication not found"));
        bidder.setAvailable_points(bidder.getAvailable_points() + 5);
        Offer dataModification = mapper.mapFromRequestDTO(offerRequestDTO);
        dataModification.setBidder(bidder);
        dataModification.setPublication(publication);
        dataModification.setExchanged_product(exchanged_product);
        try {
            Offer savedOffer = offerRepository.save(dataModification);
            return mapper.mapFromEntity(savedOffer);
        } catch (Exception e) {
            throw new ComplaintException("Error while saving the offer");
        }
    }

    @Override
    public List<OfferDTO> filterOffers(SearchOfferDTO searchOfferDTO) {
        List<Offer> offers = offerRepository.findAll();
        if(!Validation.isNull(searchOfferDTO.offPublicationId())){
            offers = offers.stream().filter(
                            offer -> offer.getPublication().getId().equals(searchOfferDTO.offPublicationId()))
                    .toList();
        }
        if (!Validation.isNull(searchOfferDTO.offUserId())){
            offers = offers.stream().filter(
                            publication -> publication.getBidder().getId().equals(searchOfferDTO.offUserId()))
                    .toList();
        }
        return offers.stream().map(mapper::mapFromEntity).toList();
    }
}
