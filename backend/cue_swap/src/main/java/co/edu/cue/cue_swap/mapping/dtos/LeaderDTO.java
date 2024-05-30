package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.*;
import co.edu.cue.cue_swap.domain.enums.Career;
import co.edu.cue.cue_swap.domain.enums.Dependence;
import co.edu.cue.cue_swap.domain.enums.Role;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

import java.util.List;

public record LeaderDTO (
        @JsonProperty("id") Long id,
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
        @JsonProperty("user_reports") List<Complaint> user_reports,
        @JsonProperty("offers") List<Offer> offers,
        @JsonProperty("made_reports") List<Complaint> made_reports,
        @JsonProperty("rewards") List<Reward> rewards,
        Boolean data_state){

}
