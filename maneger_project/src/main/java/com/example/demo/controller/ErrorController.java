package com.example.demo.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

	@GetMapping(value = "/404") // Xử lý GET request cho lỗi 404
	public ModelAndView geteror() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); // Lấy thông tin xác thực
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.setViewName("error/404");
		return modelAndView;
	}

	@GetMapping("/error/500") // Xử lý GET request cho lỗi 500
	public ModelAndView error500() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.setViewName("error/500");
		return modelAndView;
	}

	@GetMapping("/error/403") // Xử lý GET request cho lỗi 403
	public ModelAndView error403() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.setViewName("error/403");
		return modelAndView;
	}

	@GetMapping("/error/400") // Xử lý GET request cho lỗi 400
	public ModelAndView error400() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // Lấy tên người dùng đang đăng nhập
		modelAndView.addObject("username", name);
		modelAndView.setViewName("error/400");
		return modelAndView;
	}
}
