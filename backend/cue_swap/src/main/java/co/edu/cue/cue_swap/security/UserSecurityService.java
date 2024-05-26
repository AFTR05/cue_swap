package co.edu.cue.cue_swap.security;

import co.edu.cue.cue_swap.domain.entities.User;
import co.edu.cue.cue_swap.domain.enums.Role;
import co.edu.cue.cue_swap.infrastructure.repository.UserRepository;
import co.edu.cue.cue_swap.infrastructure.utils.Validation;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
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
        User user = userRepository.findByAccount_Username(username);
        if (!Validation.isNull(user)){
           return org.springframework.security.core.userdetails.User.builder().username(user.getUsername()).password(user.getPassword()).roles(getRole(user))
                    .build();
        }else throw new UsernameNotFoundException(username);
    }

    private String getRole(User user) {
        return Validation.isNull(user.getRole()) ? Role.STUDENT.name() :
                    user.getRole().name();
    }
}
