package co.edu.cue.cue_swap.mapping.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;

public record RewardUserRequestDTO(
        @JsonProperty("reward_id") Long reward_id,
        @JsonProperty("user_id") Long user_id
) {
}
