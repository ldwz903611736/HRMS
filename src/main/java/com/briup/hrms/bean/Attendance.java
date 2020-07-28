package com.briup.hrms.bean;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_attendance")
public class Attendance {
	@Id
	@GeneratedValue(strategy = IDENTITY)
    private Long id;
    private Date attendTime;	//考勤时间
    private String attendState; //考勤状态，在职1、缺勤3、请假2
    
    @ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="emp_id")
    private Employee emp;		//多对一

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getAttendTime() {
        return attendTime;
    }

    public void setAttendTime(Date attendTime) {
        this.attendTime = attendTime;
    }

    public String getAttendState() {
        return attendState;
    }

    public void setAttendState(String attendState) {
        this.attendState = attendState;
    }

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}
}