package db.user.entity;

import common.converter.RoleConverter;
import db.comment.entity.Comment;
import db.post.entity.Post;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "users")
public class User {
    @Id
    @Column(name = "user_id")
    private String userId;

    @Column(name = "user_pw")
    private String password;

    @Column(name = "user_name")
    private String userName;


    @Column(name = "user_phone")
    private String phone;

    @Convert(converter = RoleConverter.class)
    @Column(name = "user_role")
    private Role role;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Post> posts = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Comment> comments = new ArrayList<>();


}