package controller.guest;

import db.user.entity.User;
import db.user.setup.UserSetup;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class LoginController {

    private final UserSetup userSetup;


    @GetMapping("/login")
    public String showLoginPage() {
        return "/guest/login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String userId,
                               @RequestParam String password,
                               HttpSession session) {

        userSetup.createAdminUser();

        // 사용자 인증
        if (userId.equals("admin") && password.equals("123")) {
            // 로그인 성공
            session.setAttribute("userId", userId);
            session.setAttribute("userRole", userId.equals("admin") ? "ADMIN" : "USER");
            return "redirect:/";
        }
        // 로그인 실패
        return "redirect:/login?error=true";
    }

    @GetMapping("/logout")
    public String logOut(HttpSession session) {
        session.invalidate();

        // 메인 페이지로 리다이렉트
        return "redirect:/";
    }


}