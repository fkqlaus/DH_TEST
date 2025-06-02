package db.comment.dto;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Data
@Getter
@Setter
@RequiredArgsConstructor
public class CommentDto {
    private Long commentId;
    private String comment;
    private String userId;
    private Long postId;
    private LocalDateTime commentDate;

    public CommentDto(Long commentId, String comment, String userId, Long postId, LocalDateTime commentDate) {
        this.commentId = commentId;
        this.comment = comment;
        this.userId = userId;
        this.postId = postId;
        this.commentDate = commentDate;
    }
}
