package controller.comment.api;

import db.comment.dto.CommentDto;
import db.comment.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/comments")
public class CommentApiController {

    private final CommentService commentService;

    @GetMapping("/{postId}")
    public Page<CommentDto> getComments(
            @PathVariable Long postId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        return commentService.getCommentsByPostId(postId, PageRequest.of(page, size));
    }

    @PostMapping
    public CommentDto saveComment(@RequestBody CommentDto commentDto) {
        return commentService.saveComment(commentDto);
    }
}