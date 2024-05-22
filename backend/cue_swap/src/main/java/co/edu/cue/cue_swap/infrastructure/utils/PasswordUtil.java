package co.edu.cue.cue_swap.infrastructure.utils;



import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import org.springframework.security.crypto.bcrypt.BCrypt;

public class PasswordUtil {
    /**
     * Transforma la contraseña en un hash
     *
     * @param password String que voy a transformar a hash
     * @return Un String del hash de la password
     */
    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, "salt");
    }

    /**
     * Compara un hash con un input y devuelve el valor de la operacion
     *
     * @param password String que voy a transformar a hash
     * @param hash hash que quiero comparar
     * @return Un Boolean que me dice si esta vacio o nulo
     */
    public static boolean compareHash(String password, String hash) {
        return BCrypt.checkpw(password, hash);
    }

}
