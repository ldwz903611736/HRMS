package com.briup.hrms.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.hrms.bean.Employee;
import com.briup.hrms.service.EmployeeService;
import com.briup.hrms.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@GetMapping({"/login","/"})
	public String login() {
	
		return "login";
	}
	
	@PostMapping("/admin")
	public String admin(@RequestParam("name") String name,@RequestParam("passwd") String password,Model model,HttpSession httpSession) {
		Employee employee = loginService.admin(name, password);
		if(employee != null && StringUtils.equals(employee.getRole(), "经理")){
			httpSession.setAttribute("user", employee);
			System.out.println(employee.getRole());
			return "main";
		}
		if(employee == null) {
			model.addAttribute("msg", "用户名密码不正确！");
		}
		if(employee != null && !StringUtils.equals(employee.getRole(), "经理")){
			model.addAttribute("msg","权限不足！");
		}
		return "login";
	}
	
	@GetMapping({"/header"})
	public String header() {
		return "header";
	}
	
	@GetMapping("/quit")
	public String quit(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:login";
	}
	
	
}
