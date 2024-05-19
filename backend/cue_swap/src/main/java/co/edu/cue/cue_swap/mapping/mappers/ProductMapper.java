package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Student;
import co.edu.cue.cue_swap.mapping.dtos.CreateProductDTO;
import co.edu.cue.cue_swap.mapping.dtos.ProductDTO;
import co.edu.cue.cue_swap.mapping.dtos.ProductRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.StudentDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper(componentModel = "spring")
@Component
public interface ProductMapper {
    /**
     * Hace un map desde Product entidad a ProductDTO
     *
     * @param source Objeto Product que contiene los detalles del directivo
     * @return Objeto ProductDTO que representa el directivo en un DTO.
     */
    @Mapping(target = "name", source = "source.name")
    ProductDTO mapFromEntity(Product source);

    /**
     * Hace un map desde ProductDTO a Product entidad
     *
     * @param source Objeto ProductDTO que contiene los detalles del directivo DTO
     * @return Objeto Product que representa el directivo en entidad.
     */
    @Mapping(target = "name", source = "source.name")
    Product mapFromDTO(ProductDTO source);


    /**
     * Hace un map desde ProductRequestDTO a Product entidad
     *
     * @param source Objeto ProductRequestDTO que contiene los detalles del directivo DTO
     * @return Objeto Product que representa el directivo en entidad.
     */
    @Mapping(target = "name", source = "source.name")
    @Mapping(target = "user.id", source = "source.user_id")
    Product mapFromRequestDTO(ProductRequestDTO source);

    /**
     * Hace un map desde CreateProductDTO a Product entidad
     *
     * @param source Objeto CreateProductDTO que contiene los detalles del directivo DTO
     * @return Objeto Product que representa el directivo en entidad.
     */
    @Mapping(target = "name", source = "source.name")
    Product mapFromCreateDTO(CreateProductDTO source);

    /**
     * Hace un map desde una lista Product a una lista de ProductDTO DTO
     *
     * @param source Lista de Objeto Product que contiene los detalles del directivo entidad
     * @return Lista de Objeto ProductDTO que representa el directivo en DTO.
     */
    List<ProductDTO> mapFrom(List<Product> source);

    /**
     * Hace un map desde una lista ProductDTO a una lista de Product entidad
     *
     * @param source Lista de Objeto ProductDTO que contiene los detalles del directivo entidad
     * @return Lista de Objeto Product que representa del directivo entidad.
     */
    List<Product> mapFromListDTO(List<ProductDTO> source);
}