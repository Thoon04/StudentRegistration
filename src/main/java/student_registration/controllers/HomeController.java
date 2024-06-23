package student_registration.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("stuR")
	public String welcome() {
		return "welcome";
	}
	
	@RequestMapping("/hi")
	public String hello() {
		String a = "This is string";
		System.out.println(a);
		return "welcome";
	}
}

