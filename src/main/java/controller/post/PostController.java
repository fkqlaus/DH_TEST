package controller.post;

import db.post.dto.PostDto;
import db.post.entity.Post;
import db.post.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;

    @GetMapping("/posts/list")
    public String showBoardList(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String searchTitle,
            Model model) {

        PageRequest pageRequest = PageRequest.of(page, size,
                Sort.by("postId").descending());

        Page<Post> postPage = postService.findPosts(searchTitle, pageRequest);

        model.addAttribute("posts", postPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", postPage.getTotalPages());
        model.addAttribute("totalItems", postPage.getTotalElements());
        model.addAttribute("searchTitle", searchTitle); // 검색어 유지

        return "post/list";
    }


    // 게시판 글쓰기 페이지
    @GetMapping("/posts/write")
    public String showBoardWrite() {
        return "post/write"; // post/write.html로 이동
    }

    @PostMapping("/posts/write")
    public String writePost(PostDto post, HttpSession session) {
        post.setUserId(session.getAttribute("userId").toString());
        postService.savePost(post);
        return "redirect:/posts/list"; // 글 작성 후 목록 페이지로 리다이렉트
    }

    // 게시판 글 상세 페이지
    @GetMapping("/posts/detail")
    public String postDetail(@RequestParam("postId") Long postId, Model model) {
        Post post = postService.getPostById(postId);
        if (post == null) {
            return "redirect:/posts/list";
        }
        model.addAttribute("post", post);
        return "post/detail"; // post/detail.html로 이동
    }
}
