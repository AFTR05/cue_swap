package co.edu.cue.cue_swap.security;

import co.edu.cue.cue_swap.domain.entities.UserModel;
import co.edu.cue.cue_swap.domain.enums.Role;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserSecurityService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserModel userModel = userRepository.findByAccount_Username(username);
        if (!Validation.isNull(userModel)){
           return User.builder().username(userModel.getUsername()).password(userModel.getPassword()).roles(getRole(userModel))
                    .build();
        }else throw new UsernameNotFoundException(username);
    }

    private String getRole(UserModel user) {
        return Validation.isNull(user.getRole()) ? Role.STUDENT.name() :
                    user.getRole().name();
    }
}
