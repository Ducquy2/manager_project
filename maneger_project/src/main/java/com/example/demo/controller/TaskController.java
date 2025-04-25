package com.example.demo.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.Staff;
import com.example.demo.entity.Task;
import com.example.demo.entity.TaskProgress;
import com.example.demo.service.ProjectService;
import com.example.demo.service.StaffService;
import com.example.demo.service.TaskProgressService;
import com.example.demo.service.TaskService;

@Controller
public class TaskController {
	@Autowired
	TaskService taskService;

	@Autowired
	StaffService staffService;

	@Autowired
	ProjectService projectService;

	@Autowired
	TaskProgressService taskProgressService;

	@RequestMapping(value = "/project/{id}/task/save", method = RequestMethod.POST) // Xử lý POST request để lưu công việc
	public ModelAndView save(@ModelAttribute("task") Task task, @PathVariable("id") int id,
			RedirectAttributes redirect) {
		ModelAndView modelAndView = new ModelAndView();
		taskService.saveTask(task); // Lưu công việc vào cơ sở dữ liệu
		modelAndView.addObject("project", projectService.getProjecByiD(id));
		modelAndView.setViewName("redirect:/project/{id}/task");
		redirect.addFlashAttribute("notification", "bạn thực hiện action thành công !");
		return modelAndView;
	}

	@GetMapping(value = "project/{idproject}/task/{id}/edit") // Xử lý GET request để hiển thị form chỉnh sửa công việc
	public ModelAndView edit(@PathVariable("idproject") int idproject, @PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		Task task = taskService.findById(id);
		modelAndView.addObject("task", task); 
		// Lấy danh sách nhân viên của dự án
		List<Staff> listStaff = projectService.getListStaffOfProject(task.getProjectId().getProjectId()); 
		Map<Integer, String> staffs = new HashMap<>(); // Tạo map để lưu ID và tên nhân viên
		listStaff.forEach(item -> staffs.put(item.getStaffId(), item.getFullName())); // Điền dữ liệu vào map
		modelAndView.addObject("staffs", staffs); // Thêm map nhân viên vào model
		modelAndView.addObject("project", projectService.getProjecByiD(idproject));
		modelAndView.setViewName("taskform");
		return modelAndView;
	}

	@GetMapping(value = "project/{id}/staff/{idstaff}/task/add") // Xử lý GET request để hiển thị form thêm công việc cho nhân viên
	public ModelAndView addTaskToStaff(@PathVariable("id") int id, @PathVariable("idstaff") int idstaff) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		Task task = new Task();
		task.setProjectId(projectService.getProjecByiD(id));
		modelAndView.addObject("task", task);
		Map<Integer, String> staffs = new HashMap<>(); // Tạo map để lưu ID và tên nhân viên
		Staff staff = staffService.findOne(idstaff);
		staffs.put(staff.getStaffId(), staff.getFullName());
		modelAndView.addObject("staffs", staffs);
		modelAndView.setViewName("taskform");
		return modelAndView;
	}

	@GetMapping(value = "project/{idproject}/task/{id}/addsubtask") // Xử lý GET request để hiển thị form thêm công việc con
	
	public ModelAndView addSubTask(@PathVariable("idproject") int idproject, @PathVariable("id") int id) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		
		modelAndView.addObject("username", name);
		
		modelAndView.addObject("project", projectService.getProjecByiD(idproject));
		
		Task parentTask = taskService.findById(id); // Lấy thông tin công việc cha
		
		Task task = new Task(); // Tạo đối tượng Task rỗng
		
		task.setProjectId(parentTask.getProjectId()); // Gán dự án cho công việc con
		
		task.setTaskIdparent(parentTask.getTaskId()); // Gán ID công việc cha
		
		modelAndView.addObject("task", task); // Thêm công việc con vào model
		
		 // Lấy danh sách nhân viên của dự án
		List<Staff> listStaff = projectService.getListStaffOfProject(task.getProjectId().getProjectId());
		
		Map<Integer, String> staffs = new HashMap<>(); // Tạo map để lưu ID và tên nhân viên
		
		listStaff.forEach(item -> staffs.put(item.getStaffId(), item.getFullName())); // Điền dữ liệu vào map
		
		modelAndView.addObject("staffs", staffs); // Thêm map nhân viên vào model
		
		modelAndView.setViewName("taskform");
		return modelAndView;
	}

	@GetMapping(value = "/task/detail/{id}") // Xử lý GET request để xem chi tiết công việc
	public ModelAndView getTask(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("task", taskService.findById(id));
		modelAndView.setViewName("detailtask");
		return modelAndView;
	}

	@GetMapping(value = "project/{id}/task/delete/{idtask}") // Xử lý GET request để xóa công việc
	public ModelAndView deleteTask(@PathVariable("id") int id, @PathVariable("idtask") int idtask,
			RedirectAttributes redirect) {
		ModelAndView modeleAndView = new ModelAndView();
		
		modeleAndView.setViewName("redirect:/project/{id}/task");
		
		List<Task> listTaskOfProject = projectService.getListTaskOfProject(id); // Lấy danh sách công việc của dự án
		
		Task task = taskService.findById(idtask); // Lấy thông tin công việc theo ID
		
		for (int i = 0; i < listTaskOfProject.size(); i++) { // Duyệt qua danh sách công việc
			
			if (task.getTaskId() == listTaskOfProject.get(i).getTaskIdparent()) { // Kiểm tra nếu công việc có công việc con
				System.out.println("task nay dang co task con nen ban phai xoa task con truoc !");
				redirect.addFlashAttribute("notification",
						"Task " + task.getTaskName() + " có task con, Nếu muốn xóa bạn phải xóa task con trước !");
				return modeleAndView;
			}
		}
		taskService.deleteTask(idtask); // Xóa công việc
		redirect.addFlashAttribute("notification", "Thực hiện xóa task thành công !");
		return modeleAndView;
	}

	@GetMapping(value = "task/{id}/worklog") // Xử lý GET request để hiển thị form thêm tiến độ công việc
	public ModelAndView createWorkLog(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView();
		TaskProgress taskProgress = new TaskProgress();
		Task task = taskService.findById(id); // Lấy thông tin công việc theo ID
		Set<Task> previousTasks = task.getPreviousTask(); // Lấy danh sách công việc trước đó
		for (Task previousTask : previousTasks) { // Kiểm tra các công việc trước đó
			if (previousTask.getTaskState() < 100) { // Nếu công việc trước chưa hoàn thành 100%
				mav.setViewName("/error/403");
				return mav;
			}
		}
		taskProgress.setTaskId(task); // Gán công việc cho tiến độ
		taskProgress.setDateLog(new Date()); // Đặt ngày ghi tiến độ là hiện tại
		mav.addObject("taskprogress", taskProgress);
		mav.addObject(task);
		mav.setViewName("progresstaskform");
		return mav; 
	}

	@GetMapping(value = "project/{projectId}/task/{taskId}/assign") // Xử lý GET request để hiển thị form phân công công việc
	public ModelAndView assignTask(@PathVariable("projectId") int projectId, @PathVariable("taskId") int taskId,
			RedirectAttributes redirect) {
		ModelAndView modelAndView = new ModelAndView();
		Task task = taskService.findById(taskId); // Lấy thông tin công việc theo ID
		modelAndView.addObject("task", task); 
		List<Staff> listStaff = projectService.getListStaffOfProject(task.getProjectId().getProjectId());
		Map<Integer, String> staffs = new HashMap<>(); // Tạo map để lưu ID và tên nhân viên
		
		listStaff.forEach(item -> staffs.put(item.getStaffId(), item.getFullName())); // Điền dữ liệu vào map
		
		modelAndView.addObject("staffs", staffs); // Thêm map nhân viên vào model
		
		modelAndView.addObject("project", projectService.getProjecByiD(projectId));
		
		modelAndView.setViewName("assignTask");
		
		redirect.addFlashAttribute("message", "bạn thực hiện assign task thành công !");
		
		return modelAndView;
	}
}
