package co.edu.cue.cue_swap.domain.enums;

public enum CodeMessage {
    SUCCESSFUL("Se ha hecho exitosamente", "01"),
    ERROR_INVALID_RESULT("Ha ocurrido un error", "00"),
    ;
    private final String message;
    private final String code;

    CodeMessage(String message, String code) {
        this.message = message;
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public String getCode() {
        return code;
    }
}
