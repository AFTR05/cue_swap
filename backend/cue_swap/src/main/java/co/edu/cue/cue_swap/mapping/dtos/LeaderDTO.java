package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Account;
import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.enums.Career;
import co.edu.cue.cue_swap.domain.enums.Dependence;
import co.edu.cue.cue_swap.domain.enums.Role;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

import java.util.List;

public record LeaderDTO (
        @JsonProperty("nid") String nid,
        @JsonProperty("name") String name,
        @JsonProperty("username") String username,
        @JsonProperty("email") String email,
        @JsonProperty("password") String password,
        @JsonProperty("products") List<Product> products,
        @JsonProperty("publications") List<Publication> publications,
        @JsonProperty("available_points") Integer available_points,
        @JsonProperty("role") Role role,
        @JsonProperty("dependence") String dependence,
        Boolean data_state){

}
