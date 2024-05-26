package co.edu.cue.cue_swap.domain.enums;

import jakarta.persistence.Column;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;


public enum State {
    VENDIDO, CANCELADO, DISPONIBLE, INTERCAMBIADO
}
