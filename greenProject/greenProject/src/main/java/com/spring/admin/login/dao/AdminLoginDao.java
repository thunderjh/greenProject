package com.spring.admin.login.dao;

import com.spring.admin.login.vo.AdminLoginVO;

public interface AdminLoginDao {
	public AdminLoginVO loginProcess(AdminLoginVO login);
}
