package co.edu.cue.cue_swap.mapping.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;

public record RewardDTO (
        @JsonProperty("reward_id") Long rewardId,
        @JsonProperty("description") String description,
        @JsonProperty("title") String title,
        @JsonProperty("points_value") Integer points_value
){
}
