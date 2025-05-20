package controller.guest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    private static final Map<String, String> USERS = new HashMap<>();
    static {
        // 테스트용 계정 추가
        USERS.put("admin", "123");
        USERS.put("user", "123");
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "/guest/login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String userId,
                               @RequestParam String password,
                               HttpSession session) {
        // 사용자 인증
        if (USERS.containsKey(userId) && USERS.get(userId).equals(password)) {
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