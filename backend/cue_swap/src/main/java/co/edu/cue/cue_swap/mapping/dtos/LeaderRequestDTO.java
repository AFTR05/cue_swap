package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.enums.Role;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public record LeaderRequestDTO (
        @JsonProperty("id") Long id,
        @JsonProperty("nid") String nid,
        @JsonProperty("name") String name,
        @JsonProperty("username") String username,
        @JsonProperty("email") String email,
        @JsonProperty("password") String password,
        @JsonProperty("role") Role role,
        @JsonProperty("available_points") Integer available_points,
        @JsonProperty("publications") List<Publication> publications,
        @JsonProperty("products") List<Product> products,
        @JsonProperty("dependence") String dependence){
}
