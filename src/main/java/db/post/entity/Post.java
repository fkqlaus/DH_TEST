package db.post.entity;

import db.category.entity.Category;
import db.comment.entity.Comment;
import db.post_image.entity.Post_image;
import db.user.entity.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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

    @Column(name = "post_date", updatable = false)
    private LocalDateTime postDate;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Post_image> postImages = new ArrayList<>();

    @PrePersist
    protected void onCreate() {
        postDate = LocalDateTime.from(LocalDateTime.now());
    }


}
