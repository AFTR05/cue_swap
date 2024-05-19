package co.edu.cue.cue_swap.services;


import co.edu.cue.cue_swap.mapping.dtos.CreateProductDTO;
import co.edu.cue.cue_swap.mapping.dtos.ProductDTO;
import co.edu.cue.cue_swap.mapping.dtos.ProductRequestDTO;

import java.util.List;

public interface ProductService {
    List<ProductDTO> getAllProducts();
    ProductDTO getOneProduct(Long id);

    ProductDTO createProduct(CreateProductDTO product);

    ProductDTO updateProduct(ProductRequestDTO productRequestDTO);

    void deactivateProduct(Long id);
}
