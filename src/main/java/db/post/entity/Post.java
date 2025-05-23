package db.post.entity;

import db.user.entity.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "post")
@Getter
@Setter
@NoArgsConstructor
public class Post {


    @Id
    @Column(name = "post_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long postId;

    @Column(name = "post_title", length = 50)
    private String postTitle;

    @Column(name = "post")
    @Type(type = "org.hibernate.type.TextType")
    private String post;

    @Column(name = "post_date")
    private LocalDate postDate;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;


}
