package co.edu.cue.cue_swap.infrastructure.utils;



import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

public class PasswordUtil {
    /**
     * Transforma la contraseña en un hash
     *
     * @param password String que voy a transformar a hash
     * @return Un String del hash de la password
     */
    public static String hashPassword(String password) {
        Argon2 argon2= Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
        return argon2.hash(1,1024,1,password);
    }

    /**
     * Compara un hash con un input y devuelve el valor de la operacion
     *
     * @param password String que voy a transformar a hash
     * @param hash hash que quiero comparar
     * @return Un Boolean que me dice si esta vacio o nulo
     */
    public static Boolean compareHash(String password, String hash){
        Argon2 argon2= Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
        return argon2.hash(1, 1024, 1, password).equals(hash);
    }

}
