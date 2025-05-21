package controller.Board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {

    // 게시판 목록 페이지
    @GetMapping("/board/list")
    public String showBoardList(@RequestParam(name = "type", required = false) String type, Model model) {
        return "board/list"; // board/list.html로 이동
    }

    // 게시판 글쓰기 페이지
    @GetMapping("/board/write")
    public String showBoardWrite() {
        return "board/write"; // board/write.html로 이동
    }

    // 게시판 글 상세 페이지
    @GetMapping("/board/detail")
    public String showBoardDetail() {
        return "board/detail"; // board/detail.html로 이동
    }
}
