package student_registration.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("stuR")
	public String welcome() {
		return "welcome";
	}
	@RequestMapping("/hello")
	public String hello() {
		return "welcome";
	}
}



