package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {
    @GetMapping("/")
    public String home(Model model) {
        return "index";
    }
}