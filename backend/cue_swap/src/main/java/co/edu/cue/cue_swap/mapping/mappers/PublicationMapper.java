package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.mapping.dtos.PublicationDTO;
import co.edu.cue.cue_swap.mapping.dtos.PublicationRequestDTO;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper(componentModel = "spring")
@Component
public interface PublicationMapper {

    /**
     * Hace un map desde Publication entidad a PublicationDTO
     *
     * @param source Objeto Publication que contiene los detalles del directivo
     * @return Objeto PublicationDTO que representa el directivo en un DTO.
     */
    @Mapping(target = "product", source = "source.product")
    @Mapping(target = "data_state", source = "source.dataState")
    PublicationDTO mapFromEntity(Publication source);

    /**
     * Hace un map desde PublicationDTO a Publication entidad
     *
     * @param source Objeto PublicationDTO que contiene los detalles del directivo DTO
     * @return Objeto Publication que representa el directivo en entidad.
     */
    @Mapping(target = "dataState", source = "source.data_state")
    @Mapping(target = "product", source = "source.product")
    Publication mapFromDTO(PublicationDTO source);

    /**
     * Hace un map desde PublicationRequestDTO a Publication entidad
     *
     * @param source Objeto PublicationRequestDTO que contiene los detalles del directivo DTO
     * @return Objeto Publication que representa el directivo en entidad.
     */
    Publication mapFromRequestDTO(PublicationRequestDTO source);

    /**
     * Hace un map desde una lista Publication a una lista de PublicationDTO entidad
     *
     * @param source Lista de Objeto Publication que contiene los detalles del directivo entidad
     * @return Lista de Objeto PublicationDTO que representa el directivo en DTO.
     */
    List<PublicationDTO> mapFrom(List<Publication> source);

    /**
     * Hace un map desde una lista PublicationDTO a una lista de Publication entidad
     *
     * @param source Lista de Objeto PublicationDTO que contiene los detalles del directivo entidad
     * @return Lista de Objeto Publication que representa del directivo entidad.
     */
    List<Publication> mapFromListDTO(List<PublicationDTO> source);
}
