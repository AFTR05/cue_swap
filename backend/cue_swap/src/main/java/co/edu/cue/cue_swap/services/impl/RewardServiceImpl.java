package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.Reward;
import co.edu.cue.cue_swap.domain.entities.User;
import co.edu.cue.cue_swap.infrastructure.exception.RewardException;
import co.edu.cue.cue_swap.infrastructure.exception.UserException;
import co.edu.cue.cue_swap.infrastructure.repository.RewardRepository;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import co.edu.cue.cue_swap.mapping.dtos.*;
import co.edu.cue.cue_swap.mapping.mappers.RewardMapper;
import co.edu.cue.cue_swap.services.RewardService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
@AllArgsConstructor
public class RewardServiceImpl implements RewardService {
    private final RewardRepository rewardRepository;
    private final UserRepository userRepository;
    private final RewardMapper mapper;

    @Override
    public RewardDTO createReward(RewardRequestDTO rewardRequestDTO) {
        Reward dataModification = mapper.mapFromRequestDTO(rewardRequestDTO);
        try {
            Reward savedReward = rewardRepository.save(dataModification);
            return mapper.mapFromEntity(savedReward);
        } catch (Exception e) {
            throw new RewardException("Error al guardar la recompensa");
        }
    }

    @Override
    public List<RewardDTO> getAllRatings() {
        return rewardRepository.findAll()
                .stream()
                .map(mapper::mapFromEntity).toList();
    }

    @Override
    public RewardUserDTO redeemReward(RewardUserRequestDTO rewardUserRequestDTO) {
        RewardUserDTO rewardUserDTO=new RewardUserDTO();
        User user = userRepository.findById(rewardUserRequestDTO.user_id())
                .orElseThrow(() -> new UserException("User not found"));
        Reward reward = rewardRepository.findById(rewardUserRequestDTO.reward_id())
                .orElseThrow(() -> new RewardException("Reward not found"));
        if (!Validation.isNull(user.getRewards())){
            user.getRewards().add(reward);
        } else {
            ArrayList<Reward> rewards = new ArrayList<>();
            rewards.add(reward);
            user.setRewards(rewards);
        }
        rewardUserDTO.setReward(mapper.mapFromEntity(reward));
        rewardUserDTO.setUser(user);
        userRepository.save(user);
        return rewardUserDTO;
    }

    @Override
    public RewardDTO getOneRating(Long reward_id) {
        return mapper.mapFromEntity(rewardRepository.getReferenceById(reward_id));
    }
}
