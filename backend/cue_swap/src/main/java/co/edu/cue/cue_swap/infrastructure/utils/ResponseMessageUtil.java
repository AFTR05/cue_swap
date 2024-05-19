package co.edu.cue.cue_swap.infrastructure.utils;

import java.util.HashMap;
import java.util.Map;

public class ResponseMessageUtil {

    /**
     * Organiza el mensaje de la respuesta
     *
     * @param key va a ser el key del mapa de la respuesta
     * @param message va a ser el contenido del mapa de la respuesta
     * @return retorna el mapa de la respuesta
     */
    public static <T> Map<String, T> responseMessage(String key, T message) {
        Map<String, T> response = new HashMap<>();
        response.put(key, message);
        return response;
    }
}
