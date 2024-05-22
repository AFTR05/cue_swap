package co.edu.cue.cue_swap.infrastructure.utils;

import co.edu.cue.cue_swap.domain.entities.Token;
import co.edu.cue.cue_swap.domain.entities.UserModel;

public class TokenGenerator {

    public static Token generateToken(String jwt, UserModel userModel){
        Token token = new Token();
        token.setToken(jwt);
        token.setUser(userModel);
        token.setIsLogOut(false);
        return token;
    }
}
