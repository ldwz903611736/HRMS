package com.briup.hrms.web.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.hrms.bean.Department;
import com.briup.hrms.bean.Employee;
import com.briup.hrms.common.exception.ServiceException;
import com.briup.hrms.service.DepartmentService;
import com.briup.hrms.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService deptService;
	
	@GetMapping("/toAddEmp")
	public String toAddEmp(HttpSession httpSession) {
		List<Department> departments = deptService.findAll();
		httpSession.setAttribute("depts", departments);
		return "emp/addEmp";
	}
	
	@PostMapping("/addEmp")
	public String addEmp(Employee employee) {
		try {
			if(employee.getId() != null) {
			
			}
			employeeService.save(employee);
			return "redirect:empList";
		}catch (Exception e) {
			// TODO: handle exception
			return "emp/addEmp";
		}
	}
	
	@GetMapping("/empList")
	public String empList(@RequestParam(value = "page",defaultValue = "1") Integer page,
						  @RequestParam(value = "size",defaultValue = "5") Integer size,
						  Model model) {
		PageRequest pageRequest = PageRequest.of(page-1, size);
		Page<Employee> employees = employeeService.findAll(pageRequest);
		model.addAttribute("empInfoPage", employees);
		model.addAttribute("emps", employees.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("size", size);
		return "emp/empList";
	}
	
	@PostMapping("/serach")
	public String serach(HttpSession httpSession,String deptName,String username,String empId,String downSalary,String upSalary) {
		List<Employee> employees = employeeService.empList(deptName, username, empId, downSalary, upSalary);
		httpSession.setAttribute("emps", employees);
		return "emp/empList";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("id") Long id,Model model) {
		Employee employee = employeeService.findEmployeeById(id);
		if(employee != null) {
			model.addAttribute("emp", employee);
			return "emp/addEmp";
		}else {
			return null;
		}
	}
	
}
