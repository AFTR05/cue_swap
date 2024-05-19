package co.edu.cue.cue_swap.infrastructure.controllers;

import co.edu.cue.cue_swap.infrastructure.utils.ResponseMessageUtil;
import co.edu.cue.cue_swap.mapping.dtos.CreateProductDTO;
import co.edu.cue.cue_swap.mapping.dtos.ProductDTO;
import co.edu.cue.cue_swap.mapping.dtos.ProductRequestDTO;
import co.edu.cue.cue_swap.services.ProductService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/product")
public class ProductController {
    private final ProductService service;

    @Operation(summary = "Mostrar los productos con estado verdadero"
            , description = "Este método se utilizará para traer todas los productos con estado verdadero")
    @GetMapping("/get-all")
    public ResponseEntity<Map<String, List<ProductDTO>>> getAllProducts(){
        List<ProductDTO> products = service.getAllProducts();
        Map<String, List<ProductDTO>> response = ResponseMessageUtil.responseMessage("products", products);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Crear un producto"
            , description = "Este método se utilizará para crear un producto")
    @PostMapping("/create")
    public ResponseEntity<Map<String, ProductDTO>> createProduct(@RequestBody
                                                                 @Valid
                                                                 CreateProductDTO createProductDTO){
        ProductDTO createdProduct = service.createProduct(createProductDTO);
        Map<String, ProductDTO> response = ResponseMessageUtil.responseMessage("product", createdProduct);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Mostrar solo un producto con un id solicitado"
            , description = "Este método se utilizará para traer a un producto con un id especifico")
    @GetMapping("/get-by-id/{id}")
    public ResponseEntity<Map<String, ProductDTO>> getProductById(@PathVariable
                                                                  Long id) {
        ProductDTO product = service.getOneProduct(id);
        Map<String, ProductDTO> response = ResponseMessageUtil.responseMessage("product", product);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Actualizar un producto"
            , description = "Este método se utilizará para actualizar un producto")
    @PatchMapping("/update")
    public ResponseEntity<Map<String, ProductDTO>> updateProduct(@RequestBody
                                                                 @Valid
                                                                 ProductRequestDTO productRequestDTO){
        ProductDTO product = service.updateProduct(productRequestDTO);
        Map<String, ProductDTO> response = ResponseMessageUtil.responseMessage("product", product);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "Cambia el estado del producto simulando que se elimino"
            , description = "Este método se utilizará para cambiar el estado del producto")
    @PatchMapping("/delete-product/{id}")
    public ResponseEntity<Map<String, String>> deleteProduct(@PathVariable Long id){
        service.deactivateProduct(id);
        Map<String, String> response = ResponseMessageUtil.responseMessage("message", "Product deleted");
        return ResponseEntity.ok(response);
    }

}
