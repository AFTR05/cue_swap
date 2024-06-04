package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Transaction;
import co.edu.cue.cue_swap.domain.entities.User;
import co.edu.cue.cue_swap.mapping.dtos.TransactionDTO;
import co.edu.cue.cue_swap.mapping.dtos.UserDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring")
@Component
public interface UserMapper {
    /**
     * Hace un map desde User entidad a UserDTO
     *
     * @param source Objeto User que contiene los detalles de la transaccion
     * @return Objeto UserDTO que representa un usuario en un DTO.
     */
    @Mapping(target = "publications", source = "source.publications")
    @Mapping(target = "data_state", source = "source.data_state")
    UserDTO mapFromEntity(User source);

    /**
     * Hace un map desde UserDTO a User entidad
     *
     * @param source Objeto UserDTO que contiene los detalles de la transaccion DTO
     * @return Objeto User que representa un usuario en entidad.
     */
    @Mapping(target = "publications", source = "source.publications")
    @Mapping(target = "data_state", source = "source.data_state")
    User mapFromDTO(UserDTO source);
}
