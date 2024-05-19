package co.edu.cue.cue_swap.infrastructure.utils;

import co.edu.cue.cue_swap.domain.enums.Category;

public class Validation {

    /**
     * Valida si el campo esta vacio o nulo
     *
     * @param value String que voy a evaluar
     * @return Un Boolean que me dice si esta vacio o nulo
     */
    public static Boolean isNullOrEmpty(String value) {
        return value == null || value.isEmpty();
    }

    public static Boolean isNull(Object value) {
        return value == null;
    }

    /**
     * Valida si la categoria es nulo
     *
     * @param value String que voy a evaluar
     * @return Un Boolean que me dice si esta nulo
     */
    public static Boolean isNullCategory(Category value) {
        return value == null ;
    }
}
