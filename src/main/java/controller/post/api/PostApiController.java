package controller.post.api;

import db.post.dto.PostDto;
import db.post.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class PostApiController {

    private final PostService postService;

    @PostMapping("/posts/write")
    public ResponseEntity<PostDto> writePost(@RequestBody PostDto post) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userId = authentication.getName();
        post.setUserId(userId);
        return ResponseEntity.status(HttpStatus.CREATED).body(postService.savePost(post));
    }

    @DeleteMapping("/posts")
    public ResponseEntity<Void> deletePost(@RequestParam Long postId) {
        postService.deletePost(postId);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PutMapping("/posts")
    public ResponseEntity<PostDto> updatePost(@RequestBody PostDto post) {
        return ResponseEntity.ok(postService.updatePost(post));
    }




}
