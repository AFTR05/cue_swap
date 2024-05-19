package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Rating;
import co.edu.cue.cue_swap.mapping.dtos.*;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper(componentModel = "spring")
@Component
public interface RatingMapper {
    /**
     * Hace un map desde Rating entidad a RatingDTO
     *
     * @param source Objeto Product que contiene los detalles de la valoracion
     * @return Objeto RatingDTO que representa la valoracion en un DTO.
     */
    RatingDTO mapFromEntity(Rating source);

    /**
     * Hace un map desde RatingDTO a Rating entidad
     *
     * @param source Objeto RatingDTO que contiene los detalles de la valoracion DTO
     * @return Objeto Rating que representa la valoracion en entidad.
     */
    Rating mapFromDTO(RatingDTO source);


    /**
     * Hace un map desde RatingRequestDTO a Rating entidad
     *
     * @param source Objeto RatingRequestDTO que contiene los detalles de la valoracion DTO
     * @return Objeto Rating que representa la valoracion en entidad.
     */
    @Mapping(target = "transaction.id", source = "source.transaction_id")
    Rating mapFromRequestDTO(RatingRequestDTO source);

    /**
     * Hace un map desde una lista Rating a una lista de RatingDTO DTO
     *
     * @param source Lista de Objeto Rating que contiene los detalles de la valoracion entidad
     * @return Lista de Objeto RatingDTO que representa la valoracion en DTO.
     */
    List<RatingDTO> mapFrom(List<Rating> source);

    /**
     * Hace un map desde una lista RatingDTO a una lista de Rating entidad
     *
     * @param source Lista de Objeto RatingDTO que contiene los detalles de la valoracion entidad
     * @return Lista de Objeto Rating que representa de la valoracion entidad.
     */
    List<Rating> mapFromListDTO(List<RatingDTO> source);
}
