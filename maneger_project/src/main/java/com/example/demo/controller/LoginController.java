package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.entity.Account;
import com.example.demo.service.AccountService;

@Controller
public class LoginController {

	@Autowired
	private AccountService accountService;

	@GetMapping(value = { "/", "/login" }) // Xử lý GET request cho trang đăng nhập
	public ModelAndView loginpage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}

	@GetMapping(value = "/registration") // Xử lý GET request để hiển thị form đăng ký
	public ModelAndView register() {
		ModelAndView modelAndView = new ModelAndView();
		Account account = new Account();
		modelAndView.addObject("account", account);
		modelAndView.setViewName("registration");
		return modelAndView;
	}

	@PostMapping(value = "/registration") // Xử lý POST request để tạo tài khoản mới
	public ModelAndView createNewUser(@Valid Account account, BindingResult bindingResult) {
		ModelAndView modelAndView = new ModelAndView();
		Account accountExist = accountService.findAccountByAccountName(account.getAccountName());
		// Kiểm tra tài khoản đã tồn tại
		if (accountExist != null) {
			bindingResult.rejectValue("account", "error.email", "this is user with email name have exist in DB !");
		}
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("registration");
		} else {
			accountService.saveAccount(account); // Lưu tài khoản mới
			modelAndView.addObject("successfull", "User add successfull !");
			modelAndView.addObject("account", new Account());
			modelAndView.setViewName("redirect:/login");
		}
		return modelAndView;
	}

	@GetMapping(value = "/welcome") // Xử lý GET request cho trang chào mừng sau đăng nhập
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Account account = accountService.findAccountByAccountName(auth.getName()); // Lấy thông tin tài khoản theo tên
		modelAndView.addObject("accountName", account.getAccountName());
		modelAndView.addObject("adminMessage", "Content Available Only for Users with Admin Role");
		modelAndView.setViewName("welcome");
		return modelAndView;
	}

	@GetMapping(value = "/logout") // Xử lý GET request để đăng xuất
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().removeAttribute("staff");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("logout", true);
		modelAndView.setViewName("redirect:/login");
		return modelAndView;
	}
}
