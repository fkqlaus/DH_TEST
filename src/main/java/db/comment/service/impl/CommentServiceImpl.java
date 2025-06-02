package db.comment.service.impl;

import db.comment.dto.CommentDto;
import db.comment.entity.Comment;
import db.comment.repository.CommentRepository;
import db.comment.service.CommentService;
import db.post.entity.Post;
import db.post.repository.PostRepository;
import db.user.entity.User;
import db.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {

    private final CommentRepository commentRepository;
    private final PostRepository postRepository;
    private final UserRepository userRepository;

    @Override
    public Page<CommentDto> getCommentsByPostId(Long postId, Pageable pageable) {
        return commentRepository.findByPost_PostId(postId, pageable)
                .map(this::toDto);
    }

    @Override
    public CommentDto saveComment(CommentDto commentDto) {
        Post post = postRepository.findById(commentDto.getPostId()).get();
        User user = userRepository.findById(commentDto.getUserId()).get();
        Comment comment = new Comment();
        comment.setComment(commentDto.getComment());
        comment.setPost(post);
        comment.setUser(user);
        comment.setCommentDate(commentDto.getCommentDate());
        Comment saved = commentRepository.save(comment);
        return toDto(saved);
    }

    private CommentDto toDto(Comment comment) {
        return new CommentDto(
                comment.getCommentId(),
                comment.getComment(),
                comment.getUser().getUserId(),
                comment.getPost().getPostId(),
                comment.getCommentDate()
        );
    }
}