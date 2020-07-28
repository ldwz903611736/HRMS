package com.briup.hrms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.hrms.bean.Employee;
import com.briup.hrms.dao.EmployeeDao;

@Service
public class LoginService {

	@Autowired
	EmployeeDao employeeDao;
	
	public Employee admin(String name,String passowrd) {
		return employeeDao.findByNameAndPassword(name, passowrd);
	}
}
