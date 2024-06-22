package student_registration.controllers;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import student_registration.models.User;

import student_registration.persistance.UserReposistory;

@Controller
public class UserController {
	@Autowired
	UserReposistory userRepo;
	@RequestMapping("/user")
	public ModelAndView displayAll(ModelMap map) {

		List<User> users = userRepo.getAll();

		map.addAttribute("users", users);
		return new ModelAndView ("user_display", "user" ,new User());
	}
	@GetMapping(value="/adduser")
	public ModelAndView addUser(ModelMap map) {		
		return new ModelAndView("add_user", "user", new User());
	}
	@PostMapping(value="/adduser")
	public String addUser(@ModelAttribute("user") @Validated User user,
			BindingResult bResult, ModelMap map) {
		if (bResult.hasErrors()) {

			map.addAttribute("user",userRepo.getAll());
			return "user_display";
		}
		int rs = userRepo.add(user);
		if (rs == 0) {
			map.addAttribute("user",userRepo.getAll());
			map.addAttribute("error_msg", "SQL Insert Error: ");
			
			return "add_user";
		} else {
			return "redirect:/users";
		}
	}
	
	@GetMapping("/deleteuser/{userId}")
	public String deleteUser(@PathVariable Integer userId) {
		
		userRepo.delete(userId);
		return "redirect:/users";
	}
	@GetMapping("/edituser/{userId}")
	
	public ModelAndView editUser(@PathVariable Integer userId,ModelMap map) {
		
		User user=new User();
		
		user=userRepo.getById(userId);
	
		
		return new ModelAndView("edit_user","user",user);
	}
	@PostMapping("/edituser")						
	public String editUser(@ModelAttribute("user")@Validated User user,
			BindingResult bResult,ModelMap map) {
	
	if(bResult.hasErrors()) {
		
		map.addAttribute("user", user);
		
		return "edit_user";
	}
	
	int rs=userRepo.edit(user);
	if(rs==0) {
		map.addAttribute("error_msg", "SQL Edit Error");
		map.addAttribute("user", user);
		return "edit_user";
	}else {
		return "redirect:/users";
	}
	}
}
