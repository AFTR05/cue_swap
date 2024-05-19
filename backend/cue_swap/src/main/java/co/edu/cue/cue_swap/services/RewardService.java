package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.*;

import java.util.List;

public interface RewardService {
    RewardDTO createReward(RewardRequestDTO rewardRequestDTO);
    List<RewardDTO> getAllRatings();
    RewardDTO getOneRating(Long reward_id);
    RewardUserDTO redeemReward(RewardUserRequestDTO rewardUserRequestDTO);
}
