package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Leader;
import co.edu.cue.cue_swap.mapping.dtos.LeaderDTO;
import co.edu.cue.cue_swap.mapping.dtos.LeaderRequestDTO;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper(componentModel = "spring")
@Component
public interface LeaderMapper {

    /**
     * Hace un map desde Leader entidad a LeaderDTO
     *
     * @param source Objeto Leader que contiene los detalles del directivo
     * @return Objeto LeaderDTO que representa el directivo en un DTO.
     */
    @Mapping(target = "publications", source = "source.publications")
    @Mapping(target = "products", source = "source.products")
    @InheritInverseConfiguration
    @Mapping(target = "username", source = "account.username")
    @Mapping(target = "password", source = "account.password")
    LeaderDTO mapFromEntity(Leader source);

    /**
     * Hace un map desde LeaderDTO a Leader entidad
     *
     * @param source Objeto LeaderDTO que contiene los detalles del directivo DTO
     * @return Objeto Leader que representa el directivo en entidad.
     */
    @Mapping(target = "publications", source = "source.publications")
    @Mapping(target = "products", source = "source.products")
    @Mapping(target = "account.username", source = "source.username")
    @Mapping(target = "account.password", source = "source.password")
    Leader mapFromDTO(LeaderDTO source);


    /**
     * Hace un map desde LeaderRequestDTO a Leader entidad
     *
     * @param source Objeto LeaderRequestDTO que contiene los detalles del directivo DTO
     * @return Objeto Leader que representa el directivo en entidad.
     */
    @Mapping(target = "publications", source = "source.publications")
    @Mapping(target = "products", source = "source.products")
    @Mapping(target = "account.username", source = "source.username")
    @Mapping(target = "account.password", source = "source.password")
    Leader mapFromRequestDTO(LeaderRequestDTO source);

    /**
     * Hace un map desde una lista LeaderRequestDTO a una lista de Leader entidad
     *
     * @param source Lista de Objeto Leader que contiene los detalles del directivo entidad
     * @return Lista de Objeto LeaderDTO que representa el directivo en DTO.
     */
    List<LeaderDTO> mapFrom(List<Leader> source);

    /**
     * Hace un map desde una lista LeaderDTO a una lista de Leader entidad
     *
     * @param source Lista de Objeto LeaderDTO que contiene los detalles del directivo entidad
     * @return Lista de Objeto Leader que representa del directivo entidad.
     */
    List<Leader> mapFromListDTO(List<LeaderDTO> source);
}
