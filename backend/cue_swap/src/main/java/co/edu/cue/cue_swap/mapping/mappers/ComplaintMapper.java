package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Complaint;
import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Rating;
import co.edu.cue.cue_swap.mapping.dtos.*;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper(componentModel = "spring")
@Component
public interface ComplaintMapper {
    /**
     * Hace un map desde Complaint entidad a ComplaintDTO
     *
     * @param source Objeto Complaint que contiene los detalles de la denuncia
     * @return Objeto ComplaintDTO que representa la denuncia en un DTO.
     */
    ComplaintDTO mapFromEntity(Complaint source);

    /**
     * Hace un map desde ComplaintDTO a Complaint entidad
     *
     * @param source Objeto ComplaintDTO que contiene los detalles de la denuncia DTO
     * @return Objeto Complaint que representa la denuncia en entidad.
     */
    Complaint mapFromDTO(ComplaintDTO source);


    /**
     * Hace un map desde ComplaintRequestDTO a Complaint entidad
     *
     * @param source Objeto ComplaintRequestDTO que contiene los detalles de la denuncia DTO
     * @return Objeto Complaint que representa la denuncia en entidad.
     */

    @Mapping(target = "complainant.id", source = "source.complainant_id")
    @Mapping(target = "denounced.id", source = "source.denounced_id")
    Complaint mapFromRequestDTO(ComplaintRequestDTO source);


    /**
     * Hace un map desde una lista Complaint a una lista de ComplaintDTO
     *
     * @param source Lista de Objeto Complaint que contiene los detalles de la denuncia entidad
     * @return Lista de Objeto ComplaintDTO que representa la denuncia en DTO.
     */
    List<ComplaintDTO> mapFrom(List<Complaint> source);

    /**
     * Hace un map desde una lista ComplaintDTO a una lista de Complaint entidad
     *
     * @param source Lista de Objeto ComplaintDTO que contiene los detalles de la denuncia DTO
     * @return Lista de Objeto Complaint que representa la denuncia entidad.
     */
    List<Complaint> mapFromListDTO(List<ComplaintDTO> source);
}
