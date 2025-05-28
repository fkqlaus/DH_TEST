package controller.post.api;

import db.post.dto.PostDto;
import db.post.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class PostApiController {

    private final PostService postService;

    @PostMapping("/posts/write")
    public ResponseEntity<PostDto> writePost(@RequestBody PostDto post, HttpSession session) {
        post.setUserId(session.getAttribute("userId").toString());
        return ResponseEntity.ok(postService.savePost(post)); // 작성된 게시글 반환
    }




}
