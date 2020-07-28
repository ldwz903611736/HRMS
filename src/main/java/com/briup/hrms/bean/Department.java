package com.briup.hrms.bean;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "t_department")
public class Department {
	@Id
	@GeneratedValue(strategy = IDENTITY)
	private Long id;
	private String name; // 部门名称
	private String describe;// 部门描述

	@OneToMany(mappedBy = "dept", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Employee> emps = new ArrayList<Employee>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public List<Employee> getEmps() {
		return emps;
	}

	public void setEmps(List<Employee> emps) {
		this.emps = emps;
	}
	public int getEmpSize() {
		return emps.size();
	}

}