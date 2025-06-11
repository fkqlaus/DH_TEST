package db.post.entity;

import db.attachment.entity.Attachment;
import db.post_image.entity.PostImage;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "Post")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long postId;

    @Column(name = "post_title", nullable = false, columnDefinition = "TEXT")
    private String postTitle;

    @Column(name = "post_content", nullable = false, columnDefinition = "TEXT")
    private String postContent;

    @Column(name = "post_view")
    private Long postView = 0L;

    @Column(name = "user_id", nullable = false, length = 30)
    private String userId;

    @Column(name = "password", nullable = false, length = 30)
    private String password;

    @Column(name = "post_date", nullable = false)
    private LocalDateTime postDate;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PostImage> images;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Attachment> attachments;

    // getter, setter
}