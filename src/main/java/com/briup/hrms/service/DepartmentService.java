package com.briup.hrms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.swing.plaf.nimbus.NimbusLookAndFeel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.briup.hrms.bean.Department;
import com.briup.hrms.dao.DepartmentDao;

@Service
public class DepartmentService {
	
	@Autowired
	DepartmentDao departmentDao;
	
	public List<Department> findAll(){
		return departmentDao.findAll();
	}
	
	public Page<Department> findAllByPage(PageRequest pageRequest){
		return departmentDao.findAll(pageRequest);
	}
	 
	
	public List<Department> search(Department department){
		Example<Department> example = Example.of(department);
		return departmentDao.findAll(example);
	}
	
	public void insert(Department department) {
		departmentDao.save(department);
	}
	
	public Department findById(Long id) {
		Optional<Department> optional = departmentDao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}else {
			return null;
		}
	}

	public void delete(Long id) {
		// TODO Auto-generated method stub
		departmentDao.deleteById(id);
	}
}
