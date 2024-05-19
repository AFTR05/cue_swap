package co.edu.cue.cue_swap.infrastructure.exception;

public class TransactionException extends RuntimeException{
    public TransactionException(String message) {
        super(message);
    }
}
