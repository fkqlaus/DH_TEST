package db.user.service;

import db.user.dto.UserDto;
import db.user.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    public UserDto authenticate(String userId, String password);

    User findById(String id);

    UserDto convertToDto(User user);


}