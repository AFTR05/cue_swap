package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Offer;
import co.edu.cue.cue_swap.domain.entities.Transaction;
import co.edu.cue.cue_swap.mapping.dtos.OfferDTO;
import co.edu.cue.cue_swap.mapping.dtos.OfferRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.TransactionDTO;
import co.edu.cue.cue_swap.mapping.dtos.TransactionRequestDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper(componentModel = "spring")
@Component
public interface OfferMapper {
    /**
     * Hace un map desde Offer entidad a OfferDTO
     *
     * @param source Objeto Offer que contiene los detalles de la oferta
     * @return Objeto OfferDTO que representa la oferta en un DTO.
     */
    OfferDTO mapFromEntity(Offer source);

    /**
     * Hace un map desde OfferDTO a Offer entidad
     *
     * @param source Objeto OfferDTO que contiene los detalles de la oferta DTO
     * @return Objeto Offer que representa la oferta en entidad.
     */
    Offer mapFromDTO(OfferDTO source);


    /**
     * Hace un map desde OfferRequestDTO a Offer entidad
     *
     * @param source Objeto OfferRequestDTO que contiene los detalles de la oferta DTO
     * @return Objeto Offer que representa la oferta en entidad.
     */
    @Mapping(target = "publication.id", source = "source.publication_id")
    @Mapping(target = "exchanged_product.id", source = "source.exchanged_product_id")
    @Mapping(target = "bidder.id", source = "source.bidder_id")
    Offer mapFromRequestDTO(OfferRequestDTO source);


    /**
     * Hace un map desde una lista Offer a una lista de OfferDTO
     *
     * @param source Lista de Objeto Offer que contiene los detalles de la oferta entidad
     * @return Lista de Objeto OfferDTO que representa la oferta en DTO.
     */
    List<OfferDTO> mapFrom(List<Offer> source);

    /**
     * Hace un map desde una lista OfferDTO a una lista de Offer entidad
     *
     * @param source Lista de Objeto OfferDTO que contiene los detalles de la oferta DTO
     * @return Lista de Objeto Offer que representa la oferta entidad.
     */
    List<Offer> mapFromListDTO(List<OfferDTO> source);
}
