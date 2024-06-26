package co.edu.cue.cue_swap.services.impl;

import co.edu.cue.cue_swap.domain.entities.Complaint;
import co.edu.cue.cue_swap.domain.entities.User;
import co.edu.cue.cue_swap.infrastructure.exception.ComplaintException;
import co.edu.cue.cue_swap.infrastructure.exception.UserException;
import co.edu.cue.cue_swap.infrastructure.repository.ComplaintRepository;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.mapping.dtos.ComplaintDTO;
import co.edu.cue.cue_swap.mapping.dtos.ComplaintRequestDTO;
import co.edu.cue.cue_swap.mapping.mappers.ComplaintMapper;
import co.edu.cue.cue_swap.services.ComplaintService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ComplaintServiceImpl implements ComplaintService {

    private final ComplaintRepository complaintRepository;
    private final UserRepository userRepository;
    private final ComplaintMapper mapper;

    @Override
    public ComplaintDTO createComplaint(ComplaintRequestDTO complaintRequestDTO) {
        User complainant = userRepository.findById(complaintRequestDTO.complainant_id())
                .orElseThrow(() -> new UserException("Complainant not found"));

        User denounced = userRepository.findById(complaintRequestDTO.denounced_id())
                .orElseThrow(() -> new UserException("Denounced not found"));
        complainant.setAvailable_points(complainant.getAvailable_points() + 2);
        Complaint dataModification = mapper.mapFromRequestDTO(complaintRequestDTO);
        dataModification.setComplainant(complainant);
        dataModification.setDenounced(denounced);
        try {
            Complaint savedComplaint = complaintRepository.save(dataModification);
            if (dataModification.getDenounced().getUser_reports().size()>=6){
                dataModification.getDenounced().setData_state(false);
                userRepository.save(dataModification.getDenounced());
            }
            return mapper.mapFromEntity(savedComplaint);
        } catch (Exception e) {
            throw new ComplaintException("Error while saving the complaint");
        }
    }
}
