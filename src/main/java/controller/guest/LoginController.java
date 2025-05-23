package controller.guest;

import db.user.dto.UserDto;
import db.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
public class LoginController {

    private final UserService userService;

    @GetMapping("/login")
    public String showLoginPage(HttpServletRequest request, HttpSession session) {
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.contains("/login")) {
            session.setAttribute("redirectAfterLogin", referer);
        }
        return "/guest/login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String userId,
                             @RequestParam String password,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        
        UserDto userDto = userService.authenticate(userId, password);
        
        if (userDto != null) {
            // 로그인 성공
            session.setAttribute("userId", userDto.getId());
            session.setAttribute("userName", userDto.getUserName());
            session.setAttribute("userRole", userDto.getRole().getValue());

            // 로그인 전 방문했던 URL로 리디렉션
            String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
            session.removeAttribute("redirectAfterLogin"); // 한 번만 사용
            return "redirect:" + (redirectUrl != null ? redirectUrl : "/");
        }

        // 로그인 실패
        redirectAttributes.addFlashAttribute("loginError", "아이디 또는 비밀번호가 잘못되었습니다.");
        return "redirect:/login?error=true";
    }

    @GetMapping("/logout")
    public String logOut(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}