package controller.guest.api;

import db.user.dto.LoginDto;
import db.user.dto.UserDto;
import db.user.service.UserService;
import db.user.setup.UserSetup;
import lombok.RequiredArgsConstructor;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class LoginApiController {
    private final UserService userService;
    private final UserSetup userSetup;




}
