package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Complaint;
import co.edu.cue.cue_swap.domain.entities.Transaction;
import co.edu.cue.cue_swap.mapping.dtos.ComplaintDTO;
import co.edu.cue.cue_swap.mapping.dtos.ComplaintRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.TransactionDTO;
import co.edu.cue.cue_swap.mapping.dtos.TransactionRequestDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper(componentModel = "spring")
@Component
public interface TransactionMapper {
    /**
     * Hace un map desde Transaction entidad a TransactionDTO
     *
     * @param source Objeto Transaction que contiene los detalles de la transaccion
     * @return Objeto TransactionDTO que representa la transaccion en un DTO.
     */
    TransactionDTO mapFromEntity(Transaction source);

    /**
     * Hace un map desde TransactionDTO a Transaction entidad
     *
     * @param source Objeto TransactionDTO que contiene los detalles de la transaccion DTO
     * @return Objeto Transaction que representa la transaccion en entidad.
     */
    Transaction mapFromDTO(TransactionDTO source);


    /**
     * Hace un map desde TransactionRequestDTO a Transaction entidad
     *
     * @param source Objeto TransactionRequestDTO que contiene los detalles de la transaccion DTO
     * @return Objeto Transaction que representa la transaccion en entidad.
     */
    @Mapping(target = "offer.id", source = "source.offer_id")
    Transaction mapFromRequestDTO(TransactionRequestDTO source);


    /**
     * Hace un map desde una lista Transaction a una lista de TransactionDTO
     *
     * @param source Lista de Objeto Transaction que contiene los detalles de la transaccion entidad
     * @return Lista de Objeto TransactionDTO que representa la transaccion en DTO.
     */
    List<TransactionDTO> mapFrom(List<Transaction> source);

    /**
     * Hace un map desde una lista TransactionDTO a una lista de Transaction entidad
     *
     * @param source Lista de Objeto TransactionDTO que contiene los detalles de la transaccion DTO
     * @return Lista de Objeto Transaction que representa la transaccion entidad.
     */
    List<Transaction> mapFromListDTO(List<TransactionDTO> source);
}
