package db.comment.service;

import db.comment.dto.CommentDto;
import db.comment.entity.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CommentService {


    Page<CommentDto> getCommentsByPostId(Long postId, Pageable pageable);
    CommentDto saveComment(CommentDto commentDto);

}
