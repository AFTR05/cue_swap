package co.edu.cue.cue_swap.mapping.mappers;

import co.edu.cue.cue_swap.domain.entities.Student;
import co.edu.cue.cue_swap.mapping.dtos.StudentDTO;
import co.edu.cue.cue_swap.mapping.dtos.StudentRequestDTO;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper(componentModel = "spring")
@Component
public interface StudentMapper {

    /**
     * Hace un map desde Student entidad a StudentDTO
     *
     * @param source Objeto Student que contiene los detalles del directivo
     * @return Objeto StudentDTO que representa el directivo en un DTO.
     */
    @Mapping(target = "products", source = "source.products")
    @Mapping(target = "publications", source = "source.publications")
    @Mapping(target = "rewards", source = "source.rewards")
    @Mapping(target = "user_reports", source = "source.user_reports")
    @Mapping(target = "made_reports", source = "source.made_reports")
    @InheritInverseConfiguration
    @Mapping(target = "username", source = "account.username")
    @Mapping(target = "password", source = "account.password")
    StudentDTO mapFromEntity(Student source);

    /**
     * Hace un map desde StudentDTO a Student entidad
     *
     * @param source Objeto StudentDTO que contiene los detalles del directivo DTO
     * @return Objeto Student que representa el directivo en entidad.
     */
    @Mapping(target = "products", source = "source.products")
    @Mapping(target = "publications", source = "source.publications")
    @Mapping(target = "rewards", source = "source.rewards")
    @Mapping(target = "user_reports", source = "source.user_reports")
    @Mapping(target = "made_reports", source = "source.made_reports")
    @Mapping(target = "account.username", source = "source.username")
    @Mapping(target = "account.password", source = "source.password")
    Student mapFromDTO(StudentDTO source);

    /**
     * Hace un map desde StudentRequestDTO a Student entidad
     *
     * @param source Objeto StudentRequestDTO que contiene los detalles del directivo DTO
     * @return Objeto Student que representa el directivo en entidad.
     */
    @Mapping(target = "products", source = "source.products")
    @Mapping(target = "publications", source = "source.publications")
    @Mapping(target = "rewards", source = "source.rewards")
    @Mapping(target = "user_reports", source = "source.user_reports")
    @Mapping(target = "made_reports", source = "source.made_reports")
    @Mapping(target = "account.username", source = "source.username")
    @Mapping(target = "account.password", source = "source.password")
    Student mapFromRequestDTO(StudentRequestDTO source);

    /**
     * Hace un map desde una lista StudentRequestDTO a una lista de Student entidad
     *
     * @param source Lista de Objeto Student que contiene los detalles del directivo entidad
     * @return Lista de Objeto StudentDTO que representa el directivo en DTO.
     */
    List<StudentDTO> mapFrom(List<Student> source);

    /**
     * Hace un map desde una lista StudentDTO a una lista de Student entidad
     *
     * @param source Lista de Objeto StudentDTO que contiene los detalles del directivo entidad
     * @return Lista de Objeto Student que representa del directivo entidad.
     */
    List<Student> mapFromListDTO(List<StudentDTO> source);
}
