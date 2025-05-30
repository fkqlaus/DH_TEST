package controller.post;

import db.category.service.CategoryService;
import db.post.dto.PostDto;
import db.post.entity.Post;
import db.post.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;
    private final CategoryService categoryService;

    @GetMapping("/posts")
    public String showBoardList(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String searchTitle,
            @RequestParam(required = false) String categoryName,
            Model model) {

        PageRequest pageRequest = PageRequest.of(page, size,
                Sort.by("postId").descending());

        Page<Post> postPage = postService.findPosts(searchTitle, pageRequest, categoryName);

        model.addAttribute("categoryName", categoryName); // 카테고리 이름 유지
        model.addAttribute("posts", postPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", postPage.getTotalPages());
        model.addAttribute("totalItems", postPage.getTotalElements());
        model.addAttribute("searchTitle", searchTitle); // 검색어 유지

        return "post/list";
    }


    // 게시판 글쓰기 페이지
    @GetMapping("/posts/write")
    public String showBoardWrite(Model model) {
        model.addAttribute("categories", categoryService.findAllCategories());
        return "post/write"; // post/write.html로 이동
    }



    // 게시판 글 상세 페이지
    @GetMapping("/posts/{postId}")
    public String postDetail(@PathVariable("postId") Long postId, Model model, @RequestParam String categoryName) {
        PostDto post = postService.getPostById(postId);
        log.info("categoryName: {}", categoryName);
        if (post == null) {
            return "redirect:/posts?categotyName=" + categoryName; // 게시글이 없으면 게시판 목록으로 리다이렉트
        }
        model.addAttribute("categoryName", categoryName); // 카테고리 이름 유지
        model.addAttribute("post", post);
        return "post/detail"; // post/detail.html로 이동
    }

    // 게시판 글 수정 페이지
    @GetMapping("/posts/{postId}/edit")
    public String postEdit(@PathVariable("postId") Long postId, Model model) {
        PostDto post = postService.getPostById(postId);
        if (post == null) {
            return "redirect:/posts"; // 게시글이 없으면 게시판 목록으로 리다이렉트
        }
        model.addAttribute("post", post);
        model.addAttribute("categories", categoryService.findAllCategories());
        return "post/write";
    }

}
