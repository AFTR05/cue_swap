package co.edu.cue.cue_swap.mapping.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class StatusDTO {
    private String code;
    private String message;
}
