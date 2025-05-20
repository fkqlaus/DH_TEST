package db.user.dto;

import db.user.entity.Role;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class UserDto {
    private String id;
    private String userName;
    private String password;
    private String email;
    private Role role;

}