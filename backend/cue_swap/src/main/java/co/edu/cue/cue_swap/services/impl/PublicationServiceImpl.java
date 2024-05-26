package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.enums.Category;
import co.edu.cue.cue_swap.domain.enums.State;
import co.edu.cue.cue_swap.infrastructure.exception.ProductException;
import co.edu.cue.cue_swap.infrastructure.exception.PublicationException;
import co.edu.cue.cue_swap.infrastructure.exception.UserException;
import co.edu.cue.cue_swap.infrastructure.repository.ProductRepository;
import co.edu.cue.cue_swap.infrastructure.repository.PublicationRepository;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import co.edu.cue.cue_swap.mapping.dtos.PublicationDTO;
import co.edu.cue.cue_swap.mapping.dtos.PublicationRequestDTO;
import co.edu.cue.cue_swap.mapping.dtos.SearchPublicationDTO;
import co.edu.cue.cue_swap.mapping.mappers.PublicationMapper;
import co.edu.cue.cue_swap.services.PublicationService;
import lombok.AllArgsConstructor;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@AllArgsConstructor
public class PublicationServiceImpl implements PublicationService {
    private final ProductRepository productRepository;
    private final PublicationRepository publicationRepository;
    private final UserRepository userRepository;


    private final PublicationMapper mapper;

    /**
     * Devuelve una lista de todos los publicaciones con estado true.
     *
     * @return Lista de objetos PublicationDTO que representan a los publicaciones.
     */
    @Override
    public List<PublicationDTO> getAllPublications() {
        return publicationRepository.findAll()
                .stream()
                .filter(Publication::getDataState)
                .map(mapper::mapFromEntity).toList();
    }

    /**
     * Devuelve un solo publicacion.
     *
     * @param id Long Id que representa el id del publicacion.
     * @return Objeto PublicationDTO que representa al publicacion con la id.
     */
    @Override
    public PublicationDTO getOnePublication(Long id) {
        return mapper.mapFromEntity(publicationRepository.getReferenceById(id));
    }

    /**
     * Crea un nuevo publicacion
     *
     * @param publication Objeto PublicationRequestDTO que contiene los detalles del publicacion a crear.
     * @return Objeto PublicationDTO que representa al publicacion creado.
     */
    @Override
    public PublicationDTO createPublication(PublicationRequestDTO publication) {
        return productRepository.findById(publication.product_id())
                .map(product -> {
                    Publication dataModification = mapper.mapFromRequestDTO(publication);
                    dataModification.setProduct(product);
                    dataModification.setDataState(true);
                    dataModification.setDate(LocalDate.now());
                    // Find the user by owner_id
                    return userRepository.findById(publication.owner_id())
                            .map(user -> {
                                dataModification.setOwner(user);
                                user.setAvailable_points(user.getAvailable_points()+10);
                                try {
                                    Publication savedPublication = publicationRepository.save(dataModification);
                                    return mapper.mapFromEntity(savedPublication);
                                } catch (ConstraintViolationException e) {
                                    throw new PublicationException("Could not save publication, product duplicated");
                                }
                            })
                            .orElseThrow(() -> new UserException("Usuario no encontrado"));
                })
                .orElseThrow(() -> new ProductException("Producto no encontrado"));
    }

    /**
     * Actualizar un nuevo publicacion.
     *
     * @param publicationRequestDTO Objeto PublicationRequestDTO que contiene los detalles del publicacion a actualizar.
     * @return Objeto PublicationDTO que representa al publicacion actualizado.
     */
    @Override
    public PublicationDTO updatePublication(PublicationRequestDTO publicationRequestDTO) {
        Publication dataModification = mapper.mapFromRequestDTO(publicationRequestDTO);
        dataModification.setDataState(true);
        return mapper.mapFromEntity(publicationRepository.save(dataModification));
    }

    /**
     * Desactica el publicacion o cambia estado de la data simulando eliminacion.
     *
     * @param id Objeto Long que contiene los detalles del publicacion a crear.
     */
    @Override
    public void deactivatePublication(Long id) {
        Publication publication=publicationRepository.getReferenceById(id);
        publication.setDataState(false);
        publicationRepository.save(publication);
    }

    /**
     * Devuelve una lista de todos los publicaciones con estado true filtrado por la descripcion.
     * @param description descripcion de la publicacion
     * @return Lista de objetos PublicationDTO que representan a los publicaciones filtrado por la descripcion.
     */
    @Override
    public List<PublicationDTO> filterByDescription(String description) {
        return mapper.mapFrom(publicationRepository.findByDescription(description).stream()
                .filter(Publication::getDataState).toList());
    }

    /**
     * Devuelve una lista de todos los publicaciones con estado true filtrado por el titulo.
     * @param title titulo de la publicacion
     * @return Lista de objetos PublicationDTO que representan a los publicaciones filtrado por el titulo.
     */
    @Override
    public List<PublicationDTO> filterByTitle(String title) {
        return mapper.mapFrom(publicationRepository.findByTitle(title).stream()
                .filter(Publication::getDataState).toList());
    }

    /**
     * Devuelve una lista de todos los publicaciones con estado true filtrado por la descripcion del producto.
     * @param product_description descripcion del producto de la publicacion
     * @return Lista de objetos PublicationDTO que representan a los publicaciones filtrado por la descripcion del producto.
     */
    @Override
    public List<PublicationDTO> filterByProduct_Description(String product_description) {
        return mapper.mapFrom(publicationRepository.findByProduct_Description(product_description).stream()
                .filter(Publication::getDataState).toList());
    }

    /**
     * Devuelve una lista de todos los publicaciones con estado true filtrado por la categoria del producto.
     * @param product_category category del producto de la publicacion
     * @return Lista de objetos PublicationDTO que representan a los publicaciones filtrado por la categoria del producto.
     */
    @Override
    public List<PublicationDTO> filterByProduct_Category(Category product_category) {
        return mapper.mapFrom(publicationRepository.findByProduct_Category(product_category).stream()
                .filter(Publication::getDataState).toList());
    }

    /**
     * Devuelve una lista de todos los publicaciones con estado true filtrado por el estado de la publicacion.
     * @param state descripcion del producto de la publicacion
     * @return Lista de objetos PublicationDTO que representan a los publicaciones filtrado por el estado de la publicacion.
     */
    @Override
    public List<PublicationDTO> filterByState(State state) {
        return mapper.mapFrom(publicationRepository.findByState(state).stream()
                .filter(Publication::getDataState).toList());
    }

    /**
     * Devuelve una lista de todos los publicaciones con estado true filtrado ya sea descripcion, titulo, descripcion de producto y categoria de producto .
     * @param searchPublicationDTO Objeto que contiene los posibles filtros de la publicacion
     * @return Lista de objetos PublicationDTO que representan a los publicaciones filtrado por los valores del objeto del parametro.
     */
    @Override
    public List<PublicationDTO> filterPublications(SearchPublicationDTO searchPublicationDTO){
        List<Publication> publications = publicationRepository.findByDataState(true);
        if(!Validation.isNullOrEmpty(searchPublicationDTO.pubProdDescription())){
            publications = publications.stream().filter(
                    publication -> publication.getProduct().getDescription().contains(searchPublicationDTO.pubProdDescription()))
                    .toList();
        }
        if (!Validation.isNullCategory(searchPublicationDTO.pubProdCategory())){
            publications = publications.stream().filter(
                            publication -> publication.getProduct().getCategory().equals(searchPublicationDTO.pubProdCategory()))
                    .toList();
        }
        if(!Validation.isNullOrEmpty(searchPublicationDTO.userNid())){
            publications = publications.stream().filter(
                            publication -> publication.getOwner().getNid().equals(searchPublicationDTO.userNid()))
                    .toList();
        }
        if (!Validation.isNullOrEmpty(searchPublicationDTO.pubTitle())){
            publications = publications.stream().filter(
                            publication -> publication.getTitle().equals(searchPublicationDTO.pubTitle()))
                    .toList();
        }
        if (!Validation.isNullOrEmpty(searchPublicationDTO.pubDescription())){
            publications = publications.stream().filter(
                            publication -> publication.getDescription().equals(searchPublicationDTO.pubDescription()))
                    .toList();
        }
        return publications.stream().map(mapper::mapFromEntity).toList();
    }
}
