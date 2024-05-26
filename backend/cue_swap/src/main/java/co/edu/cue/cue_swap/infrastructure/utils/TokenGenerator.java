package co.edu.cue.cue_swap.infrastructure.utils;

import co.edu.cue.cue_swap.domain.entities.Token;
import co.edu.cue.cue_swap.domain.entities.User;

public class TokenGenerator {

    public static Token generateToken(String jwt, User user){
        Token token = new Token();
        token.setToken(jwt);
        token.setUser(user);
        token.setIsLogOut(false);
        return token;
    }
}
