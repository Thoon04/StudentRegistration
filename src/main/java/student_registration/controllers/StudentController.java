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

import student_registration.models.Course;
import student_registration.models.Education;
import student_registration.models.Student;
import student_registration.persistance.CourseReposistory;
import student_registration.persistance.EducationReposistory;
import student_registration.persistance.StudentReposistory;

@Controller
public class StudentController {
	@Autowired
	StudentReposistory stuRepo;
	@Autowired
	EducationReposistory educationRepo;
	@Autowired
	CourseReposistory courseRepo;
	@RequestMapping("students")
	public String displayAll(ModelMap map) {

		List<Student> students = stuRepo.getAll();

		map.addAttribute("students", students);
		return "display_student";
	}
	@GetMapping("addstudent")
	public ModelAndView addStudent(ModelMap map) {	
		List<Education> education = educationRepo.getAll();
		map.addAttribute("selected_education", education);
		List<Course> course = courseRepo.getAllCourse();
		map.addAttribute("selected_course", course);
		return new ModelAndView("add_student", "student", new Student());
	}
	@PostMapping("addstudent")
	public String addStudent(@ModelAttribute("student") @Validated Student student,
			BindingResult bResult, ModelMap map) {
		if (bResult.hasErrors()) {

			
			return "add_student";
		}
		int rs = stuRepo.add(student);
		if (rs == 0) {
			map.addAttribute("student", student);
			map.addAttribute("error_msg", "SQL Insert Error: ");
			
			return "add_student";
		} else {
			return "redirect:/students";
		}
	}
	
	@GetMapping("/deletestudent/{id}")
	public String deleteStudent(@PathVariable Integer id) {
		
		stuRepo.delete(id);
		return "redirect:/students";
	}
	@GetMapping("/editstudent/{id}")
	
	public ModelAndView editStudent(@PathVariable Integer id,ModelMap map) {
		
		Student student=new Student();
		
		student=stuRepo.getById(id);
	
		
		return new ModelAndView("edit_student","student",student);
	}
	@PostMapping("/editstudent")						
	public String editStudent(@ModelAttribute("student")@Validated Student student,
			BindingResult bResult,ModelMap map) {
	
	if(bResult.hasErrors()) {
		
		map.addAttribute("student", student);
		
		return "edit_student";
	}
	
	int rs=stuRepo.edit(student);
	if(rs==0) {
		map.addAttribute("error_msg", "SQL Edit Error");
		map.addAttribute("student", student);
		return "edit_students";
	}else {
		return "redirect:/students";
	}
	}
}
