package www.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/main")
    public String showMainPage() {
        return "/main/main"; // main.html로 이동
    }
}
