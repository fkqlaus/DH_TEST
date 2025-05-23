package db.user.service.impl;

import db.user.dto.UserDto;
import db.user.entity.User;
import db.user.repository.UserRepository;
import db.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public UserDto authenticate(String userId, String password) {


        return userRepository.findByUserId(userId)
            .filter(user -> user.getPassword().equals(password))
            .map(this::convertToDto)
            .orElse(null);
    }

    public User findById(String id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("사용자를 찾을 수 없습니다."));
    }



    public UserDto convertToDto(User user) {

        log.info("UserDto 생성 - ID: {}, Password: {}", user.getUserId(), user.getPassword());

        UserDto userDto = new UserDto();
        userDto.setId(user.getUserId());
        userDto.setUserName(user.getUserName());
        userDto.setPassword(user.getPassword());
        userDto.setRole(user.getRole());
        return userDto;
    }
}