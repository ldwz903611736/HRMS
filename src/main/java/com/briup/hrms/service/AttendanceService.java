package com.briup.hrms.service;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.TimeZone;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.hrms.bean.Attendance;
import com.briup.hrms.bean.Department;
import com.briup.hrms.bean.Employee;
import com.briup.hrms.dao.AttendanceDao;
import com.briup.hrms.dao.AttendanceDao.SignData;

import javassist.expr.NewArray;

import com.briup.hrms.dao.DepartmentDao;
import com.briup.hrms.dao.EmployeeDao;

@Service
@Transactional
public class AttendanceService {

	@Autowired
	private AttendanceDao attendDao;
	
	@Autowired
	private DepartmentDao departmentDao;
	
	@Autowired
	private EmployeeDao employeeDao;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdfmat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		public List<SignData> getSignData(long empId,String monthStr){
			
			return attendDao.getSignData(empId, monthStr);
		}
		
		public void sign(Employee emp){
			Calendar instance = Calendar.getInstance();
			instance.set(Calendar.HOUR_OF_DAY, 9);//9点前签到
			instance.set(Calendar.MINUTE, 0);
			instance.set(Calendar.SECOND, 0);
			Date time = instance.getTime();
			Date now = new Date();
			Attendance attend = new Attendance();
			attend.setAttendTime(now);
			attend.setEmp(emp);
			//1 正常在职，2 请假，3 异常情况
			if(now.before(time)) {
				//正常上班，在职
				attend.setAttendState("1");
			}else {
				attend.setAttendState("3");
			}
			attendDao.save(attend);
		}
		
		public List<Attendance> searchTd(Date attendTime,Pageable pageable,Long departId,String attendType){
			Specification<Attendance> specification = new Specification<Attendance>() {

				@Override
				public Predicate toPredicate(Root<Attendance> root, 
						CriteriaQuery<?> query,
						CriteriaBuilder cb) {
					// TODO Auto-generated method stub
					
	                List<Predicate> predicates = new ArrayList<Predicate>();
					if(departId!=null) {
						List<Employee> employees = employeeDao.findByDept(departmentDao.findById(departId).get());
						Expression<String> exp = root.<String>get("emp");
						/* predicates.add(cb.in(root.<String>get("emp"), employees)); */
						predicates.add(exp.in(employees));
					}
					if(attendType!=null && !"".equals(attendType)) {
						if(StringUtils.equals(attendType, "在职")) {
							predicates.add(cb.equal(root.<String>get("attendState"), "1"));
						}else if(StringUtils.equals(attendType, "缺勤")) {
							predicates.add(cb.equal(root.<String>get("attendState"), "3"));
						}else if(StringUtils.equals(attendType, "请假")) {
							predicates.add(cb.equal(root.<String>get("attendState"), "2"));
						}
					}
					if (attendTime != null) {
	                    try {
	                    	String endTime = "3030-06-20 10:20:16";
							predicates.add(cb.between(root.get("attendTime"),
							        sdfmat.parse(sdfmat.format(attendTime.getTime())),
							        sdfmat.parse(sdfmat.format(sdf.parse(endTime).getTime() + 86400000))));
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
					
					return cb.and(predicates.toArray(new Predicate[predicates.size()]));
				}
			 }	;
			 
			 List<Attendance> list = attendDao.findAll(specification);
			 return list;
		}

		public Page<Attendance> todayAttend(Date attendTime,Pageable pageable) {
			
			
			// TODO Auto-generated method stub
			Page<Attendance> resPage = attendDao.findByAttendTimeAfter(attendTime,pageable); 
			return resPage;
		}
		
		public Page<Attendance> findAll(PageRequest pageRequest){
			return attendDao.findAll(pageRequest);
		}
		
		public List<Attendance> search(Long departId,String attendType,String beginTime,String endTime) {
			 Specification<Attendance> specification = new Specification<Attendance>() {

					@Override
					public Predicate toPredicate(Root<Attendance> root, 
							CriteriaQuery<?> query,
							CriteriaBuilder cb) {
						// TODO Auto-generated method stub
						
		                List<Predicate> predicates = new ArrayList<Predicate>();
						if(departId!=null) {
							List<Employee> employees = employeeDao.findByDept(departmentDao.findById(departId).get());
							Expression<String> exp = root.<String>get("emp");
							/* predicates.add(cb.in(root.<String>get("emp"), employees)); */
							predicates.add(exp.in(employees));
						}
						if(attendType!=null && !"".equals(attendType)) {
							if(StringUtils.equals(attendType, "在职")) {
								predicates.add(cb.equal(root.<String>get("attendState"), "1"));
							}else if(StringUtils.equals(attendType, "缺勤")) {
								predicates.add(cb.equal(root.<String>get("attendState"), "3"));
							}else if(StringUtils.equals(attendType, "请假")) {
								predicates.add(cb.equal(root.<String>get("attendState"), "2"));
							}
		      
						}
						if (StringUtils.isNotEmpty(beginTime) && StringUtils.isNotEmpty(endTime)) {
			                    try {
									predicates.add(cb.between(root.get("attendTime"),
									        sdfmat.parse(sdfmat.format(sdf.parse(beginTime).getTime())),
									        sdfmat.parse(sdfmat.format(sdf.parse(endTime).getTime() + 86400000))));
								} catch (ParseException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
			            }
		
						return cb.and(predicates.toArray(new Predicate[predicates.size()]));
					}
				 }	;
//				
				 
				 List<Attendance> list = attendDao.findAll(specification);
	
				 list.forEach(System.out::println);
				return list;
		}
}
