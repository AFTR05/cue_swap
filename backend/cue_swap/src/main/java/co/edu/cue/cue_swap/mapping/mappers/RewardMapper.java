package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Rating;
import co.edu.cue.cue_swap.domain.entities.Reward;
import co.edu.cue.cue_swap.mapping.dtos.RatingDTO;
import co.edu.cue.cue_swap.mapping.dtos.RatingRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.RewardDTO;
import co.edu.cue.cue_swap.mapping.dtos.RewardRequestDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper(componentModel = "spring")
@Component
public interface RewardMapper {
    /**
     * Hace un map desde Reward entidad a RewardDTO
     *
     * @param source Objeto Reward que contiene los detalles de la recompensa
     * @return Objeto RewardDTO que representa la recompensa en un DTO.
     */
    RewardDTO mapFromEntity(Reward source);

    /**
     * Hace un map desde RewardDTO a Reward entidad
     *
     * @param source Objeto RewardDTO que contiene los detalles de la recompensa DTO
     * @return Objeto Reward que representa la recompensa en entidad.
     */
    Reward mapFromDTO(RewardDTO source);


    /**
     * Hace un map desde RewardRequestDTO a Reward entidad
     *
     * @param source Objeto RewardRequestDTO que contiene los detalles de la recompensa DTO
     * @return Objeto Reward que representa la recompensa en entidad.
     */
    Reward mapFromRequestDTO(RewardRequestDTO source);

    /**
     * Hace un map desde una lista Reward a una lista de RewardDTO DTO
     *
     * @param source Lista de Objeto Reward que contiene los detalles de la recompensa entidad
     * @return Lista de Objeto RewardDTO que representa la recompensa en DTO.
     */
    List<RewardDTO> mapFrom(List<Reward> source);

    /**
     * Hace un map desde una lista RewardDTO a una lista de Reward entidad
     *
     * @param source Lista de Objeto RewardDTO que contiene los detalles de la recompensa DTO
     * @return Lista de Objeto Reward que representa de la recompensa entidad.
     */
    List<Reward> mapFromListDTO(List<RewardDTO> source);
}
