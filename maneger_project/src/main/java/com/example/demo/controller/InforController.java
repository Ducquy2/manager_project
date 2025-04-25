package com.example.demo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.entity.Feedback;
import com.example.demo.service.FeedBackService;

@Controller
public class InforController {
	@Autowired
	private FeedBackService feedback;
	@Autowired
	public JavaMailSender emailSender;

	@GetMapping(value = "/aboutteam") // Xử lý GET request để hiển thị thông tin đội ngũ
	public ModelAndView getInforTeam() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.setViewName("intror/aboutteam");
		return modelAndView;
	}

	@GetMapping(value = "/aboutapp") // Xử lý GET request để hiển thị thông tin ứng dụng
	public ModelAndView getInforWeb() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.setViewName("intror/aboutapp");
		return modelAndView;
	}

	@GetMapping(value = "/feedback/add") // Xử lý GET request để hiển thị form thêm phản hồi
	public ModelAndView getInforWebFeedback() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("feedback", new Feedback());
		modelAndView.setViewName("intror/feedback");
		return modelAndView;
	}

	@RequestMapping(value = "/feedback/save", method = RequestMethod.POST) // Xử lý POST request để lưu phản hồi
	public ModelAndView save(@ModelAttribute("feedback") Feedback feedbacks) {
		feedback.saveFeedback(feedbacks); // Lưu phản hồi vào cơ sở dữ liệu
		return new ModelAndView("redirect:/thankyou"); // Chuyển hướng đến trang cảm ơn
	}

	@GetMapping(value = "/getfeedback") // Xử lý GET request để lấy danh sách phản hồi
	public ModelAndView getAllWebFeedback() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("feedbacks", feedback.listfeedBack());
		modelAndView.setViewName("intror/listfeedback");
		return modelAndView;
	}

	@GetMapping(value = "/thankyou") // Xử lý GET request để hiển thị trang cảm ơn
	public String thank() {
		return "intror/thankyou"; // Trả về view intror/thankyou
	}

	@GetMapping(value = "/getfeedback/{id}/feedack") // Xử lý GET request để hiển thị form phản hồi nhanh
	public ModelAndView feedBack(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.addObject("feedback", feedback.getFeedBack(id));
		modelAndView.setViewName("intror/quickemail");
		return modelAndView;
	}

	@PostMapping(value = "/getfeedback/{id}/feedack") // Xử lý POST request để gửi email phản hồi
	public ModelAndView sendreponsefeedBack(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name); // Thêm tên người dùng vào model
		modelAndView.addObject("feedback", feedback.getFeedBack(id)); // Thêm thông tin phản hồi vào model
		Feedback feedbackreponse = feedback.getFeedBack(id); // Lấy thông tin phản hồi theo ID
		SimpleMailMessage message = new SimpleMailMessage(); // Tạo đối tượng email
		message.setTo(feedbackreponse.getEmail()); // Đặt địa chỉ email người nhận
		message.setSubject("Thank you your feedback !"); // Đặt tiêu đề email
		message.setText("Hello, " + feedbackreponse.getName() + ", \r\n"
				+ "Chúng tôi sẽ ghi nhận ý kiến của bạn và nâng cấp phần mềm tốt hơn trong thời gian tới !");
		this.emailSender.send(message); // Gửi email
		return new ModelAndView("redirect:/getfeedback");
	}

	@RequestMapping(value = "/username", method = RequestMethod.GET) // Xử lý GET request để lấy tên người dùng hiện tại
	@ResponseBody // Trả về dữ liệu dạng thô (String)
	public String currentUserNameSimple(HttpServletRequest request) {
		Principal principal = request.getUserPrincipal(); // Lấy thông tin người dùng từ request
		System.out.println(principal.getName()); // In tên người dùng ra console
		return principal.getName();
	}

}
