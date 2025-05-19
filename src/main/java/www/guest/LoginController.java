package www.guest;

import db.member.dto.LoginDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String showLoginPage() {
        return "/guest/login";
    }

    @PostMapping("/login")
    public String processLogin(@ModelAttribute LoginDTO loginDTO, Model model) {
        if ("admin".equals(loginDTO.getUsername()) && "1234".equals(loginDTO.getPassword())) {
            return "redirect:/main"; // 로그인 성공 시 이동할 페이지
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "/guest/login";
        }
    }


}