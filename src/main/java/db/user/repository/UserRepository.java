package db.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import db.user.entity.User;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    Optional<User> findByUserId(String userId);
    boolean existsByUserName(String userName);


}
