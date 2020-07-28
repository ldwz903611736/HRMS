package com.briup.hrms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.briup.hrms.bean.Department;
import com.briup.hrms.bean.Employee;
import com.briup.hrms.dao.DepartmentDao;
import com.briup.hrms.dao.EmployeeDao;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private DepartmentDao departmentDao;
	public List<Employee> empList(String deptName,
			String username,
			String empId,
			String downSalary,
			String upSalary) {
//	
	
		 Specification<Employee> specification = new Specification<Employee>() {

			@Override
			public Predicate toPredicate(Root<Employee> root, 
					CriteriaQuery<?> query,
					CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				
                List<Predicate> predicates = new ArrayList<Predicate>();
				if(deptName!=null && !"".equals(deptName)) {
					 Department dept = departmentDao.findByName(deptName);
					 predicates.add(cb.equal(root.<String>get("dept"), dept));
					
				}
				if(username!=null && !"".equals(username)) {
                    predicates.add(cb.like(root.<String>get("name"), username));
				}
				if(empId!=null && !"".equals(empId)) {
                    predicates.add(cb.equal(root.<String>get("id"), empId));
				}
				if (downSalary != null && !"".equals(downSalary)) {
                    predicates.add(cb.greaterThan(root.<String>get("salary"), downSalary));
                }
				if (downSalary != null && !"".equals(downSalary)) {
                    predicates.add(cb.lessThan(root.<String>get("salary"), upSalary));
                }
                
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		 }	;
//		
		 
		 List<Employee> list = employeeDao.findAll(specification);
		 System.out.println("员工信息的模糊查询。。。。。");
		 list.forEach(System.out::println);
		return list;
		
	}
	
	public void save(Employee employee) {
		employee.setPassword("123");
		employeeDao.save(employee);
	}
	

	public Page<Employee> findAll(PageRequest pageRequest) {
		// TODO Auto-generated method stub
		return employeeDao.findAll(pageRequest);
	}
	
	public Employee findEmployeeById(Long id) {
		Optional<Employee> optional = employeeDao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}else {
			return null;
		}
	}
	
}
