package controller.main;

import db.post.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
public class MainController {

    private final PostService postService;


    @GetMapping("/")
    public String showMainPage(Model model) {
        Pageable pageable = PageRequest.of(0, 5); // 0페이지, 5개씩
        model.addAttribute("noticeList", postService.findPostsbyCategoryId(1L, pageable).getContent()); // 공지사항 카테고리 ID가 1이라고 가정
        return "/main/main"; // main.html로 이동
    }


}
