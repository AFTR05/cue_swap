package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.infrastructure.exception.ProductException;
import co.edu.cue.cue_swap.infrastructure.exception.UserException;
import co.edu.cue.cue_swap.infrastructure.repository.ProductRepository;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.mapping.dtos.CreateProductDTO;
import co.edu.cue.cue_swap.mapping.dtos.ProductDTO;
import co.edu.cue.cue_swap.mapping.dtos.ProductRequestDTO;
import co.edu.cue.cue_swap.mapping.mappers.ProductMapper;
import co.edu.cue.cue_swap.services.ProductService;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    private final ProductMapper mapper;

    /**
     * Devuelve una lista de todos los productos con estado true.
     *
     * @return Lista de objetos ProductDTO que representan a los productos.
     */
    @Override
    public List<ProductDTO> getAllProducts() {
        return productRepository.findAll()
                .stream()
                .filter(Product::getData_state)
                .map(mapper::mapFromEntity).toList();
    }

    /**
     * Devuelve un solo producto.
     *
     * @param id Long Id que representa el id del product.
     * @return Objeto ProductDTO que representa al product con la id.
     */
    @Override
    public ProductDTO getOneProduct(Long id) {
        return mapper.mapFromEntity(productRepository.getReferenceById(id));
    }

    /**
     * Crea un nuevo producto
     *
     * @param product Objeto CreateProductDTO que contiene los detalles del producto a crear.
     * @return Objeto ProductDTO que representa al producto creado.
     */
    @Override
    public ProductDTO createProduct(@NotNull CreateProductDTO product) {
        return userRepository.findById(product.user_id())
                .map(user -> {
                    Product dataModification = mapper.mapFromCreateDTO(product);
                    user.setAvailable_points(user.getAvailable_points()+5);
                    dataModification.setUser(user);
                    dataModification.setData_state(true);
                    try {
                        Product savedProduct = productRepository.save(dataModification);
                        return mapper.mapFromEntity(savedProduct);
                    } catch (Exception e) {
                        // Manejar el error adecuadamente, por ejemplo, lanzando una excepción
                        throw new ProductException("Error al guardar el producto");
                    }
                })
                .orElseThrow(() -> new UserException("Producto no encontrado"));
    }



    /**
     * Actualizar un nuevo producto.
     *
     * @param productRequestDTO Objeto ProductRequestDTO que contiene los detalles del estudiante a actualizar.
     * @return Objeto ProductDTO que representa al producto actualizado.
     */
    @Override
    public ProductDTO updateProduct(ProductRequestDTO productRequestDTO) {
        return userRepository.findById(productRequestDTO.user_id())
                .map(user -> {
                    Product dataModification = mapper.mapFromRequestDTO(productRequestDTO);
                    dataModification.setUser(user);
                    dataModification.setData_state(true);
                    try {
                        Product savedProduct = productRepository.save(dataModification);
                        return mapper.mapFromEntity(savedProduct);
                    } catch (Exception e) {
                        // Manejar el error adecuadamente, por ejemplo, lanzando una excepción
                        throw new ProductException("Error al guardar el producto");
                    }
                })
                .orElseThrow(() -> new UserException("Usuario no encontrado"));
    }

    /**
     * Desactica el producto o cambia estado de la data simulando eliminacion.
     *
     * @param id Objeto Long que contiene los detalles del producto a crear.
     */
    @Override
    public void deactivateProduct(Long id) {
        Product product=productRepository.getReferenceById(id);
        product.setData_state(false);
        productRepository.save(product);
    }
}
