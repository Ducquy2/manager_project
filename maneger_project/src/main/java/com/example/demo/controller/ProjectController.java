package com.example.demo.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.Project;
import com.example.demo.entity.Staff;
import com.example.demo.entity.Task;
import com.example.demo.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	@GetMapping("/project") // Xử lý GET request để lấy danh sách dự án
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name); // Thêm tên người dùng vào model
		modelAndView.addObject("projects", projectService.getListProject());
		modelAndView.setViewName("listproject");
		return modelAndView;
	}

	@GetMapping("/project/add") // Xử lý GET request để hiển thị form thêm dự án
	public ModelAndView add() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("project", new Project());
		modelAndView.setViewName("projectform");
		return modelAndView;
	}

	@GetMapping("/project/{id}/edit") // Xử lý GET request để hiển thị form chỉnh sửa dự án
	public ModelAndView edit(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("project", projectService.getProjecByiD(id));
		modelAndView.setViewName("projectform");
		return modelAndView;
	}

	@RequestMapping(value = "/project/save", method = RequestMethod.POST) // Xử lý POST request để lưu dự án
	public ModelAndView save(@ModelAttribute("project") Project project, RedirectAttributes redirect) {
		projectService.saveProject(project); // Lưu dự án vào cơ sở dữ liệu
		redirect.addFlashAttribute("notification", "bạn đã thực hiện thành công !"); // Thêm thông báo thành công
		return new ModelAndView("redirect:/project"); // Chuyển hướng về danh sách dự án
	}

	@GetMapping("/project/{id}/delete") // Xử lý GET request để xóa dự án
	public String delete(@PathVariable int id, RedirectAttributes redirect) {
		projectService.deleteProjectById(id); // Gọi service để xóa dự án
		redirect.addFlashAttribute("successMessage", "Deleted staff successfully!"); // Thêm thông báo thành công
		return "redirect:/project"; // Chuyển hướng về danh sách dự án
	}

	@RequestMapping(value = "/project/detail/{id}", method = RequestMethod.GET) // Xử lý GET request để xem chi tiết dự
																				// án
	public ModelAndView detail(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("project", projectService.getProjecByiD(id));
		modelAndView.setViewName("detailproject");
		return modelAndView;
	}

	@GetMapping(value = "/project/{id}/task") // Xử lý GET request để lấy danh sách công việc của dự án
	public ModelAndView getTask(@PathVariable int id, RedirectAttributes redirect) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("project", projectService.getProjecByiD(id));
		modelAndView.addObject("tasks", projectService.getListTaskOfProject(id));
		modelAndView.setViewName("listtaskofproject");
		redirect.addFlashAttribute("notification", "bạn đã thực hiện thêm task thành công !");
		return modelAndView;
	}

	@GetMapping(value = "/project/{id}/staff") // Xử lý GET request để lấy danh sách nhân viên của dự án
	public ModelAndView getstaff(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("project", projectService.getProjecByiD(id));
		modelAndView.addObject("staffs", projectService.getListStaffOfProject(id));
		modelAndView.setViewName("liststaffofproject");
		return modelAndView; // Trả về ModelAndView
	}

	@GetMapping(value = "/project/{id}/staff/add") // Xử lý GET request để hiển thị form thêm nhân viên vào dự án
	public ModelAndView addStaffProject(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("project", projectService.getProjecByiD(id));
		List<Staff> listStaff = projectService.getListStaffNotInProject(id);
		Map<Integer, String> staffs = new HashMap<>(); // Tạo map để lưu ID và tên nhân viên
		listStaff.forEach(item -> staffs.put(item.getStaffId(), item.getFullName())); // Điền dữ liệu vào map
		modelAndView.addObject("staffs", staffs); // Thêm map nhân viên vào model
		for (int i = 0; i < listStaff.size(); i++) { // Duyệt qua danh sách nhân viên
			modelAndView.addObject("staff", listStaff.get(i)); // Thêm từng nhân viên vào model (có thể không cần thiết)
		}
		modelAndView.setViewName("addstaffinproject");
		return modelAndView;
	}

	@PostMapping(value = "/project/{id}/staff/add/{idStaff}") // Xử lý POST request để thêm nhân viên vào dự án
	public String addStaffInproject(@PathVariable int id, @PathVariable int idStaff, RedirectAttributes redirect) {
		projectService.addStaffInProject(id, idStaff); // Gọi service để thêm nhân viên vào dự án
		redirect.addFlashAttribute("notification", "bạn đã thêm nhân viên thành công !"); // Thêm thông báo thành công
		return "redirect:/project/{id}/staff"; // Chuyển hướng về danh sách nhân viên của dự án
	}

	@GetMapping(value = "/project/{id}/addtask") // Xử lý GET request để hiển thị form thêm công việc vào dự án
	public String addTask(@PathVariable("id") int id, Model model, HttpServletRequest request) {

		Principal principal = request.getUserPrincipal(); // Lấy thông tin người dùng từ request

		model.addAttribute("username", principal.getName()); // Thêm tên người dùng vào model

		List<Task> taskList = projectService.getListBigTaskOfProject(id); // Lấy danh sách công việc lớn của dự án

		List<Staff> listStaff = projectService.getListStaffOfProject(id); // Lấy danh sách nhân viên của dự án

		Map<Integer, String> staffs = new HashMap<>(); // Tạo map để lưu ID và tên nhân viên

		listStaff.forEach(item -> staffs.put(item.getStaffId(), item.getFullName())); // Điền dữ liệu vào map nhân viên

		model.addAttribute("staffs", staffs); // Thêm map nhân viên vào model

		Map<Integer, String> listPreviousTask = new HashMap<>(); // Tạo map để lưu ID và tên công việc trước đó

		taskList.forEach(item -> listPreviousTask.put(item.getTaskId(), item.getTaskName())); // Điền dữ liệu vào map công việc

		model.addAttribute("listPreviousTask", listPreviousTask); // Thêm map công việc trước đó vào model
		Task task = new Task();
		task.setProjectId(projectService.getProjecByiD(id)); // Gán dự án cho công việc
		model.addAttribute("task", task);
		return "taskform";
	}

	@GetMapping(value = "/project/{id}/staff/{idStaff}/delete") // Xử lý GET request để xóa nhân viên khỏi dự án
	public String deleteStaffInProject(@PathVariable int id, @PathVariable int idStaff, RedirectAttributes redirect) {
		projectService.deleteStaffIdInProject(idStaff, id); // Gọi service để xóa nhân viên khỏi dự án

		redirect.addFlashAttribute("notification", "bạn đã xóa nhân viên thành công !"); // Thêm thông báo thành công

		return "redirect:/project/{id}/staff"; // Chuyển hướng về danh sách nhân viên của dự án
	}

//	@GetMapping(value = "/project/{id}/progress")
//	public String detailProject(@PathVariable int id, Model model) {
//		List<WorkLog> workLogList = workLogService.findByProjectIDOrderByDateCreateAsc(id);
//		Project project = projectService.getProjecByiD(id);
//		List<Date> listDate = Util.getListDate(project.getStartDate(), project.getFinishDate(),
//				workLogList.get(workLogList.size()-1).getDateCreate());
//		List<Double> listProgress = Util.getListExpectProgress(project.getStartDate(), project.getFinishDate());
//		List<Double> listActualProgress = Util.getListActualProgress(project.getStartDate(), workLogList);
//		List<String> listLabel = Util.getLabelFromListDate(listDate);
//		model.addAttribute("listProgress", listProgress);
//		model.addAttribute("listActualProgress", listActualProgress);
//		model.addAttribute("listLabel", listLabel);
//		return "progressproject";
//	}
}
