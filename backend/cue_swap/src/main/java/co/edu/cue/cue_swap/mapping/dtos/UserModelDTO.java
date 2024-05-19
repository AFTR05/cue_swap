package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.enums.Career;
import co.edu.cue.cue_swap.domain.enums.Role;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public record UserModelDTO (
        @JsonProperty("username") String username,
        @JsonProperty("password") String password
){

}
