package co.edu.cue.cue_swap.mapping.dtos;

import co.edu.cue.cue_swap.domain.enums.Category;
import com.fasterxml.jackson.annotation.JsonProperty;

public record SearchPublicationDTO(
        @JsonProperty("pub_description") String pubDescription,
        @JsonProperty("pub_title") String pubTitle,
        @JsonProperty("pub_product_description") String pubProdDescription,
        @JsonProperty("pub_product_category") Category pubProdCategory,
        @JsonProperty("pub_user_nid") String userNid
        ){

}
