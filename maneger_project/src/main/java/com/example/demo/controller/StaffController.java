package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.Account;
import com.example.demo.entity.Department;
import com.example.demo.entity.Staff;
import com.example.demo.service.AccountService;
import com.example.demo.service.DepartmentService;
import com.example.demo.service.ProjectService;
import com.example.demo.service.StaffService;

@Controller
public class StaffController {
	@Autowired
	private StaffService staffService;

	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private ProjectService projectService;

	@GetMapping("/staff") // Xử lý GET request để lấy danh sách nhân viên
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("staffs", staffService.findAll());
		modelAndView.setViewName("liststaff");
		return modelAndView;
	}

	@GetMapping("/staff/add") // Xử lý GET request để hiển thị form thêm nhân viên
	public ModelAndView add() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		List<Account> listAccount = accountService.findAllAccount(); // Lấy danh sách tài khoản
		
		Map<Integer, String> accounts = new HashMap<>(); // Tạo map để lưu ID và tên tài khoản
		
		listAccount.forEach(item -> accounts.put(item.getAccountId(), item.getAccountName())); // Điền dữ liệu vào map tài khoản
		
		modelAndView.addObject("accounts", accounts); // Thêm map tài khoản vào model
		
		List<Department> listDepartment = departmentService.findAllDepartment(); // Lấy danh sách phòng ban
		
		Map<Integer, String> departments = new HashMap<>(); // Tạo map để lưu ID và tên phòng ban
		
		// Điền dữ liệu vào map phòng ban
		listDepartment.forEach(item -> departments.put(item.getDepartmentId(), item.getDepartmentName())); 
		modelAndView.addObject("departments", departments);
		modelAndView.addObject("staff", new Staff()); 
		modelAndView.setViewName("staffform");
		return modelAndView;
	}

	@GetMapping("/staff/{id}/edit") // Xử lý GET request để hiển thị form chỉnh sửa nhân viên
	public ModelAndView edit(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		
		modelAndView.addObject("staff", staffService.findOne(id)); // Thêm thông tin nhân viên theo ID vào model
		
		modelAndView.addObject("departments", departmentService.findAllDepartment()); // Thêm danh sách phòng ban vào model
		
		modelAndView.addObject("accounts", accountService.findAllAccount());
		modelAndView.setViewName("staffform");
		return modelAndView;
	}

	@RequestMapping(value = "/staff/save", method = RequestMethod.POST) // Xử lý POST request để lưu nhân viên
	public ModelAndView save(@ModelAttribute("staff") Staff staff, RedirectAttributes redirect) {
		ModelAndView modelAndView = new ModelAndView();
		staffService.save(staff); // Lưu nhân viên vào cơ sở dữ liệu
		redirect.addFlashAttribute("successMessage", "Saved staff successfully!");
		modelAndView.setViewName("redirect:/staff");
		return modelAndView;
	}

	@GetMapping("/staff/{id}/delete") // Xử lý GET request để xóa nhân viên
	public String delete(@PathVariable int id, RedirectAttributes redirect) {
		staffService.delete(id); // Gọi service để xóa nhân viên
		redirect.addFlashAttribute("successMessage", "Delete staff successfully!");
		return "redirect:/staff";
	}

	@GetMapping("/staff/search") // Xử lý GET request để tìm kiếm nhân viên
	public String search(@RequestParam("term") String term) {
		List<Staff> list = staffService.search(term); // Tìm kiếm nhân viên theo từ khóa
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("staffs", list); // Thêm danh sách nhân viên tìm được vào model
		return "redirect:/staff";
	}

	@RequestMapping(value = "/staff/detail/{id}", method = RequestMethod.GET) // Xử lý GET request để xem chi tiết nhân viên
	public ModelAndView detail(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		if (staffService.findOne(id) == null) { // Kiểm tra nếu nhân viên không tồn tại
			modelAndView.setViewName("error/404"); // Thiết lập view là error/404
		} else { // Nếu nhân viên tồn tại
			modelAndView.addObject("staff", staffService.findOne(id));
			modelAndView.setViewName("detailstaff");
		}
		return modelAndView;
	}

	@GetMapping(value = "project/{id}/staff/{idstaff}/task") // Xử lý GET request để lấy danh sách công việc của nhân
																// viên trong dự án
	public ModelAndView getTask(@PathVariable int id, @PathVariable int idstaff) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name); 
		modelAndView.addObject("project", projectService.getProjecByiD(id));
		modelAndView.addObject("staff", staffService.findOne(idstaff));
		modelAndView.addObject("tasks", staffService.getListTask(idstaff));
		modelAndView.setViewName("listtaskofstaff"); 
		return modelAndView;
	}
}
