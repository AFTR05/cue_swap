package co.edu.cue.cue_swap.infrastructure.exception;

import java.util.NoSuchElementException;

public class ProductException extends NullPointerException {
    public ProductException(String message) {
        super(message);
    }
}
