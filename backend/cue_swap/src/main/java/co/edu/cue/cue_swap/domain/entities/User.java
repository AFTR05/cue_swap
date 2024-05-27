package co.edu.cue.cue_swap.domain.entities;

import co.edu.cue.cue_swap.domain.enums.Role;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

@Data
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "\"user\"")
public class User implements UserDetails, Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 15)
    private String nid;

    private Integer available_points;

    @Embedded
    private Account account;

    @Column(length = 50)
    private String name;

    @Column(length = 50)
    private String email;

    @Enumerated(EnumType.STRING)
    private Role role;

    @OneToMany(mappedBy = "user",cascade = CascadeType.REMOVE, fetch = FetchType.LAZY,  orphanRemoval = true)
    @JsonIgnore
    private List<Product> products;

    @OneToMany(mappedBy = "owner",cascade = CascadeType.REMOVE, fetch = FetchType.LAZY,  orphanRemoval = true)
    @JsonIgnore
    private List<Publication> publications;

    @OneToMany(mappedBy = "denounced",cascade = CascadeType.REMOVE, fetch = FetchType.LAZY,  orphanRemoval = true)
    @JsonIgnore
    private List<Complaint> user_reports;

    @OneToMany(mappedBy = "complainant",cascade = CascadeType.REMOVE, fetch = FetchType.LAZY,  orphanRemoval = true)
    @JsonIgnore
    private List<Complaint> made_reports;

    @ManyToMany(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinTable(name = "user_rewards")
    @JsonIgnore
    private List<Reward> rewards;

    private Boolean data_state;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(role.name()));
    }

    @Override
    public String getPassword() {
        return this.account.getPassword();
    }

    @Override
    public String getUsername() {
        return this.account.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }


}
