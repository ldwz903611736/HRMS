package com.briup.hrms.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.hrms.bean.Department;
import com.briup.hrms.bean.Employee;
import com.briup.hrms.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService deptService;
	
	
	@GetMapping("/toAddDepart")
	public String toAddDepart() {
		return "depart/addDepart";
	}
	
	@PostMapping("/addAndUpdateDepart")
	public String addAndUpdateDepart(Department department) {
		try{
			deptService.insert(department);
			return "redirect:toDepartList";
		}catch (Exception e) {
			// TODO: handle exception
			return "depart/addDepart";
		}
	}
	
	@GetMapping("/findAll")
	public String findAllByPage(@RequestParam(value = "page",defaultValue = "1") Integer page,
								@RequestParam(value = "size",defaultValue = "5") Integer size,
								Model model) {
		PageRequest pageRequest = PageRequest.of(page-1, size);
		Page<Department> departmentsInfoPage = deptService.findAllByPage(pageRequest);
		model.addAttribute("departmentsInfoPage", departmentsInfoPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("size", size);
		model.addAttribute("depts", departmentsInfoPage.getContent());
		
		return "depart/departList";
	}
	
	@GetMapping("/toDepartList")
	public String toDepartList(Model model,
			@RequestParam(value = "deptId",required = false) Long id,
			@RequestParam(value = "deptName",required = false)String deptName) {
		Department department = new Department();
		if(id != null) {
			department.setId(id);
		}
		if(StringUtils.isNotBlank(deptName)) {
			department.setName(deptName);
		}
		
		List<Department> list = deptService.search(department);
		model.addAttribute("depts", list);
		return "depart/departList";
	}
	
	@GetMapping("/toEdit")
	public String toEdit(@RequestParam("id") Long id,Model model) {
		Department department = deptService.findById(id);
		model.addAttribute("dept", department);
		return "depart/addDepart";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		deptService.delete(id);
		return "redirect:toDepartList";
	}
	
}
