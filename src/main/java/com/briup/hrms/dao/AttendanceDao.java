package com.briup.hrms.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.briup.hrms.bean.Attendance;

public interface AttendanceDao extends JpaRepository<Attendance, Long>,
			JpaSpecificationExecutor<Attendance>{
//	Page<Attendance> findByAttendState(String attendState,Pageable pageable);
	//不包括模糊查询，查询今天的考勤
	Page<Attendance> findByAttendTimeAfter(Date attendTime,Pageable pageable);
	//包括模糊查询，查询今天的考勤
	Page<Attendance> findByAttendTimeAfter(Date attendTime,Specification sp,Pageable pageable);
	
	
	//不包括模糊查询，查询所有的考勤
	Page<Attendance> findAll(Pageable pageable);
	
	//包括模糊查询，查询所有的考勤
	Page<Attendance> findAll(Specification sp,Pageable pageable);
	

	 String SQL_SIGNDATA = "select "
	    		+ "to_char(ATTEND_TIME,'dd')  as signDay, "
	    		+ "ATTEND_STATE as status "
 		+ "from "
 			+ "t_attendance "
 		+ "where "
 			+ "emp_id=?1 "
 			+ "and "
 			+ "to_char(attend_time,'yyyy-MM') = ?2";
@Query(value=SQL_SIGNDATA,nativeQuery = true)
public List<SignData> getSignData(long empId,String monthStr);

//查询出的是字符串，会自动转为int数字，01这样的数字会自动变为1
	public interface SignData{
		public int getSignDay();
		public int getStatus();
	}
}