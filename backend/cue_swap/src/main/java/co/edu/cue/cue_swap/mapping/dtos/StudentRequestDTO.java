package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.entities.Complaint;
import co.edu.cue.cue_swap.domain.entities.Product;
import co.edu.cue.cue_swap.domain.entities.Publication;
import co.edu.cue.cue_swap.domain.entities.Reward;
import co.edu.cue.cue_swap.domain.enums.Career;
import co.edu.cue.cue_swap.domain.enums.Role;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public record StudentRequestDTO (
        @JsonProperty("id") Long id,
        @JsonProperty("nid") String nid,
        @JsonProperty("name") String name,
        @JsonProperty("username") String username,
        @JsonProperty("email") String email,
        @JsonProperty("role") Role role,
        @JsonProperty("password") String password,
        @JsonProperty("products") List<Product> products,
        @JsonProperty("available_points") Integer available_points,
        @JsonProperty("publications") List<Publication> publications,
        @JsonProperty("user_reports") List<Complaint> user_reports,
        @JsonProperty("made_reports") List<Complaint> made_reports,
        @JsonProperty("rewards") List<Reward> rewards,
        @JsonProperty("semester") Integer semester,
        @JsonProperty("career") Career career){
}
