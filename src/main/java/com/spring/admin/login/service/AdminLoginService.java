package com.spring.admin.login.service;

import com.spring.admin.login.vo.AdminLoginVO;
//관리자로그인서비스인터페이스
public interface AdminLoginService {
	
	public AdminLoginVO loginProcess(AdminLoginVO login);
}
