package controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @GetMapping("/")
    public String showMainPage() {
        return "/main/main"; // main.html로 이동
    }

    @PostMapping("/logout")
    public String logOut(HttpSession session) {
        session.invalidate();

        // 메인 페이지로 리다이렉트
        return "redirect:/";

    }
}
