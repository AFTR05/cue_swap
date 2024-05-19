package co.edu.cue.cue_swap.services;

import co.edu.cue.cue_swap.mapping.dtos.ComplaintDTO;
import co.edu.cue.cue_swap.mapping.dtos.ComplaintRequestDTO;

public interface ComplaintService {
    ComplaintDTO createComplaint(ComplaintRequestDTO complaintRequestDTO);
}
