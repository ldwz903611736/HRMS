package com.briup.hrms.dao;

import java.util.List;

import org.hibernate.criterion.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.briup.hrms.bean.Department;

public interface DepartmentDao extends JpaRepository<Department, Long>,JpaSpecificationExecutor<Department>{
//	List<Department> findByNameLike(String name);
	Department findByName(String name);

}