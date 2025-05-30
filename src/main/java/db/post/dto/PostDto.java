package db.post.dto;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Getter
@Setter
@NoArgsConstructor
public class PostDto {

    private Long postId;
    private String postTitle;
    private String post;
    private String userId;
    private LocalDateTime postDate;
    private Long categoryId;
    private String imageId;


}
