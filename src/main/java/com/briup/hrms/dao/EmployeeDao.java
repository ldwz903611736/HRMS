package com.briup.hrms.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.briup.hrms.bean.Department;
import com.briup.hrms.bean.Employee;

public interface EmployeeDao extends JpaRepository<Employee,Long>,JpaSpecificationExecutor<Employee>{
	Employee findByNameAndPassword(String name,String password);
	
	List<Employee> findByDept(Department dept);
	
}