package com.spring.admin.login.service;

import org.springframework.stereotype.Service;

import com.spring.admin.login.dao.AdminLoginDao;
import com.spring.admin.login.vo.AdminLoginVO;

import lombok.AllArgsConstructor;
//관리자로그인서비스클래스
@Service
@AllArgsConstructor
public class AdminLoginServiceImpl implements AdminLoginService {

	private AdminLoginDao adminLoginDao;

	@Override
	public AdminLoginVO loginProcess(AdminLoginVO login) {
		AdminLoginVO adminLogin = adminLoginDao.loginProcess(login);
		return adminLogin;
	}

}
