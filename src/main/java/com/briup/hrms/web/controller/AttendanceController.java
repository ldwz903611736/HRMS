package com.briup.hrms.web.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.naming.directory.SearchControls;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.hrms.bean.Attendance;
import com.briup.hrms.bean.Department;
import com.briup.hrms.bean.Employee;
import com.briup.hrms.dao.AttendanceDao.SignData;
import com.briup.hrms.service.AttendanceService;
import com.briup.hrms.service.DepartmentService;
import com.fasterxml.jackson.databind.json.JsonMapper;

import net.bytebuddy.implementation.bytecode.ByteCodeAppender.Size;

@Controller
public class AttendanceController {
	@Autowired
	private AttendanceService attendService;
	@Autowired
	private DepartmentService deptService;
	
	private SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
	
	
	@GetMapping("/toqiandao")
	public String qiandao() {
		System.out.println("in toqiandao");
		
		return "attendace/qiandao";
	}
	@PostMapping("/qianDao")
	@ResponseBody
	public List<SignData> qiandao(HttpSession session) {
		System.out.println("in qiandao");
		Employee emp = (Employee) session.getAttribute("user");
				
		attendService.sign(emp);
				
		return attendService.getSignData(emp.getId(), format.format(new Date()));
	}
	
	@PostMapping("/getQianDaoData")
	@ResponseBody
	public List<SignData> getQianDaoData(HttpSession session) {
		//查询当月的所有的签到信息
		Employee emp = (Employee) session.getAttribute("user");
		
		return attendService.getSignData(emp.getId(), format.format(new Date()));

	}
	
	@GetMapping("/searchTd")
	public String search(@RequestParam(value = "page",defaultValue = "1") Integer page,
			@RequestParam(value = "size",defaultValue = "5") Integer size,
			@RequestParam(value = "departId") Long departId,
			@RequestParam(value = "attendType") String attendType,
			Model model) {
		
		long current=System.currentTimeMillis();//当前时间毫秒数
		long zero=current/(10003600*24)*(10003600*24)-TimeZone.getDefault().getRawOffset();
		Pageable pageable = PageRequest.of(page-1, size,Sort.Direction.DESC,"id");
		
		List<Attendance> todayPageInfo = attendService.searchTd(new Timestamp(zero), pageable, departId, attendType);
		
		//model.addAttribute("todayPageInfo", todayPageInfo);
		model.addAttribute("atts", todayPageInfo);
		//model.addAttribute("size", size);
		//model.addAttribute("currentPage", page);
		return "attendace/todayAttend";
	}
	
	@GetMapping("/todayAttend")
	public String todayAttend(Model model,
			@RequestParam(value = "page",defaultValue = "1") Integer page,
			@RequestParam(value = "size",defaultValue = "5") Integer size)
	 {
		long current=System.currentTimeMillis();//当前时间毫秒数
		long zero=current/(10003600*24)*(10003600*24)-TimeZone.getDefault().getRawOffset();
		PageRequest pageable = PageRequest.of(page-1, size);
		
		Page<Attendance> todayPageInfo = attendService.todayAttend(new Timestamp(zero),pageable);
		
		model.addAttribute("todayPageInfo", todayPageInfo);
		model.addAttribute("atts", todayPageInfo.getContent());
		model.addAttribute("size", size);
		model.addAttribute("currentPage", page);
		return "attendace/todayAttend";
	}
	
	
	/*
	 * @GetMapping("/toSarchAttend") public String toSarchAttend(Model model) {
	 * List<Attendance> attendances = attendService.findAll();
	 * model.addAttribute("atts", attendances); return "attendace/searchAttend"; }
	 */
	
	@GetMapping("/toSarchAttend")
	public String toSearchAttend(@RequestParam(value = "page",defaultValue = "1") Integer page,
								  @RequestParam(value = "size",defaultValue = "5") Integer size,
								  Model model,
								  HttpSession session) {
		PageRequest pageRequest = PageRequest.of(page - 1, size);
		Page<Attendance> attendanceInfoPage = attendService.findAll(pageRequest);
		model.addAttribute("atts", attendanceInfoPage.getContent());
		model.addAttribute("attendanceInfoPage", attendanceInfoPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("size", size);
		session.setAttribute("depts", deptService.findAll());
		return "attendace/searchAttend";
	}
	
	
	@GetMapping("/searchAtt")
	public String search(Long departId,String attendType,String beginTime,String endTime,Model model) {
		List<Attendance> list = attendService.search(departId, attendType, beginTime, endTime);
		model.addAttribute("atts", list);
		return "attendace/searchAttend";
	}
	 
}
