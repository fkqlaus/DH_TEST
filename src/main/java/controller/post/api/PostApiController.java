package controller.post.api;

import db.category.service.CategoryService;
import db.post.dto.PostDto;
import db.post.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class PostApiController {

    private final PostService postService;
    private final CategoryService categoryService;

//    @PostMapping("/posts")
//    public ResponseEntity<?> writePost(@RequestBody PostDto post) {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        String userId = authentication.getName();
//        post.setUserId(userId);
//
//        PostDto savedPost = postService.savePost(post);
//        log.info("savedPost: {}", savedPost);
//
//        return ResponseEntity.status(HttpStatus.CREATED)
//                .body(java.util.Collections.singletonMap("id", savedPost.getPostId()));
//
//    }
    @PostMapping("/posts")
    public ResponseEntity<?> writePost(@RequestBody PostDto post) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userId = authentication.getName();

        // 공지사항 카테고리일 때만 admin 권한 체크
        if ("공지사항".equals(categoryService.findById(post.getCategoryId()).getCategoryName())) {
            boolean isAdmin = authentication.getAuthorities().stream()
                    .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));
            if (!isAdmin) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN)
                        .body("공지사항은 관리자만 작성할 수 있습니다.");
            }
        }

        post.setUserId(userId);
        PostDto savedPost = postService.savePost(post);
        log.info("savedPost: {}", savedPost);

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(java.util.Collections.singletonMap("id", savedPost.getPostId()));
    }

    @DeleteMapping("/posts")
    public ResponseEntity<Void> deletePost(@RequestParam Long postId) {
        postService.deletePost(postId);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PutMapping("/posts")
    public ResponseEntity<PostDto> updatePost(@RequestBody PostDto post) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userId = authentication.getName();
        post.setUserId(userId);
        return ResponseEntity.ok(postService.updatePost(post));
    }




}
