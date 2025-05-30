package db.comment.dto;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@RequiredArgsConstructor
public class CommentDto {
    private Long commentId;
    private String comment;
    private String userId;
    private Long postId;
    private String commentDate;

    public CommentDto(Long commentId, String comment, String userId, Long postId, String commentDate) {
        this.commentId = commentId;
        this.comment = comment;
        this.userId = userId;
        this.postId = postId;
        this.commentDate = commentDate;
    }
}
