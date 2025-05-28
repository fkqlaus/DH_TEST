package controller.guest;

import db.user.dto.UserDto;
import db.user.service.UserService;
import db.user.setup.UserSetup;
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
    private final UserSetup userSetup;


    @GetMapping("/login")
    public String showLoginPage(HttpServletRequest request, HttpSession session) {
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.contains("/login")) {
            session.setAttribute("redirectAfterLogin", referer);
        }
        return "/guest/login";
    }


    @GetMapping("/logout")
    public String logOut(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}