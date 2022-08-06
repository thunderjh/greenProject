package com.spring.admin.login.dao;

import com.spring.admin.login.vo.AdminLoginVO;
//관리자로그인DAO
public interface AdminLoginDao {
	
	public AdminLoginVO loginProcess(AdminLoginVO login);
}
