package db.post_image.entity;



import db.post.entity.Post;

import javax.persistence.*;

@Entity
@Table(name = "Post_Image")
public class PostImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long imageId;

    @Column(name = "image_path", nullable = false, length = 500)
    private String imagePath;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "post_id", nullable = false)
    private Post post;

    // getter, setter
}