package db.attachment.entity;


import db.post.entity.Post;

import javax.persistence.*;

@Entity
@Table(name = "Attachment")
public class Attachment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long attachmentId;

    @Column(name = "file_name", nullable = false, length = 40)
    private String fileName;

    @Column(name = "file_saved_name", nullable = false, length = 40)
    private String fileSavedName;

    @Column(name = "file_path", nullable = false, length = 500)
    private String filePath;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "post_id", nullable = false)
    private Post post;

    // getter, setter
}