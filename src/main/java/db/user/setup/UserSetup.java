package db.user.setup;

import db.user.entity.Role;
import db.user.entity.User;
import db.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service // 또는 @Component
public class UserSetup {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void createAdminUser() {
        if (!userRepository.existsByUserName("admin")) {
            User adminUser = new User();
            adminUser.setUserId("admin");
            adminUser.setUserName("admin");
            adminUser.setPassword("123");
            adminUser.setPhone("010-1234-5678");
            adminUser.setRole(Role.ADMIN); // ROLE_ADMIN으로 설정됨

            userRepository.save(adminUser);
            System.out.println("관리자 계정이 생성되었습니다.");
        } else {
            System.out.println("이미 관리자 계정이 존재합니다.");
        }
    }
}