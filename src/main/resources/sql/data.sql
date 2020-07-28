-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department`(id,name,describe) VALUES (1, '人事部', '人事行政部,负责人员管理');
INSERT INTO `t_department`(id,name,describe) VALUES (2, '财务部门', '财务部门负责财务统计，结算，报销等各种。');
INSERT INTO `t_department`(id,name,describe) VALUES (3, '公司管理董事层', '该分组是公司所有董事层');
INSERT INTO `t_department`(id,name,describe) VALUES (4, '新部门', '新开的部门');


-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee`(id,name,password,gender,birthday,email,dept_id,role,salary,tel,info) VALUES (1, '张三', '123', '男', '2019-06-03', 'zs@briup.com', 3, '经理', 20000, '18512341234', '全村的希望');
INSERT INTO `t_employee`(id,name,password,gender,birthday,email,dept_id,role,salary,tel,info) VALUES (2, '李四', '123', '男', '2019-05-15', 'ls@briup.com', 1, '经理', 10000, '18512341234', 'hr');
INSERT INTO `t_employee`(id,name,password,gender,birthday,email,dept_id,role,salary,tel,info) VALUES (3, '王五', '123', '男', '2019-05-14', 'ww@briup.com', 1, '员工', 5000, '18512341234', 'hr手下的员工');
INSERT INTO `t_employee`(id,name,password,gender,birthday,email,dept_id,role,salary,tel,info) VALUES (4, '赵六', '123', '男', '2019-06-09', 'zl@briup.com', 1, '员工', 5000, '18512341234', 'hr手下的员工');
INSERT INTO `t_employee`(id,name,password,gender,birthday,email,dept_id,role,salary,tel,info) VALUES (5, '小张', '123', '男', '2019-06-04', 'xz@briup.com', 2, '经理', 20000, '18512341234', '财务');
INSERT INTO `t_employee`(id,name,password,gender,birthday,email,dept_id,role,salary,tel,info) VALUES (6, '小李', '123', '男', '2019-06-14', 'xl@briup.com', 2, '员工', 5000, '18512341234', '财务手下员工');
INSERT INTO `t_employee`(id,name,password,gender,birthday,email,dept_id,role,salary,tel,info) VALUES (7, '小红', '123', '女', '2019-06-15', 'xh@briup.com', 2, '员工', 6000, '18512341234', '财务手下员工');

-- ----------------------------
-- Records of t_attendance
-- ----------------------------
INSERT INTO `t_attendance`(id,attend_time,attend_state,emp_id) VALUES (1, '2019-06-11 10:19:49', '1', 1);
INSERT INTO `t_attendance`(id,attend_time,attend_state,emp_id) VALUES (2, '2019-06-12 10:20:01', '1', 1);
INSERT INTO `t_attendance`(id,attend_time,attend_state,emp_id) VALUES (3, '2019-06-14 10:20:09', '1', 1);
INSERT INTO `t_attendance`(id,attend_time,attend_state,emp_id) VALUES (4, '2019-06-23 10:20:16', '1', 1);
INSERT INTO `t_attendance`(id,attend_time,attend_state,emp_id) VALUES (5, '2020-06-20 10:20:16', '2', 1);


