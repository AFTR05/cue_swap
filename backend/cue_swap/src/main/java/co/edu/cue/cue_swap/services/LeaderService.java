package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.LeaderAuthDTO;
import co.edu.cue.cue_swap.mapping.dtos.LeaderDTO;
import co.edu.cue.cue_swap.mapping.dtos.LeaderRequestDTO;

import java.util.List;

public interface LeaderService {
    List<LeaderDTO> getAllLeaders();
    LeaderDTO getOneLeader(Long id);

    LeaderAuthDTO createLeader(LeaderRequestDTO leader);

    LeaderDTO updateLeader(LeaderRequestDTO leaderRequestDTO);

    void deactiveLeader(Long id);
}
